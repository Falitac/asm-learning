.globl print_call_rsp
.globl print_ret_rsp
.globl nwd

##########################################################

.data
cntr:		.long	0
outstr1:	.ascii	"rsp=%lx call counter = %d\n\0"
outstr2:	.ascii	"rsp=%lx ret  counter = %d\n\0"

##########################################################

.text

.type	print_call_rsp,@function
.type	print_ret_rsp,@function
.type	nwd,@function

##########################################################

print_call_rsp:

mov	cntr(%rip),%edx
inc	%edx
mov	%edx,cntr(%rip)
lea	outstr1(%rip),%rdi

jmp	print_rsp

##########################################################

print_ret_rsp:

mov	cntr(%rip),%edx
decl	cntr(%rip)
lea	outstr2(%rip),%rdi

##########################################################

print_rsp:

sub	$8,%rsp
lea	16(%rsp),%rsi
xor	%eax,%eax
call	printf@plt
add	$8,%rsp
ret

##########################################################

nwd:

# zabezpiecz odpowiednie rejestry przed nadpisaniem
# i wywolaj print_call_rsp

push	%rdi
push	%rsi
call	print_call_rsp@plt
pop	%rsi
pop	%rdi


or	%esi,%esi
je	koniec_nwd
xor	%edx,%edx
mov	%edi,%eax
div	%esi

mov	%esi,%edi
mov	%edx,%esi
call	nwd@plt

koniec_nwd:

# zabezpiecz odpowiednie rejestry przed nadpisaniem
# i wywolaj print_ret_rsp

push	%rdi
push	%rsi
call	print_ret_rsp@plt
pop	%rsi
pop	%rdi

mov	%edi,%eax
ret

