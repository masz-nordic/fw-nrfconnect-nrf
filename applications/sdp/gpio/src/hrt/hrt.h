/*
 * Copyright (c) 2024 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
 */

#ifndef _HRT_H__
#define _HRT_H__

#include <hal/nrf_vpr_csr_vio.h>

void hrt_set_bits_raw(uint16_t set_mask);

void hrt_clear_bits_raw(uint16_t clear_mask);

void hrt_toggle_bits(uint16_t toggle_mask);

#endif /* _HRT_H__ */
