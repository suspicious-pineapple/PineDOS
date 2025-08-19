#$HOME/opt/cross/i686-elf/bin/gcc -T ./linker.ld -o tmp/pinedos.bin -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o -lgcc
$HOME/opt/cross/bin/i686-elf-gcc -T ./linker.ld -o tmp/pinedos.bin -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o -lgcc

rm -r isodir
mkdir -p isodir/boot/grub
cp tmp/pinedos.bin isodir/boot/pinedos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o pinedos.iso isodir
qemu-system-i386 -cdrom pinedos.iso