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

        public int MaxDisp { get; set; }

        public int P1 { get; set; }

        public int P2 { get; set; }

        public SgmTime ResultSWTime { get; set; }

        public double ResultSWRms { get; set; }

        public double ResultSWBadMatches { get; set; }

        public SgmTime ResultHWTime { get; set; }

        public double ResultHWRms { get; set; }

        public double ResultHWBadMatches { get; set; }

        public double ResultHWSpeedup { get; set; }

        public string Dump()
        {
            return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
        }
    }
}
