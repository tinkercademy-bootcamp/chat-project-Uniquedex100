	.arch armv8-a
	.file	"tcp_echo_client.cc"
	.text
	.section	.text._ZNSt11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
	.align	2
	.weak	_ZNSt11char_traitsIcE6lengthEPKc
	.type	_ZNSt11char_traitsIcE6lengthEPKc, %function
_ZNSt11char_traitsIcE6lengthEPKc:
.LFB130:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	mov	w0, 0
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L3
	ldr	x0, [sp, 24]
	bl	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	b	.L4
.L3:
	ldr	x0, [sp, 24]
	bl	strlen
	nop
.L4:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE130:
	.size	_ZNSt11char_traitsIcE6lengthEPKc, .-_ZNSt11char_traitsIcE6lengthEPKc
#APP
	.globl _ZSt21ios_base_library_initv
	.section	.rodata
	.align	3
.LC0:
	.string	"\n"
#NO_APP
	.text
	.align	2
	.global	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, %function
_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2010:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	strb	w0, [sp, 31]
	str	x1, [sp, 16]
	ldrb	w0, [sp, 31]
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L7
	ldr	x1, [sp, 16]
	adrp	x0, :got:_ZSt4cerr;ldr	x0, [x0, :got_lo12:_ZSt4cerr]
	bl	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	mov	x2, x0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	w0, 1
	bl	exit
.L7:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2010:
	.size	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.rodata
	.align	3
.LC1:
	.string	"Socket creation error\n"
	.text
	.align	2
	.global	_Z13create_socketv
	.type	_Z13create_socketv, %function
_Z13create_socketv:
.LFB2011:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2011
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, 64]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 64
	str	x19, [sp, 80]
	.cfi_offset 19, -16
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 56]
	mov	x1, 0
	mov	w2, 0
	mov	w1, 1
	mov	w0, 2
	bl	socket
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	lsr	w0, w0, 31
	and	w19, w0, 255
	add	x0, sp, 8
	str	x0, [sp, 16]
	nop
	nop
	add	x0, sp, 8
	add	x3, sp, 24
	mov	x2, x0
	adrp	x0, .LC1
	add	x1, x0, :lo12:.LC1
	mov	x0, x3
.LEHB0:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE0:
	add	x0, sp, 24
	mov	x1, x0
	mov	w0, w19
.LEHB1:
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE1:
	add	x0, sp, 24
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	add	x0, sp, 8
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	ldr	w0, [sp, 12]
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 56]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L13
	b	.L16
.L15:
	mov	x19, x0
	add	x0, sp, 24
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	b	.L11
.L14:
	mov	x19, x0
.L11:
	add	x0, sp, 8
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	mov	x1, x19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 56]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L12
	bl	__stack_chk_fail
.L12:
	mov	x0, x1
.LEHB2:
	bl	_Unwind_Resume
.LEHE2:
.L16:
	bl	__stack_chk_fail
.L13:
	mov	w0, w1
	ldp	x29, x30, [sp, 64]
	ldr	x19, [sp, 80]
	add	sp, sp, 96
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2011:
	.section	.gcc_except_table,"a",@progbits
.LLSDA2011:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2011-.LLSDACSB2011
.LLSDACSB2011:
	.uleb128 .LEHB0-.LFB2011
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L14-.LFB2011
	.uleb128 0
	.uleb128 .LEHB1-.LFB2011
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L15-.LFB2011
	.uleb128 0
	.uleb128 .LEHB2-.LFB2011
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE2011:
	.text
	.size	_Z13create_socketv, .-_Z13create_socketv
	.section	.rodata
	.align	3
.LC2:
	.string	"Invalid address/ Address not supported\n"
	.text
	.align	2
	.global	_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, %function
_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2012:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2012
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, 80]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 80
	str	x19, [sp, 96]
	.cfi_offset 19, -16
	str	x0, [sp, 8]
	str	x1, [sp]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 72]
	mov	x1, 0
	ldr	x0, [sp]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv
	mov	x1, x0
	ldr	x0, [sp, 8]
	add	x0, x0, 4
	mov	x2, x0
	mov	w0, 2
	bl	inet_pton
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 0
	cset	w0, le
	and	w19, w0, 255
	add	x0, sp, 24
	str	x0, [sp, 32]
	nop
	nop
	add	x0, sp, 24
	add	x3, sp, 40
	mov	x2, x0
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
	mov	x0, x3
.LEHB3:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE3:
	add	x0, sp, 40
	mov	x1, x0
	mov	w0, w19
.LEHB4:
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE4:
	add	x0, sp, 40
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	add	x0, sp, 24
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	nop
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 72]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	beq	.L21
	b	.L24
.L23:
	mov	x19, x0
	add	x0, sp, 40
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	b	.L19
.L22:
	mov	x19, x0
.L19:
	add	x0, sp, 24
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	mov	x1, x19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 72]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L20
	bl	__stack_chk_fail
.L20:
	mov	x0, x1
.LEHB5:
	bl	_Unwind_Resume
.LEHE5:
.L24:
	bl	__stack_chk_fail
.L21:
	ldp	x29, x30, [sp, 80]
	ldr	x19, [sp, 96]
	add	sp, sp, 112
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2012:
	.section	.gcc_except_table
.LLSDA2012:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2012-.LLSDACSB2012
.LLSDACSB2012:
	.uleb128 .LEHB3-.LFB2012
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L22-.LFB2012
	.uleb128 0
	.uleb128 .LEHB4-.LFB2012
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L23-.LFB2012
	.uleb128 0
	.uleb128 .LEHB5-.LFB2012
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE2012:
	.text
	.size	_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.align	2
	.global	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
	.type	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi, %function
_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi:
.LFB2013:
	.cfi_startproc
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, 48]
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 48
	str	x0, [sp, 8]
	str	w1, [sp, 4]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 40]
	mov	x1, 0
	mov	w0, 2
	strh	w0, [sp, 24]
	ldr	w0, [sp, 4]
	and	w0, w0, 65535
	bl	htons
	and	w0, w0, 65535
	strh	w0, [sp, 26]
	add	x0, sp, 24
	ldr	x1, [sp, 8]
	bl	_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	ldp	x0, x1, [sp, 24]
	adrp	x2, :got:__stack_chk_guard;ldr	x2, [x2, :got_lo12:__stack_chk_guard]
	ldr	x4, [sp, 40]
	ldr	x3, [x2]
	subs	x4, x4, x3
	mov	x3, 0
	beq	.L27
	bl	__stack_chk_fail
.L27:
	ldp	x29, x30, [sp, 48]
	add	sp, sp, 64
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2013:
	.size	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi, .-_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
	.section	.rodata
	.align	3
.LC3:
	.string	"Connection Failed\n"
	.text
	.align	2
	.global	_Z17connect_to_serveriR11sockaddr_in
	.type	_Z17connect_to_serveriR11sockaddr_in, %function
_Z17connect_to_serveriR11sockaddr_in:
.LFB2014:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2014
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, 80]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 80
	str	x19, [sp, 96]
	.cfi_offset 19, -16
	str	w0, [sp, 12]
	str	x1, [sp]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 72]
	mov	x1, 0
	mov	w2, 16
	ldr	x1, [sp]
	ldr	w0, [sp, 12]
.LEHB6:
	bl	connect
.LEHE6:
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	lsr	w0, w0, 31
	and	w19, w0, 255
	add	x0, sp, 24
	str	x0, [sp, 32]
	nop
	nop
	add	x0, sp, 24
	add	x3, sp, 40
	mov	x2, x0
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	mov	x0, x3
.LEHB7:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE7:
	add	x0, sp, 40
	mov	x1, x0
	mov	w0, w19
.LEHB8:
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE8:
	add	x0, sp, 40
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	add	x0, sp, 24
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	nop
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 72]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	beq	.L32
	b	.L35
.L34:
	mov	x19, x0
	add	x0, sp, 40
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	b	.L30
.L33:
	mov	x19, x0
.L30:
	add	x0, sp, 24
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	mov	x1, x19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 72]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L31
	bl	__stack_chk_fail
.L31:
	mov	x0, x1
.LEHB9:
	bl	_Unwind_Resume
.LEHE9:
.L35:
	bl	__stack_chk_fail
.L32:
	ldp	x29, x30, [sp, 80]
	ldr	x19, [sp, 96]
	add	sp, sp, 112
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2014:
	.section	.gcc_except_table
.LLSDA2014:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2014-.LLSDACSB2014
.LLSDACSB2014:
	.uleb128 .LEHB6-.LFB2014
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB7-.LFB2014
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L33-.LFB2014
	.uleb128 0
	.uleb128 .LEHB8-.LFB2014
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L34-.LFB2014
	.uleb128 0
	.uleb128 .LEHB9-.LFB2014
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSE2014:
	.text
	.size	_Z17connect_to_serveriR11sockaddr_in, .-_Z17connect_to_serveriR11sockaddr_in
	.section	.rodata
	.align	3
.LC4:
	.string	"Sent: "
	.align	3
.LC5:
	.string	"Received: "
	.align	3
.LC6:
	.string	"Server closed connection.\n"
	.align	3
.LC7:
	.string	"Read error\n"
	.text
	.align	2
	.global	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, %function
_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2015:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	sub	sp, sp, #1072
	.cfi_def_cfa_offset 1104
	.cfi_offset 19, -16
	str	xzr, [sp, 1024]
	str	w0, [sp, 12]
	str	x1, [sp]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 1064]
	mov	x1, 0
	mov	w0, 1024
	str	w0, [sp, 28]
	add	x0, sp, 40
	mov	x1, 1024
	mov	x2, x1
	mov	w1, 0
	bl	memset
	ldr	x0, [sp]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv
	mov	x19, x0
	ldr	x0, [sp]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv
	mov	w3, 0
	mov	x2, x0
	mov	x1, x19
	ldr	w0, [sp, 12]
	bl	send
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	x1, [sp]
	bl	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	mov	x2, x0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	add	x0, sp, 40
	mov	x2, 1024
	mov	x1, x0
	ldr	w0, [sp, 12]
	bl	read
	str	x0, [sp, 32]
	ldr	x0, [sp, 32]
	cmp	x0, 0
	ble	.L37
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	add	x0, sp, 40
	mov	x1, x0
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L41
.L37:
	ldr	x0, [sp, 32]
	cmp	x0, 0
	bne	.L39
	adrp	x0, .LC6
	add	x1, x0, :lo12:.LC6
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L41
.L39:
	adrp	x0, .LC7
	add	x1, x0, :lo12:.LC7
	adrp	x0, :got:_ZSt4cerr;ldr	x0, [x0, :got_lo12:_ZSt4cerr]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
.L41:
	nop
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 1064]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	beq	.L40
	bl	__stack_chk_fail
.L40:
	add	sp, sp, 1072
	.cfi_def_cfa_offset 32
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2015:
	.size	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.rodata
	.align	3
.LC8:
	.string	"Hello from client"
	.align	3
.LC9:
	.string	"Usage: "
	.align	3
.LC10:
	.string	" <message>\n"
	.text
	.align	2
	.global	_Z9read_argsB5cxx11iPPc
	.type	_Z9read_argsB5cxx11iPPc, %function
_Z9read_argsB5cxx11iPPc:
.LFB2016:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2016
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, 48]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x19, x8
	str	w0, [sp, 12]
	str	x1, [sp]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 40]
	mov	x1, 0
	add	x0, sp, 24
	str	x0, [sp, 32]
	nop
	nop
	add	x0, sp, 24
	mov	x2, x0
	adrp	x0, .LC8
	add	x1, x0, :lo12:.LC8
	mov	x0, x19
.LEHB10:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE10:
	add	x0, sp, 24
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	ldr	w0, [sp, 12]
	cmp	w0, 1
	bne	.L43
	adrp	x0, .LC9
	add	x1, x0, :lo12:.LC9
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
.LEHB11:
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	ldr	x0, [sp]
	ldr	x0, [x0]
	mov	x1, x0
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC10
	add	x1, x0, :lo12:.LC10
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	w0, 1
	bl	exit
.L43:
	ldr	w0, [sp, 12]
	cmp	w0, 1
	ble	.L44
	ldr	x0, [sp]
	add	x0, x0, 8
	ldr	x0, [x0]
	mov	x1, x0
	mov	x0, x19
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc
.LEHE11:
.L44:
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 40]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	beq	.L50
	b	.L53
.L51:
	mov	x19, x0
	add	x0, sp, 24
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	mov	x1, x19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 40]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L47
	bl	__stack_chk_fail
.L47:
	mov	x0, x1
.LEHB12:
	bl	_Unwind_Resume
.L52:
	mov	x20, x0
	mov	x0, x19
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	mov	x1, x20
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 40]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L49
	bl	__stack_chk_fail
.L49:
	mov	x0, x1
	bl	_Unwind_Resume
.LEHE12:
.L53:
	bl	__stack_chk_fail
.L50:
	mov	x0, x19
	ldp	x29, x30, [sp, 48]
	ldp	x19, x20, [sp, 64]
	add	sp, sp, 80
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2016:
	.section	.gcc_except_table
.LLSDA2016:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2016-.LLSDACSB2016
.LLSDACSB2016:
	.uleb128 .LEHB10-.LFB2016
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L51-.LFB2016
	.uleb128 0
	.uleb128 .LEHB11-.LFB2016
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L52-.LFB2016
	.uleb128 0
	.uleb128 .LEHB12-.LFB2016
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSE2016:
	.text
	.size	_Z9read_argsB5cxx11iPPc, .-_Z9read_argsB5cxx11iPPc
	.section	.rodata
	.align	3
.LC11:
	.string	"127.0.0.1"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2017:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2017
	sub	sp, sp, #160
	.cfi_def_cfa_offset 160
	stp	x29, x30, [sp, 128]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 128
	str	x19, [sp, 144]
	.cfi_offset 19, -16
	str	w0, [sp, 12]
	str	x1, [sp]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 120]
	mov	x1, 0
	mov	w0, 8080
	str	w0, [sp, 24]
	add	x0, sp, 16
	str	x0, [sp, 32]
	nop
	nop
	add	x0, sp, 16
	add	x3, sp, 56
	mov	x2, x0
	adrp	x0, .LC11
	add	x1, x0, :lo12:.LC11
	mov	x0, x3
.LEHB13:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE13:
	add	x0, sp, 16
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	add	x0, sp, 88
	mov	x8, x0
	ldr	x1, [sp]
	ldr	w0, [sp, 12]
.LEHB14:
	bl	_Z9read_argsB5cxx11iPPc
.LEHE14:
.LEHB15:
	bl	_Z13create_socketv
	str	w0, [sp, 28]
	add	x0, sp, 56
	mov	w1, 8080
	bl	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
	stp	x0, x1, [sp, 40]
	add	x0, sp, 40
	mov	x1, x0
	ldr	w0, [sp, 28]
	bl	_Z17connect_to_serveriR11sockaddr_in
	add	x0, sp, 88
	mov	x1, x0
	ldr	w0, [sp, 28]
	bl	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	ldr	w0, [sp, 28]
	bl	close
.LEHE15:
	mov	w19, 0
	add	x0, sp, 88
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	add	x0, sp, 56
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	mov	w1, w19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 120]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L61
	b	.L65
.L62:
	mov	x19, x0
	add	x0, sp, 16
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	mov	x1, x19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 120]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L57
	bl	__stack_chk_fail
.L57:
	mov	x0, x1
.LEHB16:
	bl	_Unwind_Resume
.L64:
	mov	x19, x0
	add	x0, sp, 88
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	b	.L59
.L63:
	mov	x19, x0
.L59:
	add	x0, sp, 56
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	mov	x1, x19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 120]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L60
	bl	__stack_chk_fail
.L60:
	mov	x0, x1
	bl	_Unwind_Resume
.LEHE16:
.L65:
	bl	__stack_chk_fail
.L61:
	mov	w0, w1
	ldp	x29, x30, [sp, 128]
	ldr	x19, [sp, 144]
	add	sp, sp, 160
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2017:
	.section	.gcc_except_table
.LLSDA2017:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2017-.LLSDACSB2017
.LLSDACSB2017:
	.uleb128 .LEHB13-.LFB2017
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L62-.LFB2017
	.uleb128 0
	.uleb128 .LEHB14-.LFB2017
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L63-.LFB2017
	.uleb128 0
	.uleb128 .LEHB15-.LFB2017
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L64-.LFB2017
	.uleb128 0
	.uleb128 .LEHB16-.LFB2017
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
.LLSDACSE2017:
	.text
	.size	main, .-main
	.section	.text._ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,comdat
	.align	2
	.weak	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.type	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, %function
_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc:
.LFB2018:
	.cfi_startproc
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, 48]
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 48
	str	x0, [sp, 8]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 40]
	mov	x1, 0
	str	xzr, [sp, 32]
	b	.L67
.L68:
	ldr	x0, [sp, 32]
	add	x0, x0, 1
	str	x0, [sp, 32]
.L67:
	ldr	x1, [sp, 8]
	ldr	x0, [sp, 32]
	add	x0, x1, x0
	strb	wzr, [sp, 31]
	add	x1, sp, 31
	bl	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	and	w0, w0, 255
	eor	w0, w0, 1
	and	w0, w0, 255
	and	w0, w0, 1
	cmp	w0, 0
	bne	.L68
	ldr	x0, [sp, 32]
	mov	x1, x0
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 40]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L70
	bl	__stack_chk_fail
.L70:
	mov	x0, x1
	ldp	x29, x30, [sp, 48]
	add	sp, sp, 64
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2018:
	.size	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, .-_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD5Ev,comdat
	.align	2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev:
.LFB2116:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2116:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.section	.rodata
	.align	3
.LC12:
	.string	"basic_string: construction from null is not valid"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align	2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LFB2294:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2294
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	ldr	x19, [sp, 56]
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv
	ldr	x2, [sp, 40]
	mov	x1, x0
	mov	x0, x19
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_
	ldr	x0, [sp, 48]
	cmp	x0, 0
	bne	.L73
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
.LEHB17:
	bl	_ZSt19__throw_logic_errorPKc
.L73:
	ldr	x0, [sp, 48]
	bl	_ZNSt11char_traitsIcE6lengthEPKc
	mov	x1, x0
	ldr	x0, [sp, 48]
	add	x0, x0, x1
	str	x0, [sp, 72]
	mov	w3, w20
	ldr	x2, [sp, 72]
	ldr	x1, [sp, 48]
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
.LEHE17:
	b	.L76
.L75:
	mov	x19, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	mov	x0, x19
.LEHB18:
	bl	_Unwind_Resume
.LEHE18:
.L76:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2294:
	.section	.gcc_except_table
.LLSDA2294:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2294-.LLSDACSB2294
.LLSDACSB2294:
	.uleb128 .LEHB17-.LFB2294
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L75-.LFB2294
	.uleb128 0
	.uleb128 .LEHB18-.LFB2294
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
.LLSDACSE2294:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.text._ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,comdat
	.align	2
	.weak	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.type	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, %function
_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_:
.LFB2298:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldrb	w1, [x0]
	ldr	x0, [sp]
	ldrb	w0, [x0]
	cmp	w1, w0
	cset	w0, eq
	and	w0, w0, 255
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2298:
	.size	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, .-_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.section	.text._ZNSt15__new_allocatorIcED2Ev,"axG",@progbits,_ZNSt15__new_allocatorIcED5Ev,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorIcED2Ev
	.type	_ZNSt15__new_allocatorIcED2Ev, %function
_ZNSt15__new_allocatorIcED2Ev:
.LFB2351:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2351:
	.size	_ZNSt15__new_allocatorIcED2Ev, .-_ZNSt15__new_allocatorIcED2Ev
	.weak	_ZNSt15__new_allocatorIcED1Ev
	.set	_ZNSt15__new_allocatorIcED1Ev,_ZNSt15__new_allocatorIcED2Ev
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC5EPS4_,comdat
	.align	2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, %function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_:
.LFB2358:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x1, [sp]
	str	x1, [x0]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2358:
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.align	2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, %function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev:
.LFB2361:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2361
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	cmp	x0, 0
	beq	.L83
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L83:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2361:
	.section	.gcc_except_table
.LLSDA2361:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2361-.LLSDACSB2361
.LLSDACSB2361:
.LLSDACSE2361:
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.align	2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag:
.LFB2356:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2356
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x29, x30, [sp, 96]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 96
	str	x19, [sp, 112]
	.cfi_offset 19, -16
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
	strb	w3, [sp]
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 88]
	mov	x1, 0
	ldr	x0, [sp, 16]
	str	x0, [sp, 48]
	ldr	x0, [sp, 8]
	str	x0, [sp, 56]
	ldr	x0, [sp, 48]
	nop
	str	x0, [sp, 64]
	ldr	x0, [sp, 56]
	str	x0, [sp, 72]
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 64]
	sub	x0, x1, x0
	nop
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	cmp	x0, 15
	bls	.L88
	add	x0, sp, 40
	mov	x2, 0
	mov	x1, x0
	ldr	x0, [sp, 24]
.LEHB19:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE19:
	mov	x1, x0
	ldr	x0, [sp, 24]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc
	ldr	x0, [sp, 40]
	mov	x1, x0
	ldr	x0, [sp, 24]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm
	b	.L89
.L88:
	ldr	x0, [sp, 24]
	str	x0, [sp, 80]
	nop
.L89:
	add	x0, sp, 48
	ldr	x1, [sp, 24]
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_
	ldr	x0, [sp, 24]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv
	ldr	x2, [sp, 8]
	ldr	x1, [sp, 16]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_
	str	xzr, [sp, 48]
	ldr	x0, [sp, 40]
	mov	x1, x0
	ldr	x0, [sp, 24]
.LEHB20:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm
.LEHE20:
	add	x0, sp, 48
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 88]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	beq	.L92
	b	.L94
.L93:
	mov	x19, x0
	add	x0, sp, 48
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	mov	x1, x19
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 88]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L91
	bl	__stack_chk_fail
.L91:
	mov	x0, x1
.LEHB21:
	bl	_Unwind_Resume
.LEHE21:
.L94:
	bl	__stack_chk_fail
.L92:
	ldp	x29, x30, [sp, 96]
	ldr	x19, [sp, 112]
	add	sp, sp, 128
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2356:
	.section	.gcc_except_table
.LLSDA2356:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2356-.LLSDACSB2356
.LLSDACSB2356:
	.uleb128 .LEHB19-.LFB2356
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB20-.LFB2356
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L93-.LFB2356
	.uleb128 0
	.uleb128 .LEHB21-.LFB2356
	.uleb128 .LEHE21-.LEHB21
	.uleb128 0
	.uleb128 0
.LLSDACSE2356:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align	3
	.type	DW.ref.__gxx_personality_v0, %object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.xword	__gxx_personality_v0
	.global	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 14.2.0-4ubuntu2~24.04) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
