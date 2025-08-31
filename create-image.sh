#$HOME/opt/cross/i686-elf/bin/gcc -T ./linker.ld -o tmp/pinedos.bin -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o -lgcc

echo "Compiling C thingys"
$HOME/opt/cross/bin/i686-elf-gcc -o tmp/main.o -ffreestanding -O2 -nostdlib -c src/main.c  -Wall -Wextra
$HOME/opt/cross/bin/i686-elf-gcc -o tmp/string.o -ffreestanding -O2 -nostdlib -c src/libc_freestanding/string.c  -Wall -Wextra
$HOME/opt/cross/bin/i686-elf-gcc -o tmp/kmalloc.o -ffreestanding -O2 -nostdlib -c src/libc_freestanding/kmalloc.c  -Wall -Wextra

$HOME/opt/cross/bin/i686-elf-gcc -o tmp/interrupts.o -ffreestanding -O2 -nostdlib -c src/interrupts.c  -Wall -Wextra  -mgeneral-regs-only  # general-regs-only needed here
	
echo "Linking.."
$HOME/opt/cross/bin/i686-elf-gcc -T ./linker.ld -o tmp/pinedos.bin -lgcc -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o tmp/main.o tmp/string.o tmp/interrupts.o tmp/kmalloc.o

rm -r isodir
mkdir -p isodir/boot/grub
cp tmp/pinedos.bin isodir/boot/pinedos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o pinedos.iso isodir
qemu-system-i386 -hda pinedos.iso -m 4096M
