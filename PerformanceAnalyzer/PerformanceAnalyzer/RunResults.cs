using System;

namespace PerformanceAnalyzer
{
    class RunResults
    {
        string InputLeftPath { get; set; }

        string InputRightPath { get; set; }

        string InputGroundThruthPath { get; set; }

        string ResultSWDepthMapPath { get; set; }

        string ResultHWDepthMapPath { get; set; }

        TimeSpan ResultSWTime { get; set; }

        int ResultSWRms { get; set; }

        int ResultSWBadMatches { get; set; }

        TimeSpan ResultHWTime { get; set; }

        int ResultHWRms { get; set; }

        int ResultHWBadMatches { get; set; }

        double ResultHWSpeedup { get; set; }
    }
}
