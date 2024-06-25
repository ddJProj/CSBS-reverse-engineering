; Created by Edward Johnson 
; SNHU - CS410
; Module 6 Binary to C++ : with Security Vulnerabilities
; 06/12/24




;------------------------------------------------------------
;--------------   DisplayMenu function start ----------------
;------------------------------------------------------------

1199 <DisplayMenu()>:

    1199:       ; push base ptr to stack
    55                          push   %rbp
    
    119a:       ; move set base ptr to current stack's ptr, setting up frame for fn call
    48 89 e5             	mov    %rsp,%rbp
    
    119d:       ; load address of string '-' <repeated 16 times> into %rsi (2nd arg reg)
    48 8d 35 61 0e 00 00 	lea    0xe61(%rip),%rsi        # 2005 <std::piecewise_construct+0x1>
    
    11a4:       ; load the address of std::cout method into 1st arg register 
    48 8d 3d d5 2e 00 00 	lea    0x2ed5(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    11ab:       ; call the std::cout method to output the line composed of string '-' printed 16 times
    e8 a0 fe ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    11b0:       ; load the address of string of the string "- 1)Add -" into the second arg register
    48 8d 35 5f 0e 00 00 	lea    0xe5f(%rip),%rsi        # 2016 <std::piecewise_construct+0x12>
    
    11b7:       ; load the address of cout method from 0x2ec2 bytes beyond instructio ptr into 1st arg register
    48 8d 3d c2 2e 00 00 	lea    0x2ec2(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    11be:       ; call the cout method to output the string "- 1)Add -" for the first menu option
    e8 8d fe ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
 
    11c3:       ; load the address of string "- 2)Subtract -" into the second argument register %rsi
    48 8d 35 56 0e 00 00 	lea    0xe56(%rip),%rsi        # 2020 <std::piecewise_construct+0x1c>
    
    11ca:       ; load the address of cout method into the first argument register %rdi
    48 8d 3d af 2e 00 00 	lea    0x2eaf(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    11d1:       ; call the cout method to output the string "- 2)Subtract -"
    e8 7a fe ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    11d6:       ; load the address of the string "- 3)Multiply -" into the second arg register %rsi
    48 8d 35 52 0e 00 00 	lea    0xe52(%rip),%rsi        # 202f <std::piecewise_construct+0x2b>
    
    11dd:       ; load the address of cout method into first arg register %rdi
    48 8d 3d 9c 2e 00 00 	lea    0x2e9c(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    11e4:       ; call the cout method to output the string "- 3)Multiply -"
    e8 67 fe ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>

    11e9:       ; load the address of the string "- 4)Exit -" into the second argument register 
    48 8d 35 4e 0e 00 00 	lea    0xe4e(%rip),%rsi        # 203e <std::piecewise_construct+0x3a>

    11f0:       ; load the cout method into the first argument register
    48 8d 3d 89 2e 00 00 	lea    0x2e89(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>

    11f7:       ; call the cout method to output the string "- 4)Exit -"
    e8 54 fe ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<
    char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>

    11fc:       ; load address of string '-' <repeated 16 times> into %rsi (2nd arg reg)
    48 8d 35 02 0e 00 00 	lea    0xe02(%rip),%rsi        # 2005 <std::piecewise_construct+0x1>

    1203:       ; load the address of std::cout method into 1st arg register 
    48 8d 3d 76 2e 00 00 	lea    0x2e76(%rip),%rdi        # 4080 <std:
    :cout@GLIBCXX_3.4>
    
    120a:       ; call the std::cout method to output the line composed of string '-' printed 16 times
    e8 41 fe ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    120f:	; no operation
    90                   	nop
    
    1210:       ; pop this stack's base pointer in preparation to reset stack frame for return 
    5d                   	pop    %rbp
    
    1211:       ; return from the function call
    c3                   	ret





;------------------------------------------------------------
;--------------   Main function start -----------------------
;------------------------------------------------------------

;local vars:
;input control var: -0x14(%rbp) (20bytes)
;first input integer: -0x10(%rbp) (16bytes)
;second input integer: -0xc(%rbp) (12bytes)

1212 <main>:
    
    1212:       ; push the base pointer to the stack as part of main fn prologue / setup
    55                   	push   %rbp
    
    1213:       ; move the value of stack pointer to new base pointer, setting up frame for fn's stack
    48 89 e5             	mov    %rsp,%rbp
    
    1216:       ; allocate 32bytes on stack for fn by subtracting them from stack ptr
    48 83 ec 20          	sub    $0x20,%rsp
    
    121a:       ; move the set value for the stack canary into %rax 
    64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    
    1221:       ;
    00 00 
    
    1223:       ; move the stack canary value from rax to position on stack 8 bytes below %rbp
    48 89 45 f8          	mov    %rax,-0x8(%rbp)
    
    1227:       ; set the value in %eax to zero with exclusive or on itself
    31 c0                	xor    %eax,%eax
    
    1229:       ; move value 0 into the address 20bytes below %rbp on the stack
    c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)

    ; get loop control variable
    1230:       ; BEgin loop: move the value stored 20bytes below %rbp (0) into %eax for processing
    8b 45 ec             	mov    -0x14(%rbp),%eax
    ; check if conditions met
    1233:       ; compare the value in eax (initially 0, then = first input) against the integer value 5
    83 f8 05             	cmp    $0x5,%eax
    
    1236:       ; jump to address 14a1 (end of loop) if the values are equal
    0f 84 65 02 00 00    	je     14a1 <main+0x28f>
    
    ; printing menu in main function instead of calling DisplayMenu()
    123c:       ; load the address of string '-' repeated 16 times, then a newline char, into 2nd arg register
    48 8d 35 06 0e 00 00 	lea    0xe06(%rip),%rsi        # 2049 <std::piecewise_construct+0x45>
    
    1243:       ; load the address of cout method address into the first argument register from 0x2e36 bytes beyond instruction ptr
    48 8d 3d 36 2e 00 00 	lea    0x2e36(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    124a:       ; call cout method to output string '-' repeated 16 times, then a newline char
    e8 01 fe ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    124f:       ; load the address of string "- 1)Add -\n", then a newline char, into the 2nd arg register
    48 8d 35 05 0e 00 00 	lea    0xe05(%rip),%rsi        # 205b <std::piecewise_construct+0x57>
    
    1256:       ; load the address of cout method address into the first argument register from 0x2e23 bytes beyond instruction ptr
    48 8d 3d 23 2e 00 00 	lea    0x2e23(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    125d:       ; call the cout method to output the string "- 1)Add -"
    e8 ee fd ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1262:       ; load the address of string "- 2)Subtract -", then a newline char, into 2nd arg register
    48 8d 35 fd 0d 00 00 	lea    0xdfd(%rip),%rsi        # 2066 <std::piecewise_construct+0x62>
    
    1269:       ; load the address of cout method address into the first argument register from 0x2e10 bytes beyond instruction ptr
    48 8d 3d 10 2e 00 00 	lea    0x2e10(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    1270:       ; call the cout method to output the string "- 2)Subtract -", then a newline char
    e8 db fd ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1275:       ; load the address of string  "- 3)Multiply -", then a newline char, into 2nd arg register
    48 8d 35 fa 0d 00 00 	lea    0xdfa(%rip),%rsi        # 2076 <std::piecewise_construct+0x72>
    
    127c:       ; load the address of cout method address into the first argument register from 0x2dfd bytes beyond instruction ptr
    48 8d 3d fd 2d 00 00 	lea    0x2dfd(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    1283:       ; call the cout method to output the string "- 3)Multiply -", then a newline char
    e8 c8 fd ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1288:       ; load the address of string  "- 4)Exit -", then a newline char, into 2nd arg register
    48 8d 35 f7 0d 00 00 	lea    0xdf7(%rip),%rsi        # 2086 <std::piecewise_construct+0x82>
    
    128f:       ; load the address of cout method address into the first argument register from 0x2dea bytes beyond instruction ptr
    48 8d 3d ea 2d 00 00 	lea    0x2dea(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    1296:       ; call the cout method to output the string  "- 4)Exit -", then a newline char
    e8 b5 fd ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    129b:       ; load the address of string  '-' repeated 16 times, then a newline char, into 2nd arg register
    48 8d 35 a7 0d 00 00 	lea    0xda7(%rip),%rsi        # 2049 <std::piecewise_construct+0x45>
    
    12a2:       ; load the address of cout method address into the first argument register from 0x2dd7 bytes beyond instruction ptr
    48 8d 3d d7 2d 00 00 	lea    0x2dd7(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    12a9:       ; call the cout method to output the string '-' repeated 16 times, then a newline char
    e8 a2 fd ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    12ae:       ; load the address of the value 20bytes below %rbp into %rax
    48 8d 45 ec          	lea    -0x14(%rbp),%rax
    
    12b2:       ; move the address in %rax into 2nd argument register %rsi
    48 89 c6             	mov    %rax,%rsi
    
    12b5:       ; load the address 41a0 (containing cin) from 0x2ee4 bytes beyond the instruction pointer into %rdi
    48 8d 3d e4 2e 00 00 	lea    0x2ee4(%rip),%rdi        # 41a0 <std::cin@GLIBCXX_3.4>
    
    12bc:       ; call the cin input method to store user input into stack memory 20bytes below %rbp
    e8 6f fd ff ff       	call   1030 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
       
    ;get control variable for loop
    12c1:       ; move the value stored 20bytes below %rbp (input) to %eax register (32b integer for menu selection)
    8b 45 ec             	mov    -0x14(%rbp),%eax

    ; --------- loop branch 1 - check if conditions met
    12c4:       ; compare the value stored in %eax (user decision input) to the integer value 1
    83 f8 01             	cmp    $0x1,%eax
    
    ; if != jump to next branch
    12c7:       ; if the values are not equal, jump to instruction at address 1362 (next menu selection compare)
    0f 85 95 00 00 00    	jne    1362 <main+0x150>

    12cd:       ; load address 16bytes below %rbp into %rax in prep for another input
    48 8d 45 f0          	lea    -0x10(%rbp),%rax
    
    12d1:       ; move address from %rax to %rsi (2nd arg register used for first calculation integer)
    48 89 c6             	mov    %rax,%rsi
    
    12d4:       ; load address of cin into %rdi (1st arg register)
    48 8d 3d c5 2e 00 00 	lea    0x2ec5(%rip),%rdi        # 41a0 <std::cin@GLIBCXX_3.4>
    
    12db:       ; call cin method to get an integer value and store it into memory 16bytes below %rbp
    e8 50 fd ff ff       	call   1030 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    
    12e0:       ; move the cin fn call from %rax to %rdx
    48 89 c2             	mov    %rax,%rdx
    
    12e3:       ; load memory address 12bytes below %rbp into %rax
    48 8d 45 f4          	lea    -0xc(%rbp),%rax
    
    12e7:       ; move address from %rax into %rsi (2nd arg used for 2nd calculation integer)
    48 89 c6             	mov    %rax,%rsi
    
    12ea:       ; move cin back from %rdx to %rdi (1st arg)
    48 89 d7             	mov    %rdx,%rdi
    
    12ed:       ; call the cin method again to get another input, storing this value into memory 12bytes below %rbp
    e8 3e fd ff ff       	call   1030 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    
    12f2:       ; move the value stored in memory 16bytes below %rbp into %eax 
    8b 45 f0             	mov    -0x10(%rbp),%eax
    
    12f5:       ; move the value from %eax to %esi (2nd arg for 32bit values)
    89 c6                	mov    %eax,%esi
    
    12f7:       ; load the address of the cout method from 0x2d82 bytes beyond instruction ptr into %rdi (1st arg)
    48 8d 3d 82 2d 00 00 	lea    0x2d82(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    12fe:       ; call the cout method to output the value stored 16bytes below %rbp (first integer from the calculation)
    e8 8d fd ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    1303:       ; load the address of the string " - " into 2nd arg register %rsi
    48 8d 35 88 0d 00 00 	lea    0xd88(%rip),%rsi        # 2092 <std::piecewise_construct+0x8e>
    
    130a:       ; move the cout method from %rax to %rdi (1st arg)
    48 89 c7             	mov    %rax,%rdi
    
    130d:       ; call the cout method to output the string " - "
    e8 3e fd ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1312:       ; move the cout method from %rax (last fn called) into @rdx
    48 89 c2             	mov    %rax,%rdx
    
    1315:       ; move the value from 12bytes below %rbp into %eax
    8b 45 f4             	mov    -0xc(%rbp),%eax
    
    1318:       ; move the value from eax into 2nd arg register %esi (2nd 32bit integer for calc)
    89 c6                	mov    %eax,%esi
    
    131a:       ; move the cout method from %rdx to %rdi
    48 89 d7             	mov    %rdx,%rdi
    
    131d:       ; call the cout method to output the 2nd integer input for calculation
    e8 6e fd ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    1322:       ; load the address of string " = " into 2nd arg register
    48 8d 35 6d 0d 00 00 	lea    0xd6d(%rip),%rsi        # 2096 <std::piecewise_construct+0x92>
    
    1329:       ; move cout call from %rax to %rdi (1st arg)
    48 89 c7             	mov    %rax,%rdi
    
    132c:       ; call the cout method to output the string " = "
    e8 1f fd ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1331:       ; move the cout method from %rax to %rcx
    48 89 c1             	mov    %rax,%rcx
    
    1334:       ; move the first calc int value from 16 byte below %rbp to 32bit register %edx
    8b 55 f0             	mov    -0x10(%rbp),%edx
    
    1337:       ; move second calc int value from 12bytes below %rbp, into 32bit register %eax
    8b 45 f4             	mov    -0xc(%rbp),%eax
    
    133a:       ; subtract the value of %eax from the value in %edx
    29 c2                	sub    %eax,%edx
    
    133c:       ; move the value result of calc from  %edx to %eax
    89 d0                	mov    %edx,%eax
    
    133e:       ; move the value from %eax into %esi (2nd arg)
    89 c6                	mov    %eax,%esi
    
    1340:       ; move the cout method from %rcx to %rdi (1st arg)
    48 89 cf             	mov    %rcx,%rdi
    
    1343:       ; call the cout method to output the result from our integer subtraction
    e8 48 fd ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    1348:       ; move the cout method from %rax to %rdx
    48 89 c2             	mov    %rax,%rdx
    
    134b:       ; move the value std::endl from 0x2c66 bytes beyond instruction pointer into %rax
    48 8b 05 66 2c 00 00 	mov    0x2c66(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    1352:       ; move the std::endl method from %rax to %rsi (2nd arg)
    48 89 c6             	mov    %rax,%rsi
    
    1355:       ; move the cout method from %rdx to %rdi
    48 89 d7             	mov    %rdx,%rdi
    
    1358:       ; call the cout method to output the std::endl / new line character
    e8 03 fd ff ff       	call   1060 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
       
    ; end of branch 1 - restart loop
    135d:       ; jump to address 1230 in memory (essentially looping back to beginning of main)
    e9 ce fe ff ff       	jmp    1230 <main+0x1e>
    
    ; get control variable for loop
    1362:       ; move value 20bytes below %rbp into 32bit register %eax
    8b 45 ec             	mov    -0x14(%rbp),%eax
    
    ; ----------- loop branch 2 - check if conditions met
    1365:       ; compare the value in %eax (user decision input) to the integer value 2
    83 f8 02             	cmp    $0x2,%eax
    
    1368:       ; if the values are not equal jump to instruction at address 1401 (next menu selection compare)
    0f 85 93 00 00 00    	jne    1401 <main+0x1ef>
    
    136e:       ; load address of value 16bytes below %rbp into %rax
    48 8d 45 f0          	lea    -0x10(%rbp),%rax
    
    1372:       ; move the address from %rax to %rsi
    48 89 c6             	mov    %rax,%rsi
    
    1375:       ; load the address of cin method into %rdi (1st arg)
    48 8d 3d 24 2e 00 00 	lea    0x2e24(%rip),%rdi        # 41a0 <std::cin@GLIBCXX_3.4>
    
    137c:       ; call the cin method to get user input 
    e8 af fc ff ff       	call   1030 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    
    1381:       ; move the value of cin from %rax into %rdx
    48 89 c2             	mov    %rax,%rdx
    
    1384:       ; load the address of 12bytes below %rbp into %rax
    48 8d 45 f4          	lea    -0xc(%rbp),%rax
    
    1388:       ; move the address from %rax to %rsi (2nd arg)
    48 89 c6             	mov    %rax,%rsi
    
    138b:       ; move the cin method from %rdx to %rdi
    48 89 d7             	mov    %rdx,%rdi
    
    138e:       ; call the cin method to get input, storing it into memory 12bytes below %rbp
    e8 9d fc ff ff       	call   1030 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    
    1393:       ; move the value from 12bytes below %rbp into %eax
    8b 45 f0             	mov    -0x10(%rbp),%eax
    
    1396:       ; move the value from %eax to %esi (32bit 2nd arg)
    89 c6                	mov    %eax,%esi
    
    1398:       ; load the address of the cout method into %rdi
    48 8d 3d e1 2c 00 00 	lea    0x2ce1(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    139f:       ; call the cout method to output the input value stored in %esi
    e8 ec fc ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    13a4:       ; load the string " - " from address 2092 (0xce7 beyond instruction ptr)
    48 8d 35 e7 0c 00 00 	lea    0xce7(%rip),%rsi        # 2092 <std::piecewise_construct+0x8e>
    
    13ab:       ; move the cout method from %rax to 1st arg register
    48 89 c7             	mov    %rax,%rdi
    
    13ae:       ; call the cout method to output the string " - "
    e8 9d fc ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    13b3:       ; move cout fn call from %rax to %rdx
    48 89 c2             	mov    %rax,%rdx
    
    13b6:       ; move the value stored 12bytes below %rbp to %eax
    8b 45 f4             	mov    -0xc(%rbp),%eax
    
    13b9:       ; move the 32bit int value from %eax to 32bit 2nd arg register
    89 c6                	mov    %eax,%esi
    
    13bb:       ; move the cout method from %rdx to %rdi
    48 89 d7             	mov    %rdx,%rdi
    
    13be:       ; call the cout method to output the integer from %esi
    e8 cd fc ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    13c3:       ; load teh address of the string " = " into 2nd argument register 
    48 8d 35 cc 0c 00 00 	lea    0xccc(%rip),%rsi        # 2096 <std::piecewise_construct+0x92>
    
    13ca:       ; move the cout call from %rax to %rdi
    48 89 c7             	mov    %rax,%rdi
    
    13cd:       ; call the cout method to output the string " = "
    e8 7e fc ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    13d2:       ; move the cout method from  rax to %rcx
    48 89 c1             	mov    %rax,%rcx
    
    13d5:       ; move the integer value stored at 16bytes below %rbp into %edx 
    8b 55 f0             	mov    -0x10(%rbp),%edx
    
    13d8:       ; move the integer from 12bytes below %rbp into %eax
    8b 45 f4             	mov    -0xc(%rbp),%eax
    
    13db:       ; and the two 32bit integer values together from edx and eax
    01 d0                	add    %edx,%eax
    
    13dd:       ; move the resulting value from %eax to %esi(2nd arg)
    89 c6                	mov    %eax,%esi
    
    13df:       ; move the cout method from %rcx to %rdi (1st arg)
    48 89 cf             	mov    %rcx,%rdi
    
    13e2:       ; call the cout method to output the summed integer value from calculation (%esi)
    e8 a9 fc ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    13e7:       ; move the cout method from %rax to %rdx
    48 89 c2             	mov    %rax,%rdx
    
    13ea:       ; move the std::endl / new char method from address 3fb8 into %rax
    48 8b 05 c7 2b 00 00 	mov    0x2bc7(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    13f1:       ; move the endl char from %rax to %rsi
    48 89 c6             	mov    %rax,%rsi
    
    13f4:       ; move the cout method from %rdx to %rdi
    48 89 d7             	mov    %rdx,%rdi
    
    13f7:       ; call the cout method to output the newline char std::endl
    e8 64 fc ff ff       	call   1060 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
   
    ; end of branch 2 - restart loop
    13fc:       ; jump to the instruction at address 1230 effectively beginning the loop over
    e9 2f fe ff ff       	jmp    1230 <main+0x1e>
    
    ; get control variable for loop
    1401:       ; move the value from address 20bytes below %rbp (input decision) into %eax
    8b 45 ec             	mov    -0x14(%rbp),%eax
    
    ; ----------- loop branch 3 - check if conditions met
    1404:       ; compare the integer value 3 to the value stored in %eax (user decision input) 
    83 f8 03             	cmp    $0x3,%eax
    
    1407:       ; if the value of user menu decision not equal to 3, jump to instruction address 1230 (begin of loop comparison)
    0f 85 23 fe ff ff    	jne    1230 <main+0x1e>
    
    140d:       ; load the address 16bytes below %rbp into %rax
    48 8d 45 f0          	lea    -0x10(%rbp),%rax
    
    1411:       ; move the address from %rax to the 2nd arg register
    48 89 c6             	mov    %rax,%rsi
    
    1414:       ; load the address (41a0) of cin method into %rdi
    48 8d 3d 85 2d 00 00 	lea    0x2d85(%rip),%rdi        # 41a0 <std::cin@GLIBCXX_3.4>
    
    141b:       ; call the cin method to take user input integer into address 16bytes below %rbp
    e8 10 fc ff ff       	call   1030 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    
    1420:       ; move cin method from %rax to %rdx 
    48 89 c2             	mov    %rax,%rdx
    
    1423:       ; load the address of 12bytes below %rbp into %rax
    48 8d 45 f4          	lea    -0xc(%rbp),%rax
    
    1427:       ; move the address from %rax into 2nd arg register 
    48 89 c6             	mov    %rax,%rsi
    
    142a:       ; move cin method from %rdx to 1st arg register
    48 89 d7             	mov    %rdx,%rdi
    
    142d:       ; call cin method to get user input & store in memory 12bytes below %rbp
    e8 fe fb ff ff       	call   1030 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    
    1432:       ; move value stored 16bytes below %rbp into %eax
    8b 45 f0             	mov    -0x10(%rbp),%eax
    
    1435:       ; move 32bit int value from %eax to %esi
    89 c6                	mov    %eax,%esi
    
    1437:       ; load the address of the cout method into %rdi
    48 8d 3d 42 2c 00 00 	lea    0x2c42(%rip),%rdi        # 4080 <std::cout@GLIBCXX_3.4>
    
    143e:       ; call the cout method to output the integer in %esi
    e8 4d fc ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    1443:       ; load the address of string " - " into %rsi
    48 8d 35 48 0c 00 00 	lea    0xc48(%rip),%rsi        # 2092 <std::piecewise_construct+0x8e>
    
    144a:       ; move the cout call from %rax to %rdi
    48 89 c7             	mov    %rax,%rdi
    
    144d:       ; call the cout method to output the value of string " - "
    e8 fe fb ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1452:       ; move cout method from %rax to %rdx
    48 89 c2             	mov    %rax,%rdx
    
    1455:       ; move 32bit int value from 12bytes below %rbp to %eax
    8b 45 f4             	mov    -0xc(%rbp),%eax
    
    1458:       ; move int from %eax to %esi (2nd arg)
    89 c6                	mov    %eax,%esi
    
    145a:       ; move cout method froum %rdx to %rdi 
    48 89 d7             	mov    %rdx,%rdi
    
    145d:       ; call cout method to output second input integer value
    e8 2e fc ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    1462:       ; load the address of string " = " into %rsi
    48 8d 35 2d 0c 00 00 	lea    0xc2d(%rip),%rsi        # 2096 <std::piecewise_construct+0x92>
    
    1469:       ; move the cout fncall from %rax to %rdi 
    48 89 c7             	mov    %rax,%rdi
    
    146c:       ; call the cout method to output the string / char " = "
    e8 df fb ff ff       	call   1050 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1471:       ; move the cout method from %rax to %rcx
    48 89 c1             	mov    %rax,%rcx
    
    1474:       ; move the first 32bit integer input from 12bytes below %rbp into %eax
    8b 45 f0             	mov    -0x10(%rbp),%eax
    
    1477:       ; move the second 32bit integer input from 12bytes below %rbp into %esi (2nd arg)
    8b 75 f4             	mov    -0xc(%rbp),%esi
    
    147a:       ; extend sign bit (most signif.) of %eax into all bits of %edx (convert signed long to signed double long)
    ; source : https://docs.oracle.com/cd/E19455-01/806-3773/instructionset-49/index.html
    99                   	cltd
    
    147b:       ; using eax perform signed divide using source %eax, store result in %eax / remainder in %edx
    ; source : https://docs.oracle.com/cd/E19455-01/806-3773/instructionset-44/index.html
    f7 fe                	idiv   %esi
    
    147d:       ; move the quotient from %eax to %esi
    89 c6                	mov    %eax,%esi
    
    147f:       ; move cout from %rcx to %rdi
    48 89 cf             	mov    %rcx,%rdi
    
    1482:       ; call the cout method to output the quotient from calculation
    e8 09 fc ff ff       	call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    1487:       ; move cout method from %rax to %rdx
    48 89 c2             	mov    %rax,%rdx
    
    148a:       ; move newline char std::endl from memory to %rax
    48 8b 05 27 2b 00 00 	mov    0x2b27(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    1491:       ; move endl char from %rax to %rsi
    48 89 c6             	mov    %rax,%rsi
    
    1494:       ; move cout method from %rdx to %rdi
    48 89 d7             	mov    %rdx,%rdi
    
    1497:       ; call the cout method to output the std::endl character / line break
    e8 c4 fb ff ff       	call   1060 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    ; end of branch 3 - restart loop
    149c:       ; jump to instruction at address 1230 (beginning of main loop)
    e9 8f fd ff ff       	jmp    1230 <main+0x1e>
    
    14a1:       ; move int value 0 into %eax
    b8 00 00 00 00       	mov    $0x0,%eax
    
    14a6:       ; move stack canary value from 8bytes below %rbp into %rcx 
    48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    
    14aa:       ; exclusive or XOR the canary value from memory with the stack canary
    64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    
    14b1:       ;
    00 00 
    
    14b3:       ; jump to instruction at address 14ba the values are equal
    74 05                	je     14ba <main+0x2a8>
    
    14b5:       ; if values are not equal potential error, call stack chk fail function 
    e8 b6 fb ff ff       	call   1070 <__stack_chk_fail@plt>
    
    14ba:       ; otherwise wind down function normally / leave
    c9                   	leave
    
    14bb:       ; return from the main function, ending the program
    c3                   	ret






