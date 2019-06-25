using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerformanceAnalyzer
{
    class SgmTime
    {
        public TimeSpan CostTime { get; set; }
        public TimeSpan AggrTime { get; set; }
        public TimeSpan DispTime { get; set; }
        public TimeSpan TotalTime { get; set; }
    }
}
