#$HOME/opt/cross/i686-elf/bin/gcc -T ./linker.ld -o tmp/pinedos.bin -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o -lgcc

nasm -felf32 src/boot.asm -o tmp/boot.o
nasm -felf32 src/kernel32.asm -o tmp/kernel.o




echo "Compiling C thingys"
$HOME/repos/PineDOS/cross/bin/bin/i686-elf-gcc -mno-red-zone -o tmp/main.o -ffreestanding -O2 -nostdlib -c src/main.c  -Wall -Wextra
$HOME/repos/PineDOS/cross/bin/bin/i686-elf-gcc -mno-red-zone -o tmp/string.o -ffreestanding -O2 -nostdlib -c src/libc_freestanding/string.c  -Wall -Wextra
$HOME/repos/PineDOS/cross/bin/bin/i686-elf-gcc -mno-red-zone -o tmp/kmalloc.o -ffreestanding -O2 -nostdlib -c src/libc_freestanding/kmalloc.c  -Wall -Wextra
$HOME/repos/PineDOS/cross/bin/bin/i686-elf-gcc -mno-red-zone -o tmp/scheduler.o -ffreestanding -O2 -nostdlib -c src/scheduler.c  -Wall -Wextra

$HOME/repos/PineDOS/cross/bin/bin/i686-elf-gcc -mno-red-zone -o tmp/interrupts.o -ffreestanding -O2 -nostdlib -c src/interrupts.c  -Wall -Wextra  -mgeneral-regs-only  # general-regs-only needed here

echo "Linking.."
$HOME/repos/PineDOS/cross/bin/bin/i686-elf-gcc -T ./linker.ld -o tmp/pinedos.bin -lgcc -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o tmp/main.o tmp/string.o tmp/interrupts.o tmp/kmalloc.o tmp/scheduler.o

rm -r isodir
mkdir -p isodir/boot/grub
cp tmp/pinedos.bin isodir/boot/pinedos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub2-mkrescue -o pinedos.iso isodir
qemu-system-i386 -hda pinedos.iso -m 4096M -no-reboot -d int
