@echo off
::C:\Program Files\NASM\NASM.exe
::D:\Program Files\qemu

::add these to path temporarily


setlocal
set PATH=%PATH%;C:\Program Files\NASM;D:\Program Files\qemu
nasm -felf32 boot.asm -o tmp/boot.o
nasm -felf32 kernel32.asm -o tmp/kernel.o


wsl bash -e ./create-image.sh
::run
