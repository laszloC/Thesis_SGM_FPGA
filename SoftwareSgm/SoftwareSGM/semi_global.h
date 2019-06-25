#pragma once

#include "common.h"

namespace cost_aggregator
{

    // returns the aggregated cost matrix in 8 directions
    Mat AggregateCosts(Mat& C, const int Rows, const int Cols, const int P1, const int P2);

    void AggregateTopDown(Mat& Original, Mat& Aggregated, const int Rows, const int Cols, const int P1, const int P2);

    void AggregateBottomUp(Mat& Original, Mat& Aggregated, const int Rows, const int Cols, const int P1, const int P2);

    void AggregateOnPath(Mat& Cost, Mat& Aggregated, Mat& TempL, Mat& TempMinL, const int I, const int J,
        const int Rows, const int Cols, const int R, const int P1, const int P2, const int MaxDisp);

    int MinCost(Mat& TempL, const int I, const int R, const int D, const int P1, const int P2, const int MaxDisp);

} // namespace semi_global
