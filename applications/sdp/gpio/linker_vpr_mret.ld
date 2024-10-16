#define VPR_MRET_START 0x2003d1f0

. = VPR_MRET_START;

KEEP(*(.vpr_mret.*))

__vpr_mret_end = .;


