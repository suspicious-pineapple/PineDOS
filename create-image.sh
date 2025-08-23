#$HOME/opt/cross/i686-elf/bin/gcc -T ./linker.ld -o tmp/pinedos.bin -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o -lgcc

echo "Compiling C thingys"
$HOME/opt/cross/bin/i686-elf-gcc -o tmp/main.o -ffreestanding -O2 -nostdlib -c src/main.c -Wall -Wextra
echo "Linking.."
$HOME/opt/cross/bin/i686-elf-gcc -T ./linker.ld -o tmp/pinedos.bin -ffreestanding -O2 -nostdlib tmp/boot.o tmp/kernel.o tmp/main.o -lgcc

rm -r isodir
mkdir -p isodir/boot/grub
cp tmp/pinedos.bin isodir/boot/pinedos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o pinedos.iso isodir
qemu-system-i386 -cdrom pinedos.iso