#ifndef __CONSTANTS_H__
#define __CONSTANTS_H__

#define MAX_DISP 32


#define IMG_ROWS                240
#define IMG_COLS                320
#define IMG_SIZE                76800 // IMG_ROWS * IMG_COLS

#define IMG_INDEX(x, y)         (((x) << 8) + ((x) << 6) + (y))
#define IS_IN_IMG_RANGE(i, j)   (((i) >= 0) && ((j) >= 0) && ((i) < IMG_ROWS) && ((j) < IMG_COLS))


#define COST_ROWS               MAX_DISP
#define COST_COLS               IMG_SIZE
#define COST_SIZE               2457600 // COST_ROWS * COST_COLS

#define COST_INDEX(x, y)        ((x << 16) + (x << 13) + (x << 11) + (x << 10)  + (y))
// #define COST_MAX                2147483647 // INT32MAX
#define COST_MAX                32767 // INT16MAX


#define BLOCK_ROWS              5
#define BLOCK_COLS              324 // IMG_COLS + 4
#define BLOCK_SIZE              1620 // BLOCK_ROWS * BLOCK_COLS


#define DISP_BLOCK_ROWS         IMG_COLS
#define DISP_BLOCK_COLS         MAX_DISP
#define DISP_BLOCK_SIZE         10240 // DISP_BLOCK_ROWS * DISP_BLOCK_COLS


#define BLOCK_INDEX(x, y)       (((x) << 8) + ((x) << 6) + ((x) << 2) + (y))


#define FRAG_SIZE               1000

#endif // __CONSTANTS_H__
