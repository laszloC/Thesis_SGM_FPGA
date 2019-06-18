using System;

namespace PerformanceAnalyzer
{
    class RunResults
    {
        public string InputLeftPath { get; set; }

        public string InputRightPath { get; set; }

        public string InputGroundThruthPath { get; set; }

        public string ResultSWDepthMapPath { get; set; }

        public string ResultHWDepthMapPath { get; set; }

        public TimeSpan ResultSWTime { get; set; }

        public int ResultSWRms { get; set; }

        public int ResultSWBadMatches { get; set; }

        public TimeSpan ResultHWTime { get; set; }

        public int ResultHWRms { get; set; }

        public int ResultHWBadMatches { get; set; }

        public double ResultHWSpeedup { get; set; }
    }
}
