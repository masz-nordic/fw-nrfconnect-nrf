	.file	"hrt.c"
	.option nopic
	.attribute arch, "rv32e1p9_m2p0_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.hrt_tx,"ax",@progbits
	.align	1
	.type	hrt_tx, @function
hrt_tx:
	lw	a5,4(a0)
	addi	sp,sp,-20
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	a2,0(sp)
	sw	a4,8(sp)
	beq	a5,zero,.L1
	li	a4,32
	div	a4,a4,a1
	lui	t2,%hi(xfer_shift_ctrl)
	addi	a5,t2,%lo(xfer_shift_ctrl)
	lbu	s1,2(a5)
	lbu	a2,1(a5)
	sb	a1,2(a5)
	lbu	a5,3(a5)
	li	t1,3145728
	slli	a2,a2,8
	slli	a5,a5,20
	andi	a2,a2,1792
	and	a5,a5,t1
	or	a5,a2,a5
	li	t1,126976
	slli	a2,a1,12
	and	a2,a2,t1
	or	a5,a5,a2
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,%lo(xfer_shift_ctrl)(t2)
	andi	a4,a4,63
	or	a5,a5,a4
 #APP
	csrw 3019, a5
 #NO_APP
	li	a4,2031616
	slli	a5,a1,16
	and	a5,a5,a4
	ori	a5,a5,4
	sw	a5,4(sp)
	li	a2,0
	addi	t0,t2,%lo(xfer_shift_ctrl)
.L3:
	lw	a5,4(a0)
	bltu	a2,a5,.L17
.L1:
	lw	s0,16(sp)
	lw	s1,12(sp)
	addi	sp,sp,20
	jr	ra
.L17:
	lw	a5,8(sp)
	beq	a5,zero,.L7
	lw	a5,4(a0)
	li	a4,1
	sub	a5,a5,a2
	beq	a5,a4,.L5
	li	a4,2
	beq	a5,a4,.L6
.L7:
	lw	a5,0(a0)
	bne	a5,zero,.L24
	li	a5,0
	j	.L8
.L5:
	lbu	t1,1(t0)
	lbu	a5,2(t0)
	li	s0,126976
	slli	t1,t1,8
	slli	a5,a5,12
	and	a5,a5,s0
	andi	t1,t1,1792
	or	t1,t1,a5
	lbu	a4,9(a0)
	lbu	a5,3(t0)
	li	s0,3145728
	addi	a4,a4,-1
	slli	a5,a5,20
	andi	a4,a4,0xff
	and	a5,a5,s0
	sb	a4,%lo(xfer_shift_ctrl)(t2)
	or	a5,t1,a5
	andi	a4,a4,63
	or	a5,a5,a4
 #APP
	csrw 3019, a5
 #NO_APP
	lw	a5,12(a0)
.L8:
	beq	a1,s1,.L11
.L12:
 #APP
	csrr a4, 3022
 #NO_APP
	andi	a4,a4,0xff
	bne	a4,zero,.L12
	lw	a4,4(sp)
 #APP
	csrw 3043, a4
 #NO_APP
	mv	s1,a1
.L11:
	lbu	a4,8(a0)
	andi	t1,a4,0xff
	beq	a4,zero,.L13
	li	a4,1
	bne	t1,a4,.L14
 #APP
	csrw 3017, a5
 #NO_APP
.L14:
	bne	a2,zero,.L15
	lw	a5,0(sp)
	lbu	a5,0(a5)
	bne	a5,zero,.L15
	mv	a5,a3
	bne	a3,zero,.L16
	li	a5,1
.L16:
	slli	a3,a5,16
	srli	a3,a3,16
 #APP
	csrw 2005, a3
 #NO_APP
	lw	a5,0(sp)
	li	a4,1
	sb	a4,0(a5)
.L15:
	addi	a2,a2,1
	j	.L3
.L6:
	lbu	t1,1(t0)
	lbu	a5,2(t0)
	li	s0,126976
	slli	t1,t1,8
	slli	a5,a5,12
	and	a5,a5,s0
	andi	t1,t1,1792
	or	t1,t1,a5
	lbu	a4,10(a0)
	lbu	a5,3(t0)
	li	s0,3145728
	addi	a4,a4,-1
	slli	a5,a5,20
	andi	a4,a4,0xff
	and	a5,a5,s0
	sb	a4,%lo(xfer_shift_ctrl)(t2)
	or	a5,t1,a5
	andi	a4,a4,63
	or	a5,a5,a4
 #APP
	csrw 3019, a5
 #NO_APP
	j	.L7
.L24:
	lw	a5,0(a0)
	slli	a4,a2,2
	add	a5,a5,a4
	lw	a5,0(a5)
	j	.L8
.L13:
 #APP
	csrw 3016, a5
 #NO_APP
	j	.L14
	.size	hrt_tx, .-hrt_tx
	.section	.text.hrt_write,"ax",@progbits
	.align	1
	.globl	hrt_write
	.type	hrt_write, @function
hrt_write:
	addi	sp,sp,-20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	mv	s0,a0
	mv	s1,a1
	sb	zero,7(sp)
	lhu	a5,74(a0)
 #APP
	csrw 3009, a5
 #NO_APP
	li	a5,0
	li	a3,4
.L27:
	slli	a4,a5,4
	add	a4,s0,a4
	lw	a4,4(a4)
	bne	a4,zero,.L26
	addi	a5,a5,1
	bne	a5,a3,.L27
.L28:
	lbu	a3,67(s0)
	li	a5,3
	andi	a3,a3,0xff
	j	.L30
.L26:
	andi	a5,a5,0xff
	li	a4,1
	beq	a5,a4,.L29
	li	a4,3
	beq	a5,a4,.L28
	bne	a5,zero,.L43
	lbu	a3,64(s0)
.L49:
	andi	a3,a3,0xff
.L30:
	lui	a4,%hi(xfer_shift_ctrl+2)
	sb	a3,%lo(xfer_shift_ctrl+2)(a4)
 #APP
	csrw 2000, 2
 #NO_APP
	lhu	a4,68(s0)
	slli	a4,a4,16
	srli	a4,a4,16
 #APP
	csrr a2, 2003
 #NO_APP
	li	a1,-65536
	and	a2,a2,a1
	or	a4,a4,a2
 #APP
	csrw 2003, a4
	csrw 3011, 0
 #NO_APP
	li	a2,2031616
	slli	a4,a3,16
	and	a4,a4,a2
	ori	a4,a4,4
 #APP
	csrw 3043, a4
 #NO_APP
	beq	s1,zero,.L31
	slli	a5,a5,4
	add	a5,s0,a5
	lw	a4,4(a5)
	li	a2,1
	beq	a4,a2,.L32
	li	a2,2
	beq	a4,a2,.L33
.L31:
	li	a5,32
	div	a5,a5,a3
	j	.L50
.L29:
	lbu	a3,65(s0)
	j	.L49
.L43:
	li	a5,2
	li	a3,0
	j	.L30
.L32:
	lbu	a5,9(a5)
.L50:
 #APP
	csrw 3022, a5
 #NO_APP
	lbu	a5,73(s0)
	lbu	a4,71(s0)
	bne	a5,zero,.L36
	li	a5,1
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrc 3008, a5
 #NO_APP
.L37:
 #APP
	csrr a5, 3008
 #NO_APP
	lbu	a1,64(s0)
	lhu	a3,68(s0)
	mv	a4,s1
	addi	a2,sp,7
	mv	a0,s0
	sw	a5,0(sp)
	call	hrt_tx
	lbu	a1,65(s0)
	lhu	a3,68(s0)
	mv	a4,s1
	addi	a2,sp,7
	addi	a0,s0,16
	call	hrt_tx
	lbu	a1,66(s0)
	lhu	a3,68(s0)
	mv	a4,s1
	addi	a2,sp,7
	addi	a0,s0,32
	call	hrt_tx
	lbu	a1,67(s0)
	lhu	a3,68(s0)
	mv	a4,s1
	addi	a2,sp,7
	addi	a0,s0,48
	call	hrt_tx
	lbu	a4,78(s0)
	bne	a4,zero,.L38
	li	a4,4096
	addi	a4,a4,1
 #APP
	csrw 3019, a4
 #NO_APP
	lw	a5,0(sp)
	li	a4,131072
	addi	a4,a4,-2
	slli	a5,a5,1
	and	a5,a5,a4
 #APP
	csrw 3012, a5
	csrw 2000, 0
 #NO_APP
.L39:
 #APP
	csrw 2005, 0
 #NO_APP
	lbu	a5,72(s0)
	bne	a5,zero,.L25
	lbu	a5,73(s0)
	lbu	a4,71(s0)
	bne	a5,zero,.L42
	li	a5,1
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrs 3008, a5
 #NO_APP
.L25:
	lw	ra,16(sp)
	lw	s0,12(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	jr	ra
.L33:
	lbu	a5,10(a5)
	j	.L50
.L36:
	li	a5,1
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrs 3008, a5
 #NO_APP
	j	.L37
.L38:
 #APP
	csrr a5, 3022
 #NO_APP
	andi	a5,a5,0xff
	bne	a5,zero,.L38
 #APP
	csrw 2000, 0
 #NO_APP
	li	a5,4096
	addi	a5,a5,1
 #APP
	csrw 3019, a5
 #NO_APP
	lbu	a3,78(s0)
	li	a5,1
	andi	a4,a3,0xff
	bne	a3,a5,.L40
	lbu	a5,70(s0)
	sll	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrc 3008, a5
 #NO_APP
	j	.L39
.L40:
	lbu	a3,78(s0)
	li	a4,3
	bne	a3,a4,.L39
	lbu	a4,70(s0)
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrs 3008, a5
 #NO_APP
	j	.L39
.L42:
	li	a5,1
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrc 3008, a5
 #NO_APP
	j	.L25
	.size	hrt_write, .-hrt_write
	.section	.text.hrt_read,"ax",@progbits
	.align	1
	.globl	hrt_read
	.type	hrt_read, @function
hrt_read:
	addi	sp,sp,-44
	sw	s0,36(sp)
	sw	s1,32(sp)
	sw	ra,40(sp)
	lbu	a5,67(a0)
	li	s1,32
	lbu	a4,67(a0)
	div	s1,s1,a5
	lbu	a3,67(a0)
	lw	t2,52(a0)
	lw	a5,48(a0)
	lbu	t1,72(a0)
	lbu	a2,73(a0)
	lbu	t0,71(a0)
	andi	a4,a4,0xff
	andi	a3,a3,0xff
	andi	t1,t1,0xff
	addi	s0,s1,-1
	andi	s0,s0,0xff
	bne	a2,zero,.L52
	li	a2,1
	sll	a2,a2,t0
	slli	a2,a2,16
	srli	a2,a2,16
 #APP
	csrc 3008, a2
 #NO_APP
.L53:
	sw	t1,28(sp)
	sw	a5,24(sp)
	sw	t2,20(sp)
	sw	a3,16(sp)
	sw	a4,12(sp)
 #APP
	csrr a5, 3008
 #NO_APP
	li	t0,1
	sw	zero,52(a0)
	sb	t0,72(a0)
	sw	a5,0(sp)
	sw	a1,8(sp)
	sw	a0,4(sp)
	call	hrt_write
	lw	a0,4(sp)
	lw	t2,20(sp)
	lw	t1,28(sp)
	li	t0,1
	sw	t2,52(a0)
	sb	t1,72(a0)
	lbu	t1,67(a0)
	lw	a1,8(sp)
	lw	a4,12(sp)
	lw	a3,16(sp)
	lw	a5,24(sp)
	bne	t1,t0,.L54
	lhu	t1,74(a0)
	slli	t1,t1,16
	srli	t1,t1,16
	andi	t1,t1,-5
	slli	t1,t1,16
	srli	t1,t1,16
	sh	t1,74(a0)
	lhu	t1,74(a0)
.L90:
 #APP
	csrw 3009, t1
	csrw 3011, 2
 #NO_APP
	li	t1,2031616
	slli	a3,a3,16
	and	a3,a3,t1
	ori	t1,a3,4
 #APP
	csrw 3043, t1
	csrw 3022, 1
	csrw 2000, 2
	csrw 2001, 2
 #NO_APP
	lhu	t1,68(a0)
	slli	t1,t1,16
	srli	t1,t1,16
 #APP
	csrr t0, 2003
 #NO_APP
	li	t2,-65536
	and	t0,t0,t2
	or	t1,t1,t0
 #APP
	csrw 2003, t1
 #NO_APP
	lhu	t1,68(a0)
	slli	t1,t1,16
	srli	t1,t1,16
 #APP
	csrr t0, 2003
 #NO_APP
	slli	t1,t1,1
	slli	t0,t0,16
	addi	t1,t1,1
	srli	t0,t0,16
	slli	t1,t1,16
	or	t1,t1,t0
 #APP
	csrw 2003, t1
 #NO_APP
	li	t1,126976
	slli	a4,a4,12
	and	a4,a4,t1
	li	t0,2097152
	andi	t1,s0,63
	or	t1,t1,a4
	addi	t0,t0,1024
	or	t1,t1,t0
 #APP
	csrw 3019, t1
	csrw 3017, 0
 #NO_APP
	beq	a1,zero,.L56
	lw	t0,52(a0)
	li	t1,1
	bne	t0,t1,.L56
	lbu	t0,57(a0)
	li	t1,2
	bne	t0,t1,.L56
	lhu	a5,68(a0)
	li	a1,65536
	add	a5,a5,a1
 #APP
	csrw 2002, a5
 #NO_APP
.L57:
 #APP
	csrr a5, 3021
 #NO_APP
	andi	a5,a5,0xff
	bne	a5,zero,.L57
 #APP
	csrr a5, 2005
 #NO_APP
	slli	a5,a5,16
	srli	a5,a5,16
.L58:
 #APP
	csrr t1, 2005
 #NO_APP
	mv	a1,a5
	slli	a5,t1,16
	srli	a5,a5,16
	bne	a1,a5,.L58
	lw	a5,0(sp)
	slli	a2,a5,24
 #APP
	csrw 3017, a2
	csrw 3043, a3
 #NO_APP
	lbu	a3,67(a0)
	li	a5,8
	bne	a3,a5,.L59
 #APP
	csrr a5, 3018
 #NO_APP
	lw	a3,48(a0)
	srli	a5,a5,16
	andi	a5,a5,0xff
	sb	a5,0(a3)
	lw	a3,48(a0)
	sb	a5,1(a3)
.L60:
 #APP
	csrw 2000, 0
	csrw 2001, 0
 #NO_APP
	andi	s0,s0,63
	or	s0,s0,a4
 #APP
	csrw 3019, s0
 #NO_APP
	lbu	a5,72(a0)
	bne	a5,zero,.L75
	lbu	a5,73(a0)
	lbu	a4,71(a0)
	bne	a5,zero,.L76
	li	a5,1
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrs 3008, a5
 #NO_APP
.L75:
	lbu	a4,67(a0)
	li	a5,1
	bne	a4,a5,.L51
	lhu	a5,74(a0)
	ori	a5,a5,4
	sh	a5,74(a0)
	lhu	a5,74(a0)
 #APP
	csrw 3009, a5
 #NO_APP
.L51:
	lw	ra,40(sp)
	lw	s0,36(sp)
	lw	s1,32(sp)
	addi	sp,sp,44
	jr	ra
.L52:
	li	a2,1
	sll	a2,a2,t0
	slli	a2,a2,16
	srli	a2,a2,16
 #APP
	csrs 3008, a2
 #NO_APP
	j	.L53
.L54:
	lhu	t1,76(a0)
	j	.L90
.L59:
 #APP
	csrr a5, 3018
 #NO_APP
	lw	a3,48(a0)
	srli	a5,a5,24
	sb	a5,0(a3)
	j	.L60
.L56:
	addi	s1,s1,-3
	andi	s0,s1,0xff
	li	t1,2097152
	andi	s1,s1,63
	or	s1,s1,a4
	addi	t1,t1,1024
	or	s1,s1,t1
 #APP
	csrw 3019, s1
 #NO_APP
	lhu	t0,68(a0)
	li	t2,65536
	add	t0,t0,t2
 #APP
	csrw 2002, t0
	csrr t0, 3018
 #NO_APP
	li	t2,0
	addi	a5,a5,-4
	li	s1,32
	beq	a1,zero,.L63
	li	a2,1
	li	s1,32
.L64:
	lw	t0,52(a0)
	bgtu	t0,t2,.L69
.L72:
 #APP
	csrr a5, 3021
 #NO_APP
	andi	a5,a5,0xff
	bne	a5,zero,.L72
 #APP
	csrr a5, 2005
 #NO_APP
	slli	a5,a5,16
	srli	a5,a5,16
.L73:
 #APP
	csrr t0, 2005
 #NO_APP
	mv	t1,a5
	slli	a5,t0,16
	srli	a5,a5,16
	bne	a5,t1,.L73
	lw	a5,0(sp)
	slli	a2,a5,24
 #APP
	csrw 3017, a2
	csrw 3043, a3
 #NO_APP
	beq	a1,zero,.L60
	lbu	a5,57(a0)
	lbu	a2,67(a0)
	andi	a5,a5,0xff
	andi	a2,a2,0xff
 #APP
	csrr a3, 3018
 #NO_APP
	mul	a5,a5,a2
	li	a2,32
	sub	a5,a2,a5
	srl	a5,a3,a5
	sw	a5,60(a0)
	j	.L60
.L69:
	lw	t0,52(a0)
	sub	t0,t0,t2
	beq	t0,a2,.L65
	li	s0,2
	beq	t0,s0,.L66
	lbu	s0,67(a0)
	div	s0,s1,s0
	j	.L91
.L65:
	lbu	s0,57(a0)
.L91:
	addi	s0,s0,-1
	andi	s0,s0,0xff
	andi	t0,s0,63
	or	t0,t0,a4
	or	t0,t0,t1
 #APP
	csrw 3019, t0
	csrr t0, 3018
 #NO_APP
	sw	t0,0(a5)
	addi	t2,t2,1
	addi	a5,a5,4
	j	.L64
.L66:
	lbu	s0,58(a0)
	j	.L91
.L71:
	lbu	t0,67(a0)
	div	t0,s1,t0
	addi	t0,t0,-1
	andi	s0,t0,0xff
	andi	t0,t0,63
	or	t0,t0,a4
	or	t0,t0,t1
 #APP
	csrw 3019, t0
	csrr t0, 3018
 #NO_APP
	sw	t0,0(a5)
	addi	t2,t2,1
	addi	a5,a5,4
.L63:
	lw	t0,52(a0)
	addi	t0,t0,1
	bgtu	t0,t2,.L71
	j	.L72
.L76:
	li	a5,1
	sll	a5,a5,a4
	slli	a5,a5,16
	srli	a5,a5,16
 #APP
	csrc 3008, a5
 #NO_APP
	j	.L75
	.size	hrt_read, .-hrt_read
	.section	.sdata.xfer_shift_ctrl,"aw"
	.align	2
	.type	xfer_shift_ctrl, @object
	.size	xfer_shift_ctrl, 4
xfer_shift_ctrl:
	.byte	31
	.byte	4
	.byte	1
	.byte	0
