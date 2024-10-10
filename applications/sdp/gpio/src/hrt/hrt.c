#include "hrt.h"

void hrt_set_bits_raw(uint16_t set_mask)
{
	uint16_t outs = nrf_vpr_csr_vio_out_get();

	nrf_vpr_csr_vio_out_set(outs | set_mask);
}

void hrt_clear_bits_raw(uint16_t clear_mask)
{
	uint16_t outs = nrf_vpr_csr_vio_out_get();

	nrf_vpr_csr_vio_out_set(outs & ~clear_mask);
}

void hrt_toggle_bits(uint16_t toggle_mask)
{
	nrf_vpr_csr_vio_out_toggle_set(toggle_mask);
}
