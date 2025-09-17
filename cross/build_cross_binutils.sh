export PREFIX="$HOME/repos/PineDOS/cross/bin"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

#cd /mnt/c/Users/User/Documents/GitHub/PineDOS/cross

cd binutils-gdb
mkdir build
cd build
../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make -j 8
make install -j 8
