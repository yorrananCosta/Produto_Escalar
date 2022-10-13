	.file	"ProdutoEscalar.c"
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "--------------------------------\0"
LC1:
	.ascii "1 - Produto Escalar Simples\0"
LC2:
	.ascii "2 - Produto Escalar Impar\0"
LC3:
	.ascii "3 - Multiplicacao por Escalar\0"
	.text
	.globl	_mostrarOpcoes
	.def	_mostrarOpcoes;	.scl	2;	.type	32;	.endef
_mostrarOpcoes:
LFB3401:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
	movl	$LC0, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3401:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "%d\0"
	.align 4
LC5:
	.ascii "\12Produto escalar na forma tradicional: %f\12\0"
	.align 4
LC6:
	.ascii "\12Erro na sele\303\247\303\243o! Por favor, digite novamente.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB3402:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$192, %esp
	call	___main
L13:
	movl	$0, 188(%esp)
	jmp	L3
L4:
	fildl	188(%esp)
	movl	188(%esp), %eax
	fstps	36(%esp,%eax,4)
	fildl	188(%esp)
	movl	188(%esp), %eax
	fstps	84(%esp,%eax,4)
	movl	188(%esp), %eax
	movl	%eax, %edx
	movl	188(%esp), %eax
	movw	%dx, 156(%esp,%eax,2)
	movl	188(%esp), %eax
	movl	%eax, %edx
	movl	188(%esp), %eax
	movw	%dx, 132(%esp,%eax,2)
	addl	$1, 188(%esp)
L3:
	cmpl	$11, 188(%esp)
	jle	L4
	call	_mostrarOpcoes
	leal	180(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_scanf
	movl	180(%esp), %eax
	cmpl	$2, %eax
	je	L6
	cmpl	$2, %eax
	jg	L7
	cmpl	$1, %eax
	je	L14
	jmp	L5
L7:
	cmpl	$3, %eax
	je	L15
	cmpl	$4, %eax
	je	L10
	jmp	L5
L6:
	leal	84(%esp), %eax
	movl	%eax, 4(%esp)
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	_produto_escalar_normal
	fstps	28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 184(%esp)
	flds	184(%esp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	jmp	L11
L10:
	movl	$0, %eax
	jmp	L12
L5:
	movl	$LC6, (%esp)
	call	_puts
	jmp	L11
L14:
	nop
	jmp	L11
L15:
	nop
L11:
	movl	180(%esp), %eax
	cmpl	$4, %eax
	jne	L13
	movl	$0, %eax
L12:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3402:
	.globl	_produto_escalar_normal
	.def	_produto_escalar_normal;	.scl	2;	.type	32;	.endef
_produto_escalar_normal:
LFB3403:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	fldz
	fstps	-4(%ebp)
	movl	$0, -8(%ebp)
	jmp	L17
L18:
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fmulp	%st, %st(1)
	flds	-4(%ebp)
	faddp	%st, %st(1)
	fstps	-4(%ebp)
	addl	$1, -8(%ebp)
L17:
	cmpl	$11, -8(%ebp)
	jle	L18
	flds	-4(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3403:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
