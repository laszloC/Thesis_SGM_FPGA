using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;
using Emgu.CV;
using Emgu.CV.CvEnum;

namespace PerformanceAnalyzer
{
    class ResultAnalyzer
    {
        private Mat depthMap;
        private Mat groundTruth;

        public ResultAnalyzer(string depthMap, string groundTruth)
        {
            this.depthMap = new Mat(depthMap, ImreadModes.Grayscale);
            this.groundTruth = new Mat(groundTruth, ImreadModes.Grayscale);
        }

        public double GetRmsError()
        {
            double rms = 0;
            double n = depthMap.Rows * depthMap.Cols;

            Matrix<byte> dmMatrix = new Matrix<byte>(depthMap.Rows, depthMap.Cols, depthMap.NumberOfChannels);
            depthMap.CopyTo(dmMatrix);

            Matrix<byte> gtMatrix = new Matrix<byte>(groundTruth.Rows, groundTruth.Cols, groundTruth.NumberOfChannels);
            groundTruth.CopyTo(gtMatrix);

            for (int i = 0; i < depthMap.Rows; i++)
            {
                for (int j = 0; j < depthMap.Cols; j++)
                {
                    var d = dmMatrix[i, j];
                    var t = gtMatrix[i, j];

                    if (d == 0)
                    {
                        n--;
                    }
                    else
                    {
                        var r = (Math.Abs(d - t));
                        rms += (r * r);
                    }
                }
            }

            return Math.Sqrt(rms / n);
        }

        public double GetBadMatchesPercentage(int tolerance)
        {
            double badPixels = 0;
            double n = depthMap.Rows * depthMap.Cols;

            Matrix<byte> dmMatrix = new Matrix<byte>(depthMap.Rows, depthMap.Cols, depthMap.NumberOfChannels);
            depthMap.CopyTo(dmMatrix);

            Matrix<byte> gtMatrix = new Matrix<byte>(groundTruth.Rows, groundTruth.Cols, groundTruth.NumberOfChannels);
            groundTruth.CopyTo(gtMatrix);

            for (int i = 0; i < depthMap.Rows; i++)
            {
                for (int j = 0; j < depthMap.Cols; j++)
                {
                    var d = dmMatrix[i, j];
                    var t = gtMatrix[i, j];

                    var r = (Math.Abs(d - t));
                    if (d == 0)
                    {
                        n--;
                    }
                    if (r > tolerance && d != 0)
                    {
                        badPixels++;
                    }
                }
            }

            return badPixels / n * 100;
        }
    }
}
