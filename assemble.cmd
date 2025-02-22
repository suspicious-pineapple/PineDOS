@echo off
::C:\Program Files\NASM\NASM.exe
::D:\Program Files\qemu

::add these to path temporarily

setlocal
set PATH=%PATH%;C:\Program Files\NASM;D:\Program Files\qemu

::if tmp not exist, create it
if not exist tmp mkdir tmp

nasm -f bin boot.asm -o tmp\os.bin
::run
qemu-system-i386 -fda tmp\os.bin -drive format=raw,file=tmp\os.bin,if=virtio