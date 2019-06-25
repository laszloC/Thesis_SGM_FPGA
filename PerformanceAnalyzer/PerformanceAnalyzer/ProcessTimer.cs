using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace PerformanceAnalyzer
{
    class ProcessTimer
    {
        private Process process;
        public ProcessTimer(string fileName, string arguments, bool hasWindow)
        {
            process = new Process();
            // Configure process
            process.StartInfo.FileName = fileName;
            process.StartInfo.Arguments = arguments;
            process.StartInfo.WindowStyle = (hasWindow) ? ProcessWindowStyle.Normal : ProcessWindowStyle.Hidden;
        }

        public long RunProcess()
        {
            var watch = Stopwatch.StartNew();

            process.Start();
            process.WaitForExit();

            watch.Stop();
            return watch.ElapsedMilliseconds;
        }

    }
}
