# Multi-module prerequisites
[Add to PATH](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/) the folder where you have nasm.exe and alink.exe, i.e. C:\Users\{USER_NAME}\Documents\ubb\ASM_tools\asm_tools\nasm.

# Links
- [Click here for the laboratory theory](https://mrlini.github.io/teaching/csa/lab_08/)
- [Click here for more theory](https://www.cs.ubbcluj.ro/~vancea/asc/en-lab11-teorie.php)
- Extra video - [Programming in Assembly without an Operating System](https://www.youtube.com/watch?v=ZFHnbozz7b4)

# Practice exercises
Open the practice-exercises folder for more exercises if you want to practice.

# How to run the examples - Windows
### a+b
```
cd a+b
nasm -f obj main.asm
nasm -f obj sum.asm
alink main.obj sum.obj -oPE -subsys console -entry start
```

Or in a single line:
```
nasm -f obj main.asm ; nasm -f obj sum.asm ; alink main.obj sum.obj -oPE -subsys console -entry start
```

### gcd
```
cd gcd
nasm -f obj main.asm
nasm -f obj gcd.asm
alink main.obj gcd.obj -oPE -subsys console -entry start
```

Or in a single line:
```
nasm -f obj main.asm ; nasm -f obj gcd.asm ; alink main.obj gcd.obj -oPE -subsys console -entry start
```
