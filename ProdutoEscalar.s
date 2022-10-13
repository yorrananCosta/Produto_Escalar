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
LC6:
	.ascii "\12Digite o multiplicador:\0"
LC7:
	.ascii "%f\0"
	.align 4
LC8:
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
	fstps	32(%esp,%eax,4)
	fildl	188(%esp)
	movl	188(%esp), %eax
	fstps	80(%esp,%eax,4)
	fildl	188(%esp)
	movl	188(%esp), %eax
	fstps	128(%esp,%eax,4)
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
	je	L8
	jmp	L5
L7:
	cmpl	$3, %eax
	je	L9
	cmpl	$4, %eax
	je	L10
	jmp	L5
L8:
	leal	80(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
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
L6:
	leal	128(%esp), %eax
	movl	%eax, 8(%esp)
	leal	80(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_produto_escalar_impar
	fstps	28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 184(%esp)
	flds	184(%esp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	jmp	L11
L9:
	movl	$LC6, (%esp)
	call	_printf
	leal	176(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_scanf
	flds	176(%esp)
	fstps	8(%esp)
	leal	80(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_multiplo_por_escalar
	jmp	L11
L10:
	movl	$0, %eax
	jmp	L12
L5:
	movl	$LC8, (%esp)
	call	_puts
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
	jmp	L15
L16:
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
L15:
	cmpl	$11, -8(%ebp)
	jle	L16
	flds	-4(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3403:
	.globl	_produto_escalar_impar
	.def	_produto_escalar_impar;	.scl	2;	.type	32;	.endef
_produto_escalar_impar:
LFB3404:
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
	jmp	L19
L20:
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
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fmulp	%st, %st(1)
	flds	-4(%ebp)
	faddp	%st, %st(1)
	fstps	-4(%ebp)
	addl	$1, -8(%ebp)
L19:
	cmpl	$11, -8(%ebp)
	jle	L20
	flds	-4(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3404:
	.section .rdata,"dr"
	.align 4
LC11:
	.ascii "\12 x antes da multiplicacao %f na posicao:  %d\0"
	.align 4
LC12:
	.ascii "\12 y antes da multiplicacao %f na posicao:  %d\0"
	.align 4
LC13:
	.ascii "\12 x depois da multiplicacao %f na posicao:  %d\0"
	.align 4
LC14:
	.ascii "\12 y depois da multiplicacao %f na posicao:  %d\0"
	.text
	.globl	_multiplo_por_escalar
	.def	_multiplo_por_escalar;	.scl	2;	.type	32;	.endef
_multiplo_por_escalar:
LFB3405:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L23
L24:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 12(%esp)
	fstpl	4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 12(%esp)
	fstpl	4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	flds	(%edx)
	fmuls	16(%ebp)
	fstps	(%eax)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	12(%ebp), %edx
	addl	%ecx, %edx
	flds	(%edx)
	fmuls	16(%ebp)
	fstps	(%eax)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 12(%esp)
	fstpl	4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 12(%esp)
	fstpl	4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L23:
	cmpl	$11, -12(%ebp)
	jle	L24
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3405:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
