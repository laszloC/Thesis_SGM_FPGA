#ifndef __COMMON_H__
#define __COMMON_H__

#include <stdint.h>

template <class t>
class img_t
{
public:
	t* m_img;
	uint32_t m_rows;
	uint32_t m_cols;

	img_t(t* img, uint32_t rows, uint32_t cols);

	bool is_in_img_range(uint32_t i, uint32_t j);

	t& at(uint32_t i, uint32_t j);

};

template <class t>
img_t<t>::img_t(t* img, uint32_t rows, uint32_t cols)
{
	m_img = img;
	m_rows = rows;
	m_cols = cols;
}

template <class t>
bool img_t<t>::is_in_img_range(uint32_t i, uint32_t j)
{
	return (i >= 0 && j >= 0 && i < m_rows && j < m_cols);
}

template <class t>
t& img_t<t>::at(uint32_t i, uint32_t j)
{
	return m_img[i * m_cols + j];
}

template <class t>
void scale(img_t<t>& img, t in_start, t in_end, t out_start, t out_end)
{
	for (uint32_t i = 0; i < img.m_rows; i++) {
		for (uint32_t j = 0; j < img.m_cols; j++) {
			img.at(i, j) = out_start + ((out_end - out_start) / (in_end - in_start)) * (img.at(i, j) - in_start);
		}
	}
}

#endif // __COMMON_H__
