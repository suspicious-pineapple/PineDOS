@echo off
::C:\Program Files\NASM\NASM.exe
::D:\Program Files\qemu

::add these to path temporarily

setlocal
set PATH=%PATH%;C:\Program Files\NASM;D:\Program Files\qemu

::if tmp not exist, create it
if not exist tmp mkdir tmp
del tmp\boot.bin
del tmp\kernel16.bin

nasm -f bin boot.asm -o tmp\boot.bin
nasm -f bin kernel16.asm -o tmp\kernel16.bin

type tmp\boot.bin > tmp\os.img
type tmp\kernel16.bin >> tmp\os.img


::run
qemu-system-i386 -fda tmp\os.img -drive format=raw,file=tmp\os.img,if=virtio