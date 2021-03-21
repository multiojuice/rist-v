# boot.S (risc-v)
# bootloader for rist-v
# Owen Sullivan (Notes off of Stephen Marz <3)


# Risc-V ASM option for disabling generation of compressed instructions
.option norvc

# Define a .data section
.section .data

# Define a .text.init section
.section .text.init

# Bootloader Execution Start
.global _start
_start:
	# make sure only hart 0 (id = 0) runs loader
	csrr 	t0, mhartid
	bnez 	t0, 3f

	# Set SATP reg to zero
	csrw 	satp, zero

	# Set options to force the assembler to respect
	# our assignment to gp
	# _global_pointer comes from the linker
.option push
.option norelax
	la	gp, _global_pointer
.option pop

	# set the entire BSS to zero
	la 	a0, _bss_start
	la 	a1, _bss_end
	bgeu 	a0, a1, 2f

1:
	sd 	zero, (a0)
	addi 	a0, a0, 8
	bltu 	a0, a1, 1b
2:
	# Next set the stack, mstatus, mepc, mtvec
	# to return to our Rust code/
	la 	sp, _stack

	# setting enabling and mode bits on mstatus
	li	t0, (0b11 << 11) | (1 << 7) | (1 << 3)
	csrw	mstatus, t0

	# Machines exception program counter set to main (rust)
	la	t1, kmain
	csrw 	mepc, t1

	# Machine trap vector base addr (trap.S)
	la	t2, asm_trap_vector
	csrw	mtvec, t2

	# Sett Machine interrupt enable bits mie
	li 	t3, (1 << 3) | (1 << 7) | (1 << 11)
	csrw 	mie, t3

	# set the return address to wait for interrupts 
	la 	ra, 4f

	# update the mstatus reg using mret
	mret 
	

3:	

4:
	wfi 
	j 	4b
	


