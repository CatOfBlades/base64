	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.text
	.file	"base64.c"
	.globl	memset                          # -- Begin function memset
	.p2align	2
	.type	memset,@function
	.set	nomicromips
	.set	nomips16
	.ent	memset
memset:                                 # @memset
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	beqz	$6, $BB0_4
	nop
# %bb.1:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	move	$2, $4
$BB0_2:                                 # =>This Inner Loop Header: Depth=1
	sb	$5, 0($2)
	addiu	$6, $6, -1
	bnez	$6, $BB0_2
	addiu	$2, $2, 1
# %bb.3:
	move	$sp, $fp
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	addiu	$sp, $sp, 8
$BB0_4:
	jr	$ra
	move	$2, $4
	.set	at
	.set	macro
	.set	reorder
	.end	memset
$func_end0:
	.size	memset, ($func_end0)-memset
                                        # -- End function
	.globl	memcpy                          # -- Begin function memcpy
	.p2align	2
	.type	memcpy,@function
	.set	nomicromips
	.set	nomips16
	.ent	memcpy
memcpy:                                 # @memcpy
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	beqz	$6, $BB1_4
	nop
# %bb.1:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
$BB1_2:                                 # =>This Inner Loop Header: Depth=1
	lbu	$1, 0($5)
	addiu	$5, $5, 1
	addiu	$6, $6, -1
	sb	$1, 0($4)
	bnez	$6, $BB1_2
	addiu	$4, $4, 1
# %bb.3:
	move	$sp, $fp
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	addiu	$sp, $sp, 8
$BB1_4:
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	memcpy
$func_end1:
	.size	memcpy, ($func_end1)-memcpy
                                        # -- End function
	.globl	base64_encode                   # -- Begin function base64_encode
	.p2align	2
	.type	base64_encode,@function
	.set	nomicromips
	.set	nomips16
	.ent	base64_encode
base64_encode:                          # @base64_encode
	.frame	$fp,40,$ra
	.mask 	0xc0070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -40
	sw	$ra, 36($sp)                    # 4-byte Folded Spill
	sw	$fp, 32($sp)                    # 4-byte Folded Spill
	sw	$18, 28($sp)                    # 4-byte Folded Spill
	sw	$17, 24($sp)                    # 4-byte Folded Spill
	sw	$16, 20($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	lui	$1, 43690
	sll	$2, $5, 2
	lui	$3, 14563
	move	$18, $4
	move	$16, $6
	move	$17, $5
	ori	$1, $1, 43691
	ori	$3, $3, 36409
	multu	$2, $1
	mfhi	$1
	srl	$1, $1, 1
	addiu	$2, $1, 4
	multu	$2, $3
	mfhi	$2
	srl	$2, $2, 4
	addu	$1, $1, $2
	jal	malloc
	addiu	$4, $1, 5
	beqz	$2, $BB2_17
	nop
# %bb.1:
	addu	$5, $18, $17
	slti	$1, $17, 3
	bnez	$1, $BB2_8
	addiu	$4, $zero, 0
# %bb.2:
	lui	$1, %hi(base64_table)
	addiu	$4, $zero, 0
	addiu	$7, $zero, 10
	move	$3, $2
	j	$BB2_4
	addiu	$6, $1, %lo(base64_table)
$BB2_3:                                 #   in Loop: Header=BB2_4 Depth=1
	addiu	$4, $4, 4
	addiu	$3, $3, 4
	addiu	$17, $17, -3
	slti	$1, $17, 3
	bnez	$1, $BB2_6
	addiu	$18, $8, 3
$BB2_4:                                 # =>This Inner Loop Header: Depth=1
	lbu	$1, 0($18)
	move	$8, $18
	slti	$11, $4, 68
	srl	$9, $1, 2
	sll	$1, $1, 4
	addu	$9, $6, $9
	andi	$1, $1, 48
	lbu	$9, 0($9)
	sb	$9, 0($3)
	lbu	$9, 1($18)
	srl	$10, $9, 4
	sll	$9, $9, 2
	or	$1, $10, $1
	andi	$9, $9, 60
	addu	$1, $6, $1
	lbu	$1, 0($1)
	sb	$1, 1($3)
	lbu	$1, 2($18)
	andi	$10, $1, 63
	srl	$1, $1, 6
	or	$1, $1, $9
	addu	$10, $6, $10
	addu	$1, $6, $1
	lbu	$10, 0($10)
	lbu	$1, 0($1)
	sb	$10, 3($3)
	bnez	$11, $BB2_3
	sb	$1, 2($3)
# %bb.5:                                #   in Loop: Header=BB2_4 Depth=1
	sb	$7, 4($3)
	addiu	$3, $3, 5
	addiu	$4, $zero, 0
	addiu	$17, $17, -3
	slti	$1, $17, 3
	beqz	$1, $BB2_4
	addiu	$18, $8, 3
$BB2_6:
	addiu	$18, $8, 3
	bne	$5, $18, $BB2_9
	nop
# %bb.7:
	j	$BB2_13
	nop
$BB2_8:
	beq	$5, $18, $BB2_13
	move	$3, $2
$BB2_9:
	lui	$1, %hi(base64_table)
	addiu	$5, $1, %lo(base64_table)
	lbu	$1, 0($18)
	srl	$6, $1, 2
	sll	$1, $1, 4
	addu	$6, $5, $6
	andi	$7, $1, 48
	addiu	$1, $zero, 1
	lbu	$6, 0($6)
	sb	$6, 0($3)
	bne	$17, $1, $BB2_11
	addiu	$6, $zero, 61
# %bb.10:
	j	$BB2_12
	addiu	$8, $zero, 61
$BB2_11:
	lbu	$1, 1($18)
	srl	$8, $1, 4
	sll	$1, $1, 2
	andi	$1, $1, 60
	or	$7, $8, $7
	addu	$1, $5, $1
	lbu	$8, 0($1)
$BB2_12:
	addu	$1, $5, $7
	sb	$6, 3($3)
	sb	$8, 2($3)
	addiu	$4, $4, 4
	lbu	$1, 0($1)
	sb	$1, 1($3)
	addiu	$3, $3, 4
$BB2_13:
	beqz	$4, $BB2_15
	nop
# %bb.14:
	addiu	$1, $zero, 10
	sb	$1, 0($3)
	addiu	$3, $3, 1
$BB2_15:
	beqz	$16, $BB2_17
	sb	$zero, 0($3)
# %bb.16:
	subu	$1, $3, $2
	sw	$1, 0($16)
$BB2_17:
	move	$sp, $fp
	lw	$16, 20($sp)                    # 4-byte Folded Reload
	lw	$17, 24($sp)                    # 4-byte Folded Reload
	lw	$18, 28($sp)                    # 4-byte Folded Reload
	lw	$fp, 32($sp)                    # 4-byte Folded Reload
	lw	$ra, 36($sp)                    # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 40
	.set	at
	.set	macro
	.set	reorder
	.end	base64_encode
$func_end2:
	.size	base64_encode, ($func_end2)-base64_encode
                                        # -- End function
	.globl	base64_decode                   # -- Begin function base64_decode
	.p2align	2
	.type	base64_decode,@function
	.set	nomicromips
	.set	nomips16
	.ent	base64_decode
base64_decode:                          # @base64_decode
	.frame	$fp,312,$ra
	.mask 	0xc01f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -312
	sw	$ra, 308($sp)                   # 4-byte Folded Spill
	sw	$fp, 304($sp)                   # 4-byte Folded Spill
	sw	$20, 300($sp)                   # 4-byte Folded Spill
	sw	$19, 296($sp)                   # 4-byte Folded Spill
	sw	$18, 292($sp)                   # 4-byte Folded Spill
	sw	$17, 288($sp)                   # 4-byte Folded Spill
	sw	$16, 284($sp)                   # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$19, $fp, 28
	move	$16, $6
	move	$17, $5
	move	$18, $4
	addiu	$5, $zero, 128
	addiu	$6, $zero, 256
	jal	memset
	move	$4, $19
	lui	$1, %hi(base64_table)
	addiu	$2, $zero, 0
	addiu	$4, $zero, 64
	addiu	$3, $1, %lo(base64_table)
$BB3_1:                                 # =>This Inner Loop Header: Depth=1
	addu	$1, $3, $2
	lbu	$1, 0($1)
	addu	$1, $19, $1
	sb	$2, 0($1)
	addiu	$2, $2, 1
	bne	$2, $4, $BB3_1
	nop
# %bb.2:
	beqz	$17, $BB3_14
	sb	$zero, 89($fp)
# %bb.3:
	addiu	$2, $zero, 0
	addiu	$3, $zero, 128
	move	$4, $18
	move	$5, $17
$BB3_4:                                 # =>This Inner Loop Header: Depth=1
	lbu	$1, 0($4)
	addiu	$4, $4, 1
	addiu	$5, $5, -1
	addu	$1, $19, $1
	lbu	$1, 0($1)
	xor	$1, $1, $3
	sltu	$1, $zero, $1
	bnez	$5, $BB3_4
	addu	$2, $2, $1
# %bb.5:
	beqz	$2, $BB3_20
	addiu	$20, $zero, 0
# %bb.6:
	andi	$1, $2, 3
	bnez	$1, $BB3_20
	nop
# %bb.7:
	srl	$1, $2, 2
	sll	$2, $1, 1
	jal	malloc
	addu	$4, $2, $1
	beqz	$2, $BB3_20
	nop
# %bb.8:
	move	$20, $2
	beqz	$17, $BB3_19
	move	$3, $2
# %bb.9:
	addiu	$8, $zero, 0
	addiu	$4, $zero, 128
	addiu	$5, $fp, 20
	addiu	$6, $fp, 24
	addiu	$7, $zero, 4
	j	$BB3_11
	move	$3, $20
$BB3_10:                                #   in Loop: Header=BB3_11 Depth=1
	addiu	$17, $17, -1
	beqz	$17, $BB3_15
	addiu	$18, $18, 1
$BB3_11:                                # =>This Inner Loop Header: Depth=1
	lbu	$9, 0($18)
	addu	$1, $19, $9
	lbu	$10, 0($1)
	beq	$10, $4, $BB3_10
	nop
# %bb.12:                               #   in Loop: Header=BB3_11 Depth=1
	addu	$1, $5, $8
	sb	$10, 0($1)
	addu	$1, $6, $8
	addiu	$8, $8, 1
	bne	$8, $7, $BB3_10
	sb	$9, 0($1)
# %bb.13:                               #   in Loop: Header=BB3_11 Depth=1
	lbu	$1, 20($fp)
	lbu	$8, 21($fp)
	lbu	$9, 22($fp)
	lbu	$10, 23($fp)
	sll	$1, $1, 2
	srl	$8, $8, 4
	sll	$9, $9, 6
	or	$1, $8, $1
	lbu	$8, 22($fp)
	or	$9, $9, $10
	sb	$1, 0($3)
	lbu	$1, 21($fp)
	srl	$8, $8, 2
	sll	$1, $1, 4
	or	$1, $8, $1
	addiu	$8, $zero, 0
	sb	$1, 1($3)
	addiu	$1, $3, 3
	sb	$9, 2($3)
	j	$BB3_10
	move	$3, $1
$BB3_14:
	j	$BB3_20
	addiu	$20, $zero, 0
$BB3_15:
	sltu	$1, $2, $3
	beqz	$1, $BB3_19
	nop
# %bb.16:
	lbu	$1, 26($fp)
	addiu	$4, $zero, 61
	bne	$1, $4, $BB3_18
	nop
# %bb.17:
	j	$BB3_19
	addiu	$3, $3, -2
$BB3_18:
	lbu	$1, 27($fp)
	xor	$1, $1, $4
	sltiu	$1, $1, 1
	subu	$3, $3, $1
$BB3_19:
	subu	$1, $3, $2
	sw	$1, 0($16)
$BB3_20:
	move	$2, $20
	move	$sp, $fp
	lw	$16, 284($sp)                   # 4-byte Folded Reload
	lw	$17, 288($sp)                   # 4-byte Folded Reload
	lw	$18, 292($sp)                   # 4-byte Folded Reload
	lw	$19, 296($sp)                   # 4-byte Folded Reload
	lw	$20, 300($sp)                   # 4-byte Folded Reload
	lw	$fp, 304($sp)                   # 4-byte Folded Reload
	lw	$ra, 308($sp)                   # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 312
	.set	at
	.set	macro
	.set	reorder
	.end	base64_decode
$func_end3:
	.size	base64_decode, ($func_end3)-base64_decode
                                        # -- End function
	.type	base64_table,@object            # @base64_table
	.section	.rodata.str1.1,"aMS",@progbits,1
base64_table:
	.asciz	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	.size	base64_table, 65

	.ident	"clang version 17.0.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.text
