	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.text
	.file	"liballoc.c"
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
	.globl	malloc                          # -- Begin function malloc
	.p2align	2
	.type	malloc,@function
	.set	nomicromips
	.set	nomips16
	.ent	malloc
malloc:                                 # @malloc
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	malloc
$func_end2:
	.size	malloc, ($func_end2)-malloc
                                        # -- End function
	.globl	calloc                          # -- Begin function calloc
	.p2align	2
	.type	calloc,@function
	.set	nomicromips
	.set	nomips16
	.ent	calloc
calloc:                                 # @calloc
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	calloc
$func_end3:
	.size	calloc, ($func_end3)-calloc
                                        # -- End function
	.globl	realloc                         # -- Begin function realloc
	.p2align	2
	.type	realloc,@function
	.set	nomicromips
	.set	nomips16
	.ent	realloc
realloc:                                # @realloc
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	beqz	$4, $BB4_3
	addiu	$2, $zero, 0
# %bb.1:
	beqz	$5, $BB4_3
	nop
# %bb.2:
	lw	$1, -8($4)
	sltu	$1, $1, $5
	movn	$4, $zero, $1
	move	$2, $4
$BB4_3:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	realloc
$func_end4:
	.size	realloc, ($func_end4)-realloc
                                        # -- End function
	.globl	free                            # -- Begin function free
	.p2align	2
	.type	free,@function
	.set	nomicromips
	.set	nomips16
	.ent	free
free:                                   # @free
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	beqz	$4, $BB5_2
	nop
# %bb.1:
	addiu	$1, $zero, 1
	sb	$1, -4($4)
$BB5_2:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	free
$func_end5:
	.size	free, ($func_end5)-free
                                        # -- End function
	.ident	"clang version 17.0.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.text
