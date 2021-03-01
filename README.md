# Thesis_SGM_FPGA
FPGA implementation of Semi Global Matching algorithm, using High Level Synthesis

This reposiotory contains the implementation of my license thesis - a hardware implementation of Semi Global Matching for stereoscopic computer vision, using High Level Systesis as the hardware description strategy.

The thesis contains the following modules:
1. Software SGM - a software implementation of SGM, written in C/C++ and used a baseline for performance measurements - located under SoftwareSgm folder.
2. Hardware SGM: has two components:
  - ZynqClient - client application that communicates with FPGA boards - sends the commands and images to the hardware - located under ZynqClient folder
  - hardware code - hardware description of sgm - located under hw_ prefixed folders
3. performance analyzer - C# application which launches software and hardware SGM implementations and compares performances.
