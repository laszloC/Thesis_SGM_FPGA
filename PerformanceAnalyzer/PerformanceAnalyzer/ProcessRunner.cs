using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using Newtonsoft.Json.Linq;

namespace PerformanceAnalyzer
{
    class ProcessRunner
    {
        private Process process;
        private string timeResultsPath;

        public ProcessRunner(string fileName, string arguments, bool hasWindow, string timeResultsPath)
        {
            process = new Process();
            this.timeResultsPath = timeResultsPath;
            // Configure process
            process.StartInfo.FileName = fileName;
            process.StartInfo.Arguments = arguments;
            process.StartInfo.WindowStyle = (hasWindow) ? ProcessWindowStyle.Normal : ProcessWindowStyle.Hidden;
        }

        public SgmTime RunProcess()
        {
            process.Start();
            process.WaitForExit();
            string lines = System.IO.File.ReadAllText(timeResultsPath);

            dynamic results = JObject.Parse(lines);

            SgmTime time = new SgmTime();
            time.CostTime = TimeSpan.FromMilliseconds((double)results.cost_time / 1000);
            time.AggrTime = TimeSpan.FromMilliseconds((double)results.aggr_time / 1000);
            time.DispTime = TimeSpan.FromMilliseconds((double)results.disp_time / 1000);
            time.TotalTime = TimeSpan.FromMilliseconds((double)results.total_time / 1000);

            return time;
        }
    }
}
