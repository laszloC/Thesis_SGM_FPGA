// ==============================================================
// File generated on Fri May 31 13:44:42 +0300 2019
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


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "D_BUS"
#define AUTOTB_TVIN_D_BUS  "../tv/cdatafile/c.inverse_img.autotvin_D_BUS.dat"
#define AUTOTB_TVOUT_D_BUS  "../tv/cdatafile/c.inverse_img.autotvout_D_BUS.dat"
// wrapc file define: "img_in"
#define AUTOTB_TVIN_img_in  "../tv/cdatafile/c.inverse_img.autotvin_img_in.dat"
// wrapc file define: "img_out"
#define AUTOTB_TVIN_img_out  "../tv/cdatafile/c.inverse_img.autotvin_img_out.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "D_BUS"
#define AUTOTB_TVOUT_PC_D_BUS  "../tv/rtldatafile/rtl.inverse_img.autotvout_D_BUS.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			D_BUS_depth = 0;
			img_in_depth = 0;
			img_out_depth = 0;
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
			total_list << "{D_BUS " << D_BUS_depth << "}\n";
			total_list << "{img_in " << img_in_depth << "}\n";
			total_list << "{img_out " << img_out_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int D_BUS_depth;
		int img_in_depth;
		int img_out_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void inverse_img (
unsigned char img_in[42300],
unsigned char img_out[42300]);

void AESL_WRAP_inverse_img (
unsigned char img_in[42300],
unsigned char img_out[42300])
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


		// output port post check: "D_BUS"
		aesl_fh.read(AUTOTB_TVOUT_PC_D_BUS, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_D_BUS, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_D_BUS, AESL_token); // data

			sc_bv<8> *D_BUS_pc_buffer = new sc_bv<8>[84600];
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'D_BUS', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'D_BUS', possible cause: There are uninitialized variables in the C design." << endl;
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
					D_BUS_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_D_BUS, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_D_BUS))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: D_BUS
				{
					// bitslice(7, 0)
					// {
						// celement: img_in(7, 0)
						// {
							sc_lv<8>* img_in_lv0_0_42299_1 = new sc_lv<8>[84600];
						// }
						// celement: img_out(7, 0)
						// {
							sc_lv<8>* img_out_lv0_0_42299_1 = new sc_lv<8>[84600];
						// }
					// }

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: img_in(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								hls_map_index++;
							}
						}
						// celement: img_out(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								if (&(img_out[0]) != NULL) // check the null address if the c port is array or others
								{
									img_out_lv0_0_42299_1[hls_map_index].range(7, 0) = sc_bv<8>(D_BUS_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: img_in(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : img_in[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : img_in[0]
								// output_left_conversion : img_in[i_0]
								// output_type_conversion : (img_in_lv0_0_42299_1[hls_map_index]).to_uint64()
								hls_map_index++;
							}
						}
						// celement: img_out(7, 0)
						{
							// carray: (0) => (42299) @ (1)
							for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : img_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : img_out[0]
								// output_left_conversion : img_out[i_0]
								// output_type_conversion : (img_out_lv0_0_42299_1[hls_map_index]).to_uint64()
								if (&(img_out[0]) != NULL) // check the null address if the c port is array or others
								{
									img_out[i_0] = (img_out_lv0_0_42299_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] D_BUS_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "D_BUS"
		char* tvin_D_BUS = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_D_BUS);
		char* tvout_D_BUS = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_D_BUS);

		// "img_in"
		char* tvin_img_in = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_img_in);

		// "img_out"
		char* tvin_img_out = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_img_out);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_D_BUS, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_D_BUS, tvin_D_BUS);

		sc_bv<8>* D_BUS_tvin_wrapc_buffer = new sc_bv<8>[84600];

		// RTL Name: D_BUS
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: img_in(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_in[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_in[0]
						// regulate_c_name       : img_in
						// input_type_conversion : img_in[i_0]
						if (&(img_in[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_in_tmp_mem;
							img_in_tmp_mem = img_in[i_0];
							D_BUS_tvin_wrapc_buffer[hls_map_index].range(7, 0) = img_in_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
				// celement: img_out(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_out[0]
						// regulate_c_name       : img_out
						// input_type_conversion : img_out[i_0]
						if (&(img_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_out_tmp_mem;
							img_out_tmp_mem = img_out[i_0];
							D_BUS_tvin_wrapc_buffer[hls_map_index].range(7, 0) = img_out_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 84600; i++)
		{
			sprintf(tvin_D_BUS, "%s\n", (D_BUS_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_D_BUS, tvin_D_BUS);
		}

		tcl_file.set_num(84600, &tcl_file.D_BUS_depth);
		sprintf(tvin_D_BUS, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_D_BUS, tvin_D_BUS);

		// release memory allocation
		delete [] D_BUS_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_img_in, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_img_in, tvin_img_in);

		sc_bv<32> img_in_tvin_wrapc_buffer;

		// RTL Name: img_in
		{
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_img_in, "%s\n", (img_in_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_img_in, tvin_img_in);
		}

		tcl_file.set_num(1, &tcl_file.img_in_depth);
		sprintf(tvin_img_in, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_img_in, tvin_img_in);

		// [[transaction]]
		sprintf(tvin_img_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_img_out, tvin_img_out);

		sc_bv<32> img_out_tvin_wrapc_buffer;

		// RTL Name: img_out
		{
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_img_out, "%s\n", (img_out_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_img_out, tvin_img_out);
		}

		tcl_file.set_num(1, &tcl_file.img_out_depth);
		sprintf(tvin_img_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_img_out, tvin_img_out);

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		inverse_img(img_in, img_out);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_D_BUS, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_D_BUS, tvout_D_BUS);

		sc_bv<8>* D_BUS_tvout_wrapc_buffer = new sc_bv<8>[84600];

		// RTL Name: D_BUS
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: img_in(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_in[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_in[0]
						// regulate_c_name       : img_in
						// input_type_conversion : img_in[i_0]
						if (&(img_in[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_in_tmp_mem;
							img_in_tmp_mem = img_in[i_0];
							D_BUS_tvout_wrapc_buffer[hls_map_index].range(7, 0) = img_in_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
				// celement: img_out(7, 0)
				{
					// carray: (0) => (42299) @ (1)
					for (int i_0 = 0; i_0 <= 42299; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : img_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : img_out[0]
						// regulate_c_name       : img_out
						// input_type_conversion : img_out[i_0]
						if (&(img_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> img_out_tmp_mem;
							img_out_tmp_mem = img_out[i_0];
							D_BUS_tvout_wrapc_buffer[hls_map_index].range(7, 0) = img_out_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 84600; i++)
		{
			sprintf(tvout_D_BUS, "%s\n", (D_BUS_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_D_BUS, tvout_D_BUS);
		}

		tcl_file.set_num(84600, &tcl_file.D_BUS_depth);
		sprintf(tvout_D_BUS, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_D_BUS, tvout_D_BUS);

		// release memory allocation
		delete [] D_BUS_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "D_BUS"
		delete [] tvin_D_BUS;
		delete [] tvout_D_BUS;
		// release memory allocation: "img_in"
		delete [] tvin_img_in;
		// release memory allocation: "img_out"
		delete [] tvin_img_out;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

