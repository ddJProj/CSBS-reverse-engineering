; Created by Edward Johnson 06/05/24
; SNHU - CS410 - Project 1 

Project1:     file format elf64-x86-64



----------------------------------------------------
1219 <main>:
----------------------------------------------------

    1219:        ; begin main function prologue 
    push   %rbp         ; push base pointer to stack

    121a:        ; set base for main to the stack pointer
    mov    %rsp,%rbp

    121d:        ; load the address of string "Hello! Welcome to our Investment Company\n" into %rsi(arg2) 
    lea    0xdec(%rip),%rsi        # 2010 <std::piecewise_construct+0x8>
    
    1224:        ; load the address of the cout method into %rdi(arg1)
    lea    0x2f15(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    122b:        ; call the cout method to output string "Hello! Welcome to our Investment Company\n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1230:        ; call the CheckUserPermissionAccess function to authenticate user
    call   1339 <CheckUserPermissionAccess()>
    
    1235:        ; move the value for answer returned from CheckUserPermissionAccess to %rip(instruction pointer reg)
    mov    %eax,0x3165(%rip)        # 43a0 <answer>

    123b:        ; move value of answer into %eax(32b return)
    mov    0x315f(%rip),%eax        # 43a0 <answer>
    
    1241:        ; compare the value of answer to the value 1
    cmp    $0x1,%eax
    
    1244:        ; if answer equals 1 jump to address 1259
    je     1259 <main+0x40>
    
    1246:        ; load address of string "Invalid Password. Please try again\n" into %rsi(arg2)
    lea    0xdf3(%rip),%rsi        # 2040 <std::piecewise_construct+0x38>
    
    124d:        ; load address of the cout method into %rdi(arg1)
    lea    0x2eec(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    1254:        ; call the cout method to output string "Invalid Password. Please try again\n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1259:        ; move the value of answer return into %eax(32b return)
    mov    0x3141(%rip),%eax        # 43a0 <answer>
    
    125f:        ; compare the value of answer to the value 1
    cmp    $0x1,%eax
    
    1262:         ; jump to address 1266 if answer equals value 1
    je     1266 <main+0x4d>
    
    1264:        ; jump to address 1230 (start of authentication loop)
    jmp    1230 <main+0x17>
    
    1266:        ; load the address of string "What would you like to do?\n" into %rsi(arg2)
    lea    0xdf7(%rip),%rsi        # 2064 <std::piecewise_construct+0x5c>
    
    126d:        ; load the address of cout method into %rdi(arg1)
    lea    0x2ecc(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    1274:        ; call cout method to output string "What would you like to do?\n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1279:        ; load address of string "DISPLAY the client list (enter 1)\n" into %rsi(arg2)
    lea    0xe00(%rip),%rsi        # 2080 <std::piecewise_construct+0x78>
    
    1280:        ; load address of cout method into %rdi(arg1)
    lea    0x2eb9(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    1287:        ; call cout method to output string "DISPLAY the client list (enter 1)\n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    128c:        ; load address of string "CHANGE a client's choice (enter 2)\n" into %rsi(arg2)
    lea    0xe15(%rip),%rsi        # 20a8 <std::piecewise_construct+0xa0>
    
    1293:        ; load address of cout method into %rdi(arg1)
    lea    0x2ea6(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    129a:        ; call cout to output string "CHANGE a client's choice (enter 2)\n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    129f:        ; load address of string "Exit the program.. (enter 3)\n" into %rsi(arg2)
    lea    0xe26(%rip),%rsi        # 20cc <std::piecewise_construct+0xc4>
    
    12a6:        ; load address of cout into %rdi
    lea    0x2e93(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    12ad:        ; call cout method to output string "Exit the program.. (enter 3)\n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    12b2:        ; load address to store user input var "choice" into %rsi(arg2)
    lea    0x30db(%rip),%rsi        # 4394 <choice>
    
    12b9:        ; load address of cin input method into %rdi(arg1)
    lea    0x2fa0(%rip),%rdi        # 4260 <std::cin@GLIBCXX_3.4>
    
    12c0:        ; call cin method to store user input into address for "choice"
    call   1050 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    
    12c5:        ; load address of string "You chose " into %rsi 
    lea    0xe1e(%rip),%rsi        # 0x20ea <std::piecewise_construct+0xe2>
    
    12cc:        ; load address of cout method into %rdi(arg1)
    lea    0x2e6d(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    12d3:        ; call cout method to output string "You chose "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    12d8:        ; move last call (cout) from %rax(64b return) to %rdx(3rd arg)
    mov    %rax,%rdx
    
    12db:        ; move value of "choice" from address 0x30b3 into %eax
    mov    0x30b3(%rip),%eax        # 4394 <choice>
    
    12e1:        ; move choice from %eax to %esi(32b arg)
    mov    %eax,%esi
    
    12e3:        ; move cout method from %rdx to %rdi(arg1)
    mov    %rdx,%rdi
    
    12e6:        ; call the cout method to output the integer "choice"
    call   10f0 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    12eb:        ; move cout method from %rax(64b return) to %rdx(3rd arg)
    mov    %rax,%rdx
    
    12ee:        ; move std::endl into %rax 
    mov    0x2cc3(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    12f5:        ; move std::endl from %rax into %rsi
    mov    %rax,%rsi
    
    12f8:        ; move cout method from %rdx into %rdi(arg1) 
    mov    %rdx,%rdi
    
    12fb:        ; call cout method for std::endl to output a line break
    call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    1300:        ; move value of choice into %eax
    mov    0x308e(%rip),%eax        # 4394 <choice>
    
    1306:        ; compare the value of "choice" to the integer value 1
    cmp    $0x1,%eax
    
    1309:        ; if choice not equal to 1 jump to address 1312
    jne    1312 <main+0xf9>
    
    130b:        ; call function DisplayInfo()
    call   145a <DisplayInfo()>
    

    1310:        ; jump to address 1322
    jmp    1322 <main+0x109>
    
    1312:        ; move the value of "choice" into %eax
    mov    0x307c(%rip),%eax        # 4394 <choice>
    
    1318:        ; compare the value of "choice" to integer value 2
    cmp    $0x2,%eax
    
    131b:        ; if "choice" not equal to 2, jump to address 1322 (skip change choice function call)
    jne    1322 <main+0x109>
    
    131d:        ; Call ChangeCustomerChoice() function
    call   1646 <ChangeCustomerChoice()>
    
    1322:        ; move the value of "choice" into %eax
    mov    0x306c(%rip),%eax        # 4394 <choice>
    
    1328:        ; compare the value of "choice" to integer value 3
    cmp    $0x3,%eax
    
    132b:        ; if "choice" equals 3, jump to address 1332 (skip jump to start of loop / allow main() end)
    je     1332 <main+0x119>
    
    132d:        ; jump to address 1266, (restart action selection loop)
    jmp    1266 <main+0x4d>
    
    1332:        ; move value 0 into %eax for main() return / ending
    mov    $0x0,%eax


    1337:        ; pop %rbp / restore previous base pointer
    pop    %rbp
    
    1338:        ; return and end main()
    ret



----------------------------------------------------
01339 <CheckUserPermissionAccess()>:
----------------------------------------------------
    
    1339:        ; save the base pointer for calling stack / push %rbp to stack memory
    push   %rbp
    
    133a:        ; move base pointer for this frame to current stack pointer / setting up frame
    mov    %rsp,%rbp
    
    133d:        ; sets up register %rbx for frame
    push   %rbx
    
    133e:        ; reserve / subtract 72 bytes on the stack for func. variables
    sub    $0x48,%rsp
    
    1342:        ; move the stack canary value into %rax
    mov    %fs:0x28,%rax
    
    1349:
    00 00 
    
    134b:        ; move the stack canary value to stack memory at 24bytes below %rbp
    mov    %rax,-0x18(%rbp)
    
    134f:        ; set value in %eax to 0 by xor on itself
    xor    %eax,%eax
    
    1351:        ; load the address of 69bytes below %rbp on stack 
    lea    -0x45(%rbp),%rax
    
    1355:        ; move the address for this variable (69byte below %rbp) into %rdi 
    mov    %rax,%rdi
    
    1358:        ; call std::allocator to assign the memory needed for username value
    call   1110 <std::allocator<char>::allocator()@plt>
    
    135d:        ; load stack address of 69bytes below %rbp into %rdx, "username"
    lea    -0x45(%rbp),%rdx         ; username 
    
    1361:        ; load stack address of 64bytes below %rbp into %rax, "password"
    lea    -0x40(%rbp),%rax         ; password 
    
    1365:        ; load address containing placeholder string "" into %rsi
    lea    0xd89(%rip),%rsi        # 20f5 <std::piecewise_construct+0xed>
    
    136c:        ; move the address of "password" into %rdi(arg1) 
    mov    %rax,%rdi
    
    136f:        ; call std::string to initialize %rax / password with the placeholder string ""
    call   10d0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)@plt>
    
    1374:        ; load stack address of username into %rax
    lea    -0x45(%rbp),%rax
    
    1378:        ; move value of address in %rax into %rdi
    mov    %rax,%rdi
    
    137b:        ; dealloc reserved memory for variable username
    call   10a0 <std::allocator<char>::~allocator()@plt>
    
    1380:        ; move the integer value 0 to stack memory at 68bytes below %rbp
    movl   $0x0,-0x44(%rbp)
    
    1387:        ; load address of string "Enter your username: \n" into %rsi(arg2) 
    lea    0xd68(%rip),%rsi        # 0x20f6 <std::piecewise_construct+0xee>
    
    138e:        ; load address of cout method into %rdi(arg1)
    lea    0x2dab(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    1395:        ; call cout method to output string "Enter your username: \n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    139a:        ; load address of username into %rsi
    lea    0x2fdf(%rip),%rsi        # 4380 <username>
    
    13a1:        ; load address of cin input method into %rdi
    lea    0x2eb8(%rip),%rdi        # 4260 <std::cin@GLIBCXX_3.4>
    
    13a8:        ; call cin to store user input into memory for username variable
    call   1030 <std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char*)@plt>
    
    13ad:        ; load address of string "Enter your password: \n" into %rsi
    lea    0xd59(%rip),%rsi        # 210d <std::piecewise_construct+0x105>
    
    13b4:        ; load address of cout method into %rdi (arg1)
    lea    0x2d85(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    13bb:        ; call the cout method to output the string "Enter your password: \n" 
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>


    13c0:        ; load the address previously allocated for the password into %rax (64b return)
    lea    -0x40(%rbp),%rax
    
    13c4:        ; move the address from %rax to %rsi 
    mov    %rax,%rsi
    
    13c7:        ; load the address of the cin method into %rdi
    lea    0x2e92(%rip),%rdi        # 0x4260 <std::cin@GLIBCXX_3.4>
    
    13ce:        ; call the cin method to store the input "password" into allocated memory
    call   10c0 <std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)@plt>
    
    13d3:        ; load the address allocated on stack for "password" into %rax
    lea    -0x40(%rbp),%rax
    
    13d7:        ; load the address of the password string / "123" into %rsi
    lea    0xd46(%rip),%rsi        # 0x2124 <std::piecewise_construct+0x11c>
    
    13de:        ; move the address for password to %rdi
    mov    %rax,%rdi
    
    13e1:        ; call the string compare method to compare input password to password string "123"
    call   1040 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(char const*) const@plt>
    
    13e6:        ; store the result of string comparison at stack address 68bytes below %rbp
    mov    %eax,-0x44(%rbp)
    
    13e9:        ; compare the comparison result value stored at 68bytes below %rbp with value 0
    cmpl   $0x0,-0x44(%rbp)
    
    13ed:        ; jump to 13f6 if the result of 13e9 comparison not equal to 0 
    jne    13f6 <CheckUserPermissionAccess()+0xbd>
    
    13ef:        ; move the value 1 for success into %ebx (call preserved reg)
    mov    $0x1,%ebx
    
    13f4:        ; jump to 13fb
    jmp    13fb <CheckUserPermissionAccess()+0xc2>
    
    13f6:        ; move value 2 for fail into %ebx (call preserved register)
    mov    $0x2,%ebx
    
    13fb:        ; load address of 64bytes below %rbp into %rax (password)
    lea    -0x40(%rbp),%rax
    
    13ff:        ; move address in %rax to %rdi
    mov    %rax,%rdi
    
    1402:        ; call destructor "~basic_string" for string to clean up related password memory
    call   1060 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string()@plt>
    
    1407:        ; move the value %ebx (result from auth) into %eax for function return
    mov    %ebx,%eax
    

    1409:        ; move the stack canary value into %rcx
    mov    -0x18(%rbp),%rcx
    
    140d:        ; check the saved value for stack canary to current stack canary
    xor    %fs:0x28,%rcx
    
    00 00 
    
    1416:        ; if canary values match, jump to 1453
    je     1453 <CheckUserPermissionAccess()+0x11a>
    

    1418:        ; if values do not match, jump to 144e (stack error / possible overflow)
    jmp    144e <CheckUserPermissionAccess()+0x115>
    
    141a:        ; move the value in %rax to %rbx (unwinding steps)
    mov    %rax,%rbx
    
    141d:        ; move the value for username from stack memory to %rax
    lea    -0x45(%rbp),%rax
    
    1421:        ; move the value for username to %rdi
    mov    %rax,%rdi
    
    1424:        ; call "~allocator" destructor to clean up username related memory
    call   10a0 <std::allocator<char>::~allocator()@plt>
    
    1429:        ; move value of %rbx back to %rax (unwinding steps)
    mov    %rbx,%rax
    
    142c:        ; move the value in %rax to %rdi 
    mov    %rax,%rdi
    
    142f:        ;  call the unwinding resume method to continue next steps 
    call   1100 <_Unwind_Resume@plt>
    
    1434:        ; move the last called function (undwind) to %rbx
    mov    %rax,%rbx
    
    1437:        ; load the memory address of password into %rax
    lea    -0x40(%rbp),%rax
    
    143b:        ; move the address from %rax to %rdi
    mov    %rax,%rdi
    
    143e:        ; call the destructor "~basic_string" to clean up relevant memory storage for password 
    call   1060 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string()@plt>
    
    1443:        ; move the unwind function back from %rbx to %rax
    mov    %rbx,%rax
    
    1446:        ; move the function call from %rax to %rdi
    mov    %rax,%rdi
    
    1449:        ; call the unwind resume function
    call   1100 <_Unwind_Resume@plt>
    
    144e:        ; call the stack chk fail function (if no match detected @ 1418)
    call   10b0 <__stack_chk_fail@plt>
    
    1453:        ; add the 72bytes allocated for the function back to stack / dealloc
    add    $0x48,%rsp
    
    1457:        ; pop %rbx restoring saved value
    pop    %rbx
    
    1458:        ; pop %rbp restoring saved value
    pop    %rbp
    
    1459:        ; return from the CheckUserPermissionAccess() function call
    ret




----------------------------------------------------
0145a <DisplayInfo()>:
----------------------------------------------------
    
    145a:        ; begin main function prologue 
    push   %rbp
    
    145b:        ; set base for main to the stack pointer
    mov    %rsp,%rbp
    
    145e:        ; load the address for the header string "  Client's Name    Service Selected (1 = Brokerage, 2 = Retirement)"
    lea    0xcc3(%rip),%rsi        # 2128 <std::piecewise_construct+0x120>
    
    1465:        ; load the address for the cout method into %rdi
    lea    0x2cd4(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    146c:        ; call the cout method to output the header string
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1471:        ; move the cout method call to %rdx 
    mov    %rax,%rdx
    
    1474:        ; move address of new line method std::endl to %rax
    mov    0x2b3d(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    147b:        ; move endl from %rax to %rsi
    mov    %rax,%rsi
    
    147e:        ; move cout method from %rdx to %rdi
    mov    %rdx,%rdi
    
    1481:        ; call cout method to output a newline / std::endl
    call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    1486:        ; load the address of string "1. " into %rsi
    lea    0xcdf(%rip),%rsi        # 216c <std::piecewise_construct+0x164>
    
    148d:        ; load the address of cout method to %rdi
    lea    0x2cac(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    1494:        ; call the cout method to output string "1. "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1499:        ; load the address of the string "Bob Jones" / first client name into %rsi
    lea    0x2bf0(%rip),%rsi        # 4090 <name1>
    
    14a0:        ; move the cout method from %rax to %rdi 
    mov    %rax,%rdi
    
    14a3:        ; call cout to output the string "Bob Jones"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    14a8:        ; load the address of string " selected option " into %rsi
    lea    0xcc1(%rip),%rsi        # 0x2170 <std::piecewise_construct+0x168>
    
    14af:        ; load the cout method into %rax from %rdi
    mov    %rax,%rdi
    
    14b2:        ; call the cout method to output the string " selected option "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    14b7:        ; move the cout method from %rax to %rdx
    mov    %rax,%rdx
    
    14ba:        ; load the address of int "\001" into %eax (num1)
    mov    0x2c20(%rip),%eax        # 0x40e0 <num1>
    
    14c0:        ; move the value of num1 string from %eax to %esi
    mov    %eax,%esi
    
    14c2:        ; move the cout method from %rdx to %rdi 
    mov    %rdx,%rdi
    
    14c5:        ; call the cout method to output the int "\001"
    call   10f0 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    14ca:        ; move the cout method from %rax to %rdx 
    mov    %rax,%rdx
    
    14cd:        ;  move address of new line method std::endl to %rax
    mov    0x2ae4(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    14d4:        ; move endl to %rsi
    mov    %rax,%rsi
    
    14d7:        ; move cout from %rdx to %rdi
    mov    %rdx,%rdi
    
    14da:        ; call the cout method to output a line break / std::endl
    call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    14df:        ; load the address of string "2. " into %rsi
    lea    0xc9c(%rip),%rsi        # 2182 <std::piecewise_construct+0x17a>
    
    14e6:        ; load the cout method into %rdi
    lea    0x2c53(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    14ed:        ; call the cout method to output string "2. "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    14f2:        ; load the address of string "Sarah Davis" (name2) into %rsi
    lea    0x2ba7(%rip),%rsi        # 40a0 <name2>
    
    14f9:        ; move the cout method from %rax into %rdi
    mov    %rax,%rdi
    
    14fc:        ; call the cout method to output the string "Sarah Davis" (name2)
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1501:        ; load the address of string " selected option " into %rsi
    lea    0xc68(%rip),%rsi        # 2170 <std::piecewise_construct+0x168>
    
    1508:        ; move the cout method from %rax to %rdi
    mov    %rax,%rdi
    
    150b:        ; call the cout method to output the string " selected option "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1510:        ; move the cout method from %rax to %rdx
    mov    %rax,%rdx
    
    1513:        ; load the address of int "\002" (num2) into %eax
    mov    0x2bcb(%rip),%eax        # 40e4 <num2>
    
    1519:        ; move the address from %eax into %esi   
    mov    %eax,%esi
    
    151b:        ; move the cout method from %rdx to %rdi
    mov    %rdx,%rdi
    
    151e:        ; call cout method to output the int "\002"
    call   10f0 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    1523:        ; move cout method from %rax to %rdx
    mov    %rax,%rdx
    
    1526:        ; move the std::endl method into %eax
    mov    0x2a8b(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    152d:        ; move endl method from %rax to %rsi
    mov    %rax,%rsi
    
    1530:        ; move the cout method to %rdi
    mov    %rdx,%rdi
    
    1533:        ; call the cout method to output a line break (std::endl)
    call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    1538:        ; load the address of string "3. " into %rsi 
    lea    0xc47(%rip),%rsi        # 2186 <std::piecewise_construct+0x17e>
    
    153f:        ; load the address of cout into %rdi
    lea    0x2bfa(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    1546:        ; call the cout method to output the string "3. " 
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    154b:        ; load the address of string "Amy Friendly" (name3) into %rsi
    lea    0x2b5e(%rip),%rsi        # 40b0 <name3>
    
    1552:        ; move the cout method from %rax to %rdi 
    mov    %rax,%rdi
    
    1555:        ; call the cout method to output the string "Amy Friendly"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    155a:        ; load the address of string " selected option " into %rsi
    lea    0xc0f(%rip),%rsi        # 2170 <std::piecewise_construct+0x168>
    
    1561:        ; move the cout method from %rax to %rdi
    mov    %rax,%rdi
    
    1564:        ; call the cout method to output the string " selected option "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    1569:        ; move the cout method from %rax to %rdx
    mov    %rax,%rdx 
    
    156c:        ; move the value of int "\001" (num3) into %eax
    mov    0x2b76(%rip),%eax        # 40e8 <num3>
    
    1572:        ; move the value num3 from %eax to %esi
    mov    %eax,%esi
    
    1574:        ; move the cout method from %rax to %rdi
    mov    %rdx,%rdi
    
    1577:        ; call the cout method to output the value of int "\001" (num3)
    call   10f0 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    157c:        ; move the cout method from %rax to %rdx
    mov    %rax,%rdx
    

    157f:        ; move the value std::endl into %rax
    mov    0x2a32(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    1586:        ; move the endl char from %rax to %rsi
    mov    %rax,%rsi
    
    1589:        ; move the cout method from %rdx to %rdi
    mov    %rdx,%rdi
    
    158c:        ; call the cout method to output a line break (std::endl)
    call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    1591:        ; load the address of string "4. " into %rsi
    lea    0xbf2(%rip),%rsi        # 218a <std::piecewise_construct+0x182>
    
    1598:        ; load the address of cout method into %rdi
    lea    0x2ba1(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    159f:        ; call the cout method to output the string "4. "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    15a4:        ; load the address of string "Johnny Smith" (name4) into %rsi
    lea    0x2b15(%rip),%rsi        # 40c0 <name4>
    
    15ab:        ; move the cout method from %rax to %rdi
    mov    %rax,%rdi
    
    15ae:        ; call the cout method to output the string "Johnny Smith" (name4)
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    15b3:        ; move the string " selected option " into %rsi
    lea    0xbb6(%rip),%rsi        # 2170 <std::piecewise_construct+0x168>
    
    15ba:        ; move the cout method from %rax to %rdi
    mov    %rax,%rdi
    
    15bd:        ; call the cout method to output the string " selected option "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    15c2:        ; move the cout method from %rax to %rdx
    mov    %rax,%rdx
    
    15c5:        ; move the value of int "\001" (num4) into %eax
    mov    0x2b21(%rip),%eax        # 40ec <num4>
    
    15cb:        ; move the value of num4 from %eax to %esi
    mov    %eax,%esi
    
    15cd:        ; move the cout method from %rdx to %rdi
    mov    %rdx,%rdi
    
    15d0:        ; call the cout method to output int "\001" (num4) 
    call   10f0 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    15d5:        ; move the cout method from %rax to %rdx
    mov    %rax,%rdx
    
    15d8:        ; move the endl char into %rax
    mov    0x29d9(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    15df:        ; move the endl char from %rax to %rsi
    mov    %rax,%rsi
    
    15e2:        ; move the cout method from %rdx to %rdi
    mov    %rdx,%rdi
    
    15e5:        ; call the cout method to output a line break (std::endl)
    call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    15ea:        ; load the address of string "5. "
    lea    0xb9d(%rip),%rsi        # 218e <std::piecewise_construct+0x186>
    
    15f1:        ; load the address of the cout method (string/char)
    48 8d 3d 48 2b 00 00 
    lea    0x2b48(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    
    15f8:        ; call the cout method to output the string "5. "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    15fd:        ; load the address of the string "Carol Spears" (name5)
    lea    0x2acc(%rip),%rsi        # 40d0 <name5>
    
    1604:        ; move the cout method from %rax to %rdi
    mov    %rax,%rdi
    
    1607:        ; call the cout method to output the string "Carol Spears"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    160c:        ; load the address of string " selected option " into %rsi
    lea    0xb5d(%rip),%rsi        # 2170 <std::piecewise_construct+0x168>
    
    1613:        ; move the cout method from %rax to %rdi
    mov    %rax,%rdi
    
    1616:        ; call the cout method to output the string " selected option "
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    
    161b:                ; move the cout method from %rax to %rdx 
    mov    %rax,%rdx
    
    161e:        ; move the int value "\002" (num5) into %eax
    mov    0x2acc(%rip),%eax        # 40f0 <num5>
    
    1624:        ; move the value of num5 from %eax into %esi
    mov    %eax,%esi
    
    1626:        ; move the cout method from %rdx to %rdi
    mov    %rdx,%rdi
    
    1629:        ; call the cout method (int) to output the int "\002" (num5)
    call   10f0 <std::basic_ostream<char, std::char_traits<char> >::operator<<(int)@plt>
    
    162e:        ; move the cout method from %rax to %rdx
    mov    %rax,%rdx
    
    1631:        ; move the endl char into %rax
    mov    0x2980(%rip),%rax        # 3fb8 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    
    1638:        ; move the cout method from %rax to %rsi
    mov    %rax,%rsi
    
    163b:        ; move the endl char from %rdx into %rdi 
    mov    %rdx,%rdi
    
    163e:        ; call the cout method to output a line break (std::endl)
    call   1090 <std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))@plt>
    
    1643:        ; no operations
    nop
    
    1644:        ; restore previous base pointer / pop current
    pop    %rbp
    
    1645:        ; return from the display function call
    ret





----------------------------------------------------
1646 <ChangeCustomerChoice()>:
----------------------------------------------------
    
    1646:        ; begin main function prologue 
    push   %rbp
    

    1647:        ; set base for main to the stack pointer
    mov    %rsp,%rbp
    

    164a:        ; load the address of string "Enter the number of the client that you wish to change\n" into %rsi
    lea    0xb47(%rip),%rsi        # 2198 <std::piecewise_construct+0x190>
    

    1651:        ; load the address of cout method (char/string)
    lea    0x2ae8(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    

    1658:        ; call the cout method to output the string  "Enter the number of the client that you wish to change\n"
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    

    165d:        ; load the address allocated (0x4398) for variable changechoice into %rsi
    lea    0x2d34(%rip),%rsi        # 4398 <changechoice>
    

    1664:        ; load the address of the cin input method into %rdi
    lea    0x2bf5(%rip),%rdi        # 4260 <std::cin@GLIBCXX_3.4>
    

    166b:        ; call the cin input method and store the value into changechoice
    call   1050 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    

    1670:        ; load the address of string "Please enter the client's new service choice (1 = Brokerage, 2 = Retirement)\n" into %rsi
    lea    0xb59(%rip),%rsi         # 21d0 <std::piecewise_construct+0x1c8>
    

    1677:        ; load the address of the cout method into %rdi
    lea    0x2ac2(%rip),%rdi        # 4140 <std::cout@GLIBCXX_3.4>
    

    167e:        ; call cout method to output string "Please enter the client's new service choice (1 = Brokerage, 2 = Retirement)\n" 
    call   1080 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    

    1683:        ; load the address allocated (0x439c) for variable newservice into %rsi
    lea    0x2d12(%rip),%rsi        # 439c <newservice>
    

    168a:        ; load the cin input method into %rdi
    lea    0x2bcf(%rip),%rdi        # 4260 <std::cin@GLIBCXX_3.4>
    

    1691:        ; call the cin input method and store the result into newservice 
    call   1050 <std::basic_istream<char, std::char_traits<char> >::operator>>(int&)@plt>
    

    
; begin switch / conditional statements

    1696:        ; for the first branch / selection move the value of changechoice variable into %eax
    mov    0x2cfc(%rip),%eax        # 4398 <changechoice>
    

    169c:        ; compare the value of changechoice to the value 1
    cmp    $0x1,%eax 
    

    169f:        ; if value of changechoice in %eax not equal to 1, jump to address 16af / second branch
    jne    16af <ChangeCustomerChoice()+0x69>
    

    16a1:        ; move the value of newservice into %eax
    mov    0x2cf5(%rip),%eax        # 439c <newservice>
    

    16a7:        ; move updated value stored in %eax (newservice) into variable num1 at address 0x40e0 
    mov    %eax,0x2a33(%rip)        # 40e0 <num1>
    

    16ad:        ; jump to address 1711 (end of the function)
    jmp    1711 <ChangeCustomerChoice()+0xcb>
    

    16af:        ; for second branch / selection move input value of changechoice into %eax
    mov    0x2ce3(%rip),%eax        # 4398 <changechoice>
    

    16b5:        ; compare the changechoice value in %eax to value the value
    cmp    $0x2,%eax
    

    16b8:        ; if changechoice not equal 2, jump to 16c8 (branch / selection 3) 
    jne    16c8 <ChangeCustomerChoice()+0x82>
    

    16ba:        ; move the value of newservice into %eax
    mov    0x2cdc(%rip),%eax        # 439c <newservice>
    

    16c0:        ; move updated value stored in %eax (newservice) into variable num2 at address (0x40e4)
    mov    %eax,0x2a1e(%rip)        # 40e4 <num2>
    

    16c6:        ; jump to the end of the function (address 1711)
    jmp    1711 <ChangeCustomerChoice()+0xcb>
    

    16c8:        ;  for third branch / selection move input value of changechoice into %eax
    mov    0x2cca(%rip),%eax        # 4398 <changechoice>
    

    16ce:        ; compare value of changechoice (num3) to the value 3
    cmp    $0x3,%eax
    

    16d1:        ; if changechoice not equal 3, jump to 16e1 (branch / selection 4) 
    jne    16e1 <ChangeCustomerChoice()+0x9b>
    

    16d3:        ; move the value of newservice into %eax
    mov    0x2cc3(%rip),%eax        # 439c <newservice>
    

    16d9:        ; move updated value stored in %eax (newservice) into variable num2 at address (0x40e4)
    mov    %eax,0x2a09(%rip)        # 40e8 <num3>
    

    16df:        ; jump to the end of the function (address 1711)
    jmp    1711 <ChangeCustomerChoice()+0xcb>
    

    16e1:        ; for fourth branch / selection move input value of changechoice into %eax
    mov    0x2cb1(%rip),%eax        # 4398 <changechoice>
    

    16e7:        ; compare value of changechoice (num4) to the value 4
    cmp    $0x4,%eax
    

    16ea:        ;  if changechoice not equal 4, jump to 16fa (branch / selection 5) 
    jne    16fa <ChangeCustomerChoice()+0xb4>
    

    16ec:        ; move the value of newservice into %eax
    mov    0x2caa(%rip),%eax        # 439c <newservice>
    

    16f2:        ; move updated value stored in %eax (newservice) into variable num4 at address (0x40ec)
    mov    %eax,0x29f4(%rip)        # 40ec <num4>
    

    16f8:        ; jump to the end of the function (address 1711)
    jmp    1711 <ChangeCustomerChoice()+0xcb>
    

    16fa:        ; for fifth branch / selection move input value of changechoice into %eax
    mov    0x2c98(%rip),%eax        # 4398 <changechoice>
    

    1700:        ; compare value of changechoice (num5) to the value 5
    cmp    $0x5,%eax
    

    1703:        ; jump to the end of the function (address 1711)
    jne    1711 <ChangeCustomerChoice()+0xcb>
    

    1705:        ; move the value of newservice into %eax
    mov    0x2c91(%rip),%eax        # 439c <newservice>
    

    170b:        ; move updated value stored in %eax (newservice) into variable num5 at address (0x40f0)
    mov    %eax,0x29df(%rip)        # 40f0 <num5>
    

    1711:        ; no operations 
    nop

    
    1712:        ; pop %rbp to restore previous base pointer (for calling function)
    pop    %rbp
    

    1713:        ; return from the function call
    ret

