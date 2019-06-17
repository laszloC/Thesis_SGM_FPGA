#ifndef __CONSTANTS_H__
#define __CONSTANTS_H__

#define IMG_ROWS 188
#define IMG_COLS 225

#define MAX_DISP 30

#define IMG_SIZE (IMG_ROWS * IMG_COLS)

#define COST_SIZE (IMG_SIZE * MAX_DISP)

#define IS_IN_IMG_RANGE(i, j) (((i) >= 0) && ((j) >= 0) && ((i) < IMG_ROWS) && ((j) < IMG_COLS))

#define ABS_VAL(x) (((x) < 0) ? -(x) : (x))

//#define INF 2147483647

#define INF 32767

#endif // __CONSTANTS_H__
