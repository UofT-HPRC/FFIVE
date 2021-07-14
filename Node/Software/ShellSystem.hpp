#ifndef SHELL_SYSTEM_HPP
#define SHELL_SYSTEM_HPP

#define ID_RAM_BASE 0x00A0000000L
#define ID_RAM_SPAN 0x10000
#define ID_RAM_VENDOR_OFFSET 0
#define ID_RAM_VENDOR_SPAN 32
#define ID_RAM_SHELL_OFFSET 32
#define ID_RAM_SHELL_SPAN 32
#define ID_RAM_VERSION_MAJOR_OFFSET 64
#define ID_RAM_VERSION_MAJOR_SPAN 1
#define ID_RAM_VERSION_MINOR_OFFSET 65
#define ID_RAM_VERSION_MINOR_SPAN 1
#define ID_RAM_VERSION_PATCH_OFFSET 66
#define ID_RAM_VERSION_PATCH_SPAN 1
#define ID_RAM_QSFPS_OFFSET 80
#define ID_RAM_QSFPS_SPAN 4
#define ID_RAM_QSFPS_COUNT 12
#define ID_RAM_QSFPS_ENABLE_MASK 0x0000000F
#define ID_RAM_QSFPS_ENABLE_SHIFT 0
#define ID_RAM_QSFPS_SPEED_MASK 0x000000F0
#define ID_RAM_QSFPS_SPEED_SHIFT 4
#define ID_RAM_QSFPS_VXLANS_MASK 0x0000FF00
#define ID_RAM_QSFPS_VXLANS_SHIFT 8

#define QSFPS_BASE 0x00A0100000L
#define QSFPS_SPAN 0x10000
#define QSFPS_RX_ALL_BYTES_OFFSET 0x0618
#define QSFPS_RX_GOOD_BYTES_OFFSET 0x0620
#define QSFPS_RX_ALL_PACKETS_OFFSET 0x0608
#define QSFPS_RX_GOOD_PACKETS_OFFSET 0x0610
#define QSFPS_RX_UNICAST_PACKETS_OFFSET 0x06D8
#define QSFPS_RX_MULTICAST_PACKETS_OFFSET 0x06E0
#define QSFPS_RX_BROADCAST_PACKETS_OFFSET 0x06E8
#define QSFPS_RX_SIZE_64_PACKETS_OFFSET 0x0628
#define QSFPS_RX_SIZE_128_PACKETS_OFFSET 0x0630
#define QSFPS_RX_SIZE_256_PACKETS_OFFSET 0x0638
#define QSFPS_RX_SIZE_512_PACKETS_OFFSET 0x0640
#define QSFPS_RX_SIZE_1024_PACKETS_OFFSET 0x0648
#define QSFPS_RX_SIZE_1518_PACKETS_OFFSET 0x0650
#define QSFPS_RX_SIZE_1522_PACKETS_OFFSET 0x0658
#define QSFPS_RX_SIZE_1548_PACKETS_OFFSET 0x0660
#define QSFPS_RX_SIZE_2048_PACKETS_OFFSET 0x0668
#define QSFPS_RX_SIZE_4096_PACKETS_OFFSET 0x0670
#define QSFPS_RX_SIZE_8192_PACKETS_OFFSET 0x0678
#define QSFPS_RX_SIZE_9215_PACKETS_OFFSET 0x0680
#define QSFPS_TX_ALL_BYTES_OFFSET 0x0510
#define QSFPS_TX_GOOD_BYTES_OFFSET 0x0518
#define QSFPS_TX_ALL_PACKETS_OFFSET 0x0500
#define QSFPS_TX_GOOD_PACKETS_OFFSET 0x0508
#define QSFPS_TX_UNICAST_PACKETS_OFFSET 0x05D0
#define QSFPS_TX_MULTICAST_PACKETS_OFFSET 0x05D8
#define QSFPS_TX_BROADCAST_PACKETS_OFFSET 0x05E0
#define QSFPS_TX_SIZE_64_PACKETS_OFFSET 0x0520
#define QSFPS_TX_SIZE_128_PACKETS_OFFSET 0x0528
#define QSFPS_TX_SIZE_256_PACKETS_OFFSET 0x0530
#define QSFPS_TX_SIZE_512_PACKETS_OFFSET 0x0538
#define QSFPS_TX_SIZE_1024_PACKETS_OFFSET 0x0540
#define QSFPS_TX_SIZE_1518_PACKETS_OFFSET 0x0548
#define QSFPS_TX_SIZE_1522_PACKETS_OFFSET 0x0550
#define QSFPS_TX_SIZE_1548_PACKETS_OFFSET 0x0558
#define QSFPS_TX_SIZE_2048_PACKETS_OFFSET 0x0560
#define QSFPS_TX_SIZE_4096_PACKETS_OFFSET 0x0568
#define QSFPS_TX_SIZE_8192_PACKETS_OFFSET 0x0570
#define QSFPS_TX_SIZE_9215_PACKETS_OFFSET 0x0578

#define GULFSTREAMS_BASE 0x00A0200000L
#define GULFSTREAMS_SPAN 0x10000
#define GULFSTREAMS_ENABLE_OFFSET 0
#define GULFSTREAMS_IP_OFFSET 4
#define GULFSTREAMS_GATEWAY_OFFSET 8
#define GULFSTREAMS_NETMASK_OFFSET 12
#define GULFSTREAMS_MAC_HIGH_OFFSET 16
#define GULFSTREAMS_MAC_LOW_OFFSET 20

#define QSFPS_VXLANS_BASE 0x00A0300000L
#define QSFPS_VXLANS_SPAN 0x10000
#define VXLANS_SPAN 16
#define VXLANS_IP_OFFSET 0
#define VXLANS_LOCAL_PORT_OFFSET 4
#define VXLANS_REMOTE_PORT_OFFSET 8
#define VXLANS_VNI_OFFSET 12

#define CLOCKS_BASE 0xFF5E0000LU
#define CLOCKS_SPAN 0x1000
#define CLOCKS_CLOCK0_OFFSET 0xC0
#define CLOCKS_CLOCK1_OFFSET 0xC4
#define CLOCKS_CLOCK2_OFFSET 0xC8
#define CLOCKS_CLOCK3_OFFSET 0xCC

#endif // SHELL_SYSTEM_HPP