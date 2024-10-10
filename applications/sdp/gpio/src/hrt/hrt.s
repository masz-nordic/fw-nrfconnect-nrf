	.file	"hrt.c"
	.option nopic
	.attribute arch, "rv32e1p9_m2p0_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.hrt_set_bits_raw,"ax",@progbits
	.align	1
	.globl	hrt_set_bits_raw
	.type	hrt_set_bits_raw, @function
hrt_set_bits_raw:
 #APP
	csrr a5, 3008
 #NO_APP
	or	a0,a0,a5
	slli	a0,a0,16
	srli	a0,a0,16
 #APP
	csrw 3008, a0
 #NO_APP
	ret
	.size	hrt_set_bits_raw, .-hrt_set_bits_raw
	.section	.text.hrt_clear_bits_raw,"ax",@progbits
	.align	1
	.globl	hrt_clear_bits_raw
	.type	hrt_clear_bits_raw, @function
hrt_clear_bits_raw:
 #APP
	csrr a4, 3008
 #NO_APP
	not	a5,a0
	and	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrw 3008, a5
 #NO_APP
	ret
	.size	hrt_clear_bits_raw, .-hrt_clear_bits_raw
	.section	.text.hrt_toggle_bits,"ax",@progbits
	.align	1
	.globl	hrt_toggle_bits
	.type	hrt_toggle_bits, @function
hrt_toggle_bits:
 #APP
	csrw 3024, a0
 #NO_APP
	ret
	.size	hrt_toggle_bits, .-hrt_toggle_bits
