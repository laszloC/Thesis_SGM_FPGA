#include "stdafx.h"

#include "common.h"
#include <CommDlg.h>
#include <ShlObj.h>
#include <bitset>

FileGetter::FileGetter(char* folderin,char* ext){
    strcpy(folder,folderin);
    char folderstar[MAX_PATH];
    if( !ext ) strcpy(ext,"*");
    sprintf(folderstar,"%s\\*.%s",folder,ext);
    hfind = FindFirstFileA(folderstar,&found);
    hasFiles= !(hfind == INVALID_HANDLE_VALUE);
    first = 1;
    //skip .
    //FindNextFileA(hfind,&found);
}

int FileGetter::getNextFile(char* fname){
    if (!hasFiles)
        return 0;
    //skips .. when called for the first time
    if( first )
    {
        strcpy(fname, found.cFileName);
        first = 0;
        return 1;
    }
    else{
        chk=FindNextFileA(hfind,&found);
        if (chk)
            strcpy(fname, found.cFileName);
        return chk;
    }
}

int FileGetter::getNextAbsFile(char* fname){
    if (!hasFiles)
        return 0;
    //skips .. when called for the first time
    if( first )
    {
        sprintf(fname, "%s\\%s", folder, found.cFileName);
        first = 0;
        return 1;
    }
    else{
        chk=FindNextFileA(hfind,&found);
        if (chk)
            sprintf(fname, "%s\\%s", folder, found.cFileName);
        return chk;
    }
}

char* FileGetter::getFoundFileName(){
    if (!hasFiles)
        return 0;
    return found.cFileName;
}


int openFileDlg(char* fname)
{
    char *filter = "All Files (*.*)\0*.*\0";
    HWND owner = NULL;
    OPENFILENAME ofn;
    char fileName[MAX_PATH];
    strcpy(fileName,"");
    ZeroMemory(&ofn, sizeof(ofn));
    ofn.lStructSize = sizeof(OPENFILENAME);
    ofn.hwndOwner = owner;
    ofn.lpstrFilter = filter;
    ofn.lpstrFile = fileName;
    ofn.nMaxFile = MAX_PATH;
    ofn.Flags = OFN_EXPLORER | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;
    ofn.lpstrDefExt = "";
    GetOpenFileName(&ofn);
    strcpy(fname,ofn.lpstrFile);
    return strcmp(fname,"");
}

int openFolderDlg(char *folderName)
{
    BROWSEINFO bi;
    ZeroMemory(&bi, sizeof(bi));
    SHGetPathFromIDList(SHBrowseForFolder(&bi),folderName);
    return strcmp(folderName,"");
}

void resizeImg(Mat src, Mat &dst, int maxSize, bool interpolate)
{
    double ratio = 1;
    double w = src.cols;
    double h = src.rows;
    if (w>h)
        ratio = w/(double)maxSize;
    else
        ratio = h/(double)maxSize;
    int nw = (int) (w / ratio);
    int nh = (int) (h / ratio);
    Size sz(nw,nh);
    if (interpolate)
        resize(src,dst,sz);
    else
        resize(src,dst,sz,0,0,INTER_NEAREST);
}

bool IsInImgRange(const int Row, const int Col, const Mat& Img)
{
    return (Row >= 0 && Col >= 0 && Row < Img.rows && Col < Img.cols);
}

bool IsInImgRange(const int Row, const int Col, const int Rows, const int Cols)
{
    return (Row >= 0 && Col >= 0 && Row < Rows && Col < Cols);
}

void Scale(Mat& Img, int InStart, int InEnd, int OutStart, int OutEnd)
{
    for (auto i = 0; i < Img.rows; i++)
    {
        for (auto j = 0; j < Img.cols; j++)
        {
            Img.at<uchar>(i, j) = OutStart + ((OutEnd - OutStart) / (InEnd - InStart)) * (Img.at<uchar>(i, j) - InStart);
        }
    }
}

Mat OpenGrayscaleImage()
{
    char fileName[MAX_PATH];

    if (!openFileDlg(fileName))
    {
        throw std::exception("Cannot open file");
    }

    return imread(fileName, CV_LOAD_IMAGE_GRAYSCALE);
}

Mat OpenGrayscaleImage(const std::string& Path)
{
    return imread(Path, CV_LOAD_IMAGE_GRAYSCALE);
}

int compare(const void* a, const void* b)
{
    return (*(int*)a) - (*(int*)b);
}

void MedianFilter(Mat img, int w)
{
    int height = img.rows;
    int width = img.cols;

    Mat dst = Mat(height, width, CV_8UC1);

    int w_2 = w / 2;

    int* ord_stat = new int[w];

    for (int i = w_2; i < height - w_2; ++i)
    {
        for (int j = w_2; j < width - w_2; ++j)
        {
            int k = 0;

            for (int m = 0; m < w; ++m)
            {
                for (int n = 0; n < w; ++n)
                {
                    ord_stat[m + n] = 0;
                }
            }

            // create ordered statistic

            for (int x = -w_2; x <= w_2; ++x)
            {
                for (int y = -w_2; y <= w_2; ++y)
                {
                    ord_stat[k++] = img.at<uchar>(i + y, j + x);
                }
            }

            // sort ordered statistic
            std::qsort(ord_stat, w * w, sizeof(int), compare);

            // pixel will have the median value
            dst.at<uchar>(i, j) = ord_stat[(w * w) / 2];
        }
    }

    img = dst;
}

int RowMajorIndex(const int I, const int J, const int Cols)
{
    return I * Cols + J;
}


void SetBitValue(int& BitMap, const int Bit, const bool Value)
{
    BitMap |= (Value << Bit);
}

int HammingDistance(const int A, const int B)
{
    return (int)std::bitset<32>((uint)A ^ (uint)B).count();
}

Mat ComputeDepthMap(const Mat& Cost, const int Rows, const int Cols)
{
    Mat depthMap(Rows, Cols, CV_8UC1);

    for (auto i = 0; i < Rows; i++)
    {
        for (auto j = 0; j < Cols; j++)
        {
            int minD = Cost.cols + 1;
            int minCost = INT8_MAX;
            for (auto d = 0; d < Cost.cols; d++)
            {
                int p = RowMajorIndex(i, j, Cols);
                if (Cost.at<int>(p, d) < minCost)
                {
                    minCost = Cost.at<int>(p, d);
                    minD = d;
                }
            }
            depthMap.at<uchar>(i, j) = minD;
        }
    }

    return depthMap;
}
