#include "hls_stream.h"
#include "ap_int.h"
#include "ap_utils.h"
#include "ap_axi_sdata.h"


//HLS Pre-processing
#define PACKET_START 0
#define PACKET_MIDDLE 1
#define PACKET_END 2
#define DROP_PACKET 3

struct net_data
{
	ap_uint<512> data;
	ap_uint<64> keep;
	ap_uint<1> last;
};
struct net_data_out
{
	ap_uint<512> data;
	ap_uint<64> keep;
	ap_uint<1> last;
	ap_uint<16> id;
	ap_uint<16> dest;
	ap_uint<32> user;
};

void vxlan_bridge
(
    hls::stream<net_data> &network_in,
	hls::stream<net_data_out> &network_out,
	hls::stream<net_data> &user_in,
	hls::stream<net_data> &user_out,
	ap_uint<24> vni,
	ap_uint<32> ip_addr,
	ap_uint<16> local_port,
	ap_uint<16> remote_port
)
{

#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS resource core=AXI4Stream variable=network_in
#pragma HLS DATA_PACK variable=network_in
#pragma HLS resource core=AXI4Stream variable=network_out
#pragma HLS DATA_PACK variable=network_out
#pragma HLS resource core=AXI4Stream variable=user_in
#pragma HLS DATA_PACK variable=user_in
#pragma HLS resource core=AXI4Stream variable=user_out
#pragma HLS DATA_PACK variable=user_out

	static ap_uint<4> net_input_stage = PACKET_START;
	static ap_uint<4> usr_input_stage = PACKET_START;
	static net_data net_input_overflow;
	static net_data usr_input_overflow;
	net_data net_input_buf;
	net_data usr_input_buf;
	net_data_out net_output_buf;
	net_data usr_output_buf;
	net_output_buf.id = local_port;
	net_output_buf.dest = remote_port;
	net_output_buf.user = ip_addr;
	switch (net_input_stage)
	{
	case PACKET_START:
		if (!network_in.empty() && !user_out.full())
		{
			net_input_buf = network_in.read();
			usr_output_buf.data.range(511,64)=net_input_buf.data.range(447,0);
			usr_output_buf.data.range(63,0)=0;
			usr_output_buf.keep.range(63,8)=net_input_buf.keep.range(55,0);
			usr_output_buf.keep.range(7,0)=0;
			usr_output_buf.last = 1;
			if (net_input_buf.data.range(479,456)==vni)
			{
				if (net_input_buf.last == 1)
				{
					net_input_stage = PACKET_START;
					user_out.write(usr_output_buf);
				}
				else
				{
					net_input_stage = PACKET_MIDDLE;
				}
			}
			else
			{
				net_input_stage = (net_input_buf.last == 1) ? PACKET_START : DROP_PACKET;
			}
			net_input_overflow = net_input_buf;
		}
		break;
	case DROP_PACKET:
		if (!network_in.empty())
		{
			net_input_buf = network_in.read();
			net_input_stage = (net_input_buf.last == 1)? PACKET_START:DROP_PACKET;
		}
		break;
	case PACKET_MIDDLE:
		if (!network_in.empty() && !user_out.full())
		{
			net_input_buf = network_in.read();
			usr_output_buf.data.range(511,64)=net_input_overflow.data.range(447,0);
			usr_output_buf.data.range(63,0)=net_input_buf.data.range(511,448);
			usr_output_buf.keep.range(63,8)=net_input_overflow.keep.range(55,0);
			usr_output_buf.keep.range(7,0)=net_input_buf.keep.range(63,56);
			user_out.write(usr_output_buf);
			if (net_input_buf.last == 0)
			{
				net_input_stage = PACKET_MIDDLE;
				usr_output_buf.last = 0;
				net_input_overflow = net_input_buf;
			}
			else if (net_input_buf.keep.bit(55)==0)
			{
				net_input_stage = PACKET_START;
				usr_output_buf.last = 1;
			}
			else
			{
				net_input_stage = PACKET_END;
				usr_output_buf.last = 0;
				net_input_overflow = net_input_buf;
			}

		}
		break;
	case PACKET_END:
		if (!user_out.full())
		{
			usr_output_buf.data.range(511,64)=net_input_overflow.data.range(447,0);
			usr_output_buf.data.range(63,0)=0;
			usr_output_buf.keep.range(63,8)=net_input_overflow.keep.range(55,0);
			usr_output_buf.keep.range(7,0)=0;
			usr_output_buf.last = 1;
			user_out.write(usr_output_buf);
			if (!network_in.empty())
			{
				net_input_buf = network_in.read();
				if (net_input_buf.data.range(479,456)==vni)
				{
					net_input_stage = (net_input_buf.last == 1) ? PACKET_END : PACKET_MIDDLE;
				}
				else
				{
					net_input_stage = (net_input_buf.last == 1) ? PACKET_START : DROP_PACKET;
				}
				net_input_overflow = net_input_buf;
			}
			else
			{
				net_input_stage = PACKET_START;
			}
		}
		break;
	}
	switch(usr_input_stage)
	{
	case PACKET_START:
		if (!user_in.empty() && !network_out.full())
		{
			usr_input_buf = user_in.read();
			usr_input_overflow = usr_input_buf;
			net_output_buf.data.range(511,480) = 0x8000000;//flags
			net_output_buf.data.range(479,456) = vni;//vni
			net_output_buf.data.range(455,448) = 0;//reserved bits
			net_output_buf.data.range(447,0) = usr_input_buf.data.range(511,64);
			net_output_buf.keep.range(63,56)=0xFF;//VXLAN header keep bits
			net_output_buf.keep.range(55,0)=usr_input_buf.keep.range(63,8);
			if (usr_input_buf.last == 0)
			{
				net_output_buf.last = 0;
				usr_input_stage = PACKET_MIDDLE;
			}
			else if (usr_input_buf.keep.bit(7)==0)
			{
				net_output_buf.last = 1;
				usr_input_stage = PACKET_START;
			}
			else
			{
				net_output_buf.last = 0;
				usr_input_stage = PACKET_END;
			}
			network_out.write(net_output_buf);
		}
		break;
	case PACKET_MIDDLE:
		if (!user_in.empty() && !network_out.full())
		{
			usr_input_buf = user_in.read();
			net_output_buf.data.range(511,448) = usr_input_overflow.data.range(63,0);
			net_output_buf.data.range(447,0) = usr_input_buf.data.range(511,64);
			net_output_buf.keep.range(63,56)=usr_input_overflow.keep.range(7,0);
			net_output_buf.keep.range(55,0)=usr_input_buf.keep.range(63,8);
			if (usr_input_buf.last == 0)
			{
				net_output_buf.last = 0;
				usr_input_stage = PACKET_MIDDLE;
			}
			else if (usr_input_buf.keep.bit(7)==0)
			{
				net_output_buf.last = 1;
				usr_input_stage = PACKET_START;
			}
			else
			{
				net_output_buf.last = 0;
				usr_input_stage = PACKET_END;
			}
			network_out.write(net_output_buf);
			usr_input_overflow = usr_input_buf;
		}
		break;
	case PACKET_END:
		if (!network_out.full())
		{
			net_output_buf.data.range(511,448) = usr_input_overflow.data.range(63,0);
			net_output_buf.data.range(447,0) = 0;
			net_output_buf.keep.range(63,56)=usr_input_overflow.keep.range(7,0);
			net_output_buf.keep.range(55,0)=0;
			net_output_buf.last = 1;
			network_out.write(net_output_buf);
			usr_input_stage = PACKET_START;
		}
		break;
	}
}
