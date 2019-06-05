// ==============================================================
// File generated on Wed Jun 05 20:04:11 +0300 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->
extern int img_cost[1269000];



// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "DC_BUS"
#define AUTOTB_TVIN_DC_BUS  "../tv/cdatafile/c.comp_d_map.autotvin_DC_BUS.dat"
#define AUTOTB_TVOUT_DC_BUS  "../tv/cdatafile/c.comp_d_map.autotvout_DC_BUS.dat"
// wrapc file define: "img_left"
#define AUTOTB_TVIN_img_left  "../tv/cdatafile/c.comp_d_map.autotvin_img_left.dat"
// wrapc file define: "img_right"
#define AUTOTB_TVIN_img_right  "../tv/cdatafile/c.comp_d_map.autotvin_img_right.dat"
// wrapc file define: "disp_out"
#define AUTOTB_TVIN_disp_out  "../tv/cdatafile/c.comp_d_map.autotvin_disp_out.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "DC_BUS"
#define AUTOTB_TVOUT_PC_DC_BUS  "../tv/rtldatafile/rtl.comp_d_map.autotvout_DC_BUS.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			DC_BUS_depth = 0;
			img_left_depth = 0;
			img_right_depth = 0;
			disp_out_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{DC_BUS " << DC_BUS_depth << "}\n";
			total_list << "{img_left " << img_left_depth << "}\n";
			total_list << "{img_right " << img_right_depth << "}\n";
			total_list << "{disp_out " << disp_out_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int DC_BUS_depth;
		int img_left_depth;
		int img_right_depth;
		int disp_out_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void comp_d_map (
unsigned char* img_left,
unsigned char* img_right,
unsigned char* disp_out);

void AESL_WRAP_comp_d_map (
unsigned char* img_left,
unsigned char* img_right,
unsigned char* disp_out)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "DC_BUS"
		aesl_fh.read(AUTOTB_TVOUT_PC_DC_BUS, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_DC_BUS, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_DC_BUS, AESL_token); // data

			sc_bv<8> *DC_BUS_pc_buffer = new sc_bv<8>[126900];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'DC_BUS', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'DC_BUS', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					DC_BUS_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_DC_BUS, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_DC_BUS))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: DC_BUS
				{
					// bitslice(7, 0)
					// {
						// celement: img_left(7, 0)
						// {
							sc_lv<8>* img_left_lv0_0_42299_1 = new sc_lv<8>[126900];
						// }
						// celement: img_right(7, 0)
						// {
							sc_lv<8>* img_right_lv0_0_42299_1 = new sc_lv<8>[126900];
						// }
						// celement: disp_out(7, 0)
						// {
							sc_lv<8>* disp_out_lv0_0_42299_1 = new sc_lv<8>[126900];
						// }
					// }

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: img_left(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								if (&(img_left[0]) != NULL) // check the null address if the c port is array or others
								{
									img_left_lv0_0_42299_1[hls_map_index].range(7, 0) = sc_bv<8>(DC_BUS_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
						// celement: img_right(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								if (&(img_right[0]) != NULL) // check the null address if the c port is array or others
								{
									img_right_lv0_0_42299_1[hls_map_index].range(7, 0) = sc_bv<8>(DC_BUS_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
						// celement: disp_out(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								if (&(disp_out[0]) != NULL) // check the null address if the c port is array or others
								{
									disp_out_lv0_0_42299_1[hls_map_index].range(7, 0) = sc_bv<8>(DC_BUS_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: img_left(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : img_left[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : img_left[0]
								// output_left_conversion : img_left[i_0]
								// output_type_conversion : (img_left_lv0_0_42299_1[hls_map_index]).to_uint64()
								if (&(img_left[0]) != NULL) // check the null address if the c port is array or others
								{
									img_left[i_0] = (img_left_lv0_0_42299_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
						// celement: img_right(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : img_right[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : img_right[0]
								// output_left_conversion : img_right[i_0]
								// output_type_conversion : (img_right_lv0_0_42299_1[hls_map_index]).to_uint64()
								if (&(img_right[0]) != NULL) // check the null address if the c port is array or others
								{
									img_right[i_0] = (img_right_lv0_0_42299_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
						// celement: disp_out(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : disp_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : disp_out[0]
								// output_left_conversion : disp_out[i_0]
								// output_type_conversion : (disp_out_lv0_0_42299_1[hls_map_index]).to_uint64()
								if (&(disp_out[0]) != NULL) // check the null address if the c port is array or others
								{
									disp_out[i_0] = (disp_out_lv0_0_42299_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] DC_BUS_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "DC_BUS"
		char* tvin_DC_BUS = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_DC_BUS);
		char* tvout_DC_BUS = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_DC_BUS);

		// "img_left"
		char* tvin_img_left = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_img_left);

		// "img_right"
		char* tvin_img_right = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_img_right);

		// "disp_out"
		char* tvin_disp_out = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_disp_out);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_DC_BUS, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_DC_BUS, tvin_DC_BUS);

		sc_bv<8>* DC_BUS_tvin_wrapc_buffer = new sc_bv<8>[126900];

		// RTL Name: DC_BUS
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: img_left(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_left[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_left[0]
						// regulate_c_name       : img_left
						// input_type_conversion : img_left[i_0]
						if (&(img_left[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_left_tmp_mem;
							img_left_tmp_mem = img_left[i_0];
							DC_BUS_tvin_wrapc_buffer[hls_map_index].range(7, 0) = img_left_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
				// celement: img_right(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_right[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_right[0]
						// regulate_c_name       : img_right
						// input_type_conversion : img_right[i_0]
						if (&(img_right[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_right_tmp_mem;
							img_right_tmp_mem = img_right[i_0];
							DC_BUS_tvin_wrapc_buffer[hls_map_index].range(7, 0) = img_right_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
				// celement: disp_out(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : disp_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : disp_out[0]
						// regulate_c_name       : disp_out
						// input_type_conversion : disp_out[i_0]
						if (&(disp_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> disp_out_tmp_mem;
							disp_out_tmp_mem = disp_out[i_0];
							DC_BUS_tvin_wrapc_buffer[hls_map_index].range(7, 0) = disp_out_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 126900; i++)
		{
			sprintf(tvin_DC_BUS, "%s\n", (DC_BUS_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_DC_BUS, tvin_DC_BUS);
		}

		tcl_file.set_num(126900, &tcl_file.DC_BUS_depth);
		sprintf(tvin_DC_BUS, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_DC_BUS, tvin_DC_BUS);

		// release memory allocation
		delete [] DC_BUS_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_img_left, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_img_left, tvin_img_left);

		sc_bv<32> img_left_tvin_wrapc_buffer;

		// RTL Name: img_left
		{
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_img_left, "%s\n", (img_left_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_img_left, tvin_img_left);
		}

		tcl_file.set_num(1, &tcl_file.img_left_depth);
		sprintf(tvin_img_left, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_img_left, tvin_img_left);

		// [[transaction]]
		sprintf(tvin_img_right, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_img_right, tvin_img_right);

		sc_bv<32> img_right_tvin_wrapc_buffer;

		// RTL Name: img_right
		{
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_img_right, "%s\n", (img_right_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_img_right, tvin_img_right);
		}

		tcl_file.set_num(1, &tcl_file.img_right_depth);
		sprintf(tvin_img_right, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_img_right, tvin_img_right);

		// [[transaction]]
		sprintf(tvin_disp_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_disp_out, tvin_disp_out);

		sc_bv<32> disp_out_tvin_wrapc_buffer;

		// RTL Name: disp_out
		{
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_disp_out, "%s\n", (disp_out_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_disp_out, tvin_disp_out);
		}

		tcl_file.set_num(1, &tcl_file.disp_out_depth);
		sprintf(tvin_disp_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_disp_out, tvin_disp_out);

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		comp_d_map(img_left, img_right, disp_out);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_DC_BUS, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_DC_BUS, tvout_DC_BUS);

		sc_bv<8>* DC_BUS_tvout_wrapc_buffer = new sc_bv<8>[126900];

		// RTL Name: DC_BUS
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: img_left(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_left[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_left[0]
						// regulate_c_name       : img_left
						// input_type_conversion : img_left[i_0]
						if (&(img_left[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_left_tmp_mem;
							img_left_tmp_mem = img_left[i_0];
							DC_BUS_tvout_wrapc_buffer[hls_map_index].range(7, 0) = img_left_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
				// celement: img_right(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_right[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_right[0]
						// regulate_c_name       : img_right
						// input_type_conversion : img_right[i_0]
						if (&(img_right[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_right_tmp_mem;
							img_right_tmp_mem = img_right[i_0];
							DC_BUS_tvout_wrapc_buffer[hls_map_index].range(7, 0) = img_right_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
				// celement: disp_out(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : disp_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : disp_out[0]
						// regulate_c_name       : disp_out
						// input_type_conversion : disp_out[i_0]
						if (&(disp_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> disp_out_tmp_mem;
							disp_out_tmp_mem = disp_out[i_0];
							DC_BUS_tvout_wrapc_buffer[hls_map_index].range(7, 0) = disp_out_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 126900; i++)
		{
			sprintf(tvout_DC_BUS, "%s\n", (DC_BUS_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_DC_BUS, tvout_DC_BUS);
		}

		tcl_file.set_num(126900, &tcl_file.DC_BUS_depth);
		sprintf(tvout_DC_BUS, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_DC_BUS, tvout_DC_BUS);

		// release memory allocation
		delete [] DC_BUS_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "DC_BUS"
		delete [] tvin_DC_BUS;
		delete [] tvout_DC_BUS;
		// release memory allocation: "img_left"
		delete [] tvin_img_left;
		// release memory allocation: "img_right"
		delete [] tvin_img_right;
		// release memory allocation: "disp_out"
		delete [] tvin_disp_out;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

