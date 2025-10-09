# This makefile was made with qwen3 as a quick hack to get rid of the awful shell script. i know, i know, ai bad, but it seems to work


# Paths
# CROSS_COMPILE = ~/repos/PineDOS/cross/bin/bin/i686-elf-
CROSS_COMPILE = ~/opt/cross/bin/i686-elf-

NASM = nasm
GCC = $(CROSS_COMPILE)gcc
OBJCOPY = $(CROSS_COMPILE)objcopy
GRUB_MKRESCUE = grub-mkrescue
QEMU = qemu-system-i386

# Directories
SRC_DIR = src
TMP_DIR = tmp
ISO_DIR = isodir

# Files
KERNEL_BIN = tmp/pinedos.bin
GRUB_CFG = grub.cfg

# Source files
ASM_SOURCES = $(wildcard $(SRC_DIR)/*.asm)
C_SOURCES = $(wildcard $(SRC_DIR)/*.c)
C_SOURCES += $(wildcard $(SRC_DIR)/*/*.c)
C_SOURCES += $(wildcard $(SRC_DIR)/*/*/*.c)
C_SOURCES += $(wildcard $(SRC_DIR)/*/*/*/*.c)

# Object files
ASM_OBJS = $(patsubst $(SRC_DIR)/%.asm, $(TMP_DIR)/%.o, $(ASM_SOURCES))
C_OBJS = $(patsubst $(SRC_DIR)/%.c, $(TMP_DIR)/%.o, $(C_SOURCES))

# Linker script
LINKER_SCRIPT = linker.ld

# Target
TARGET = pinedos.iso

# Flags
CFLAGS = -ffreestanding -O2 -nostdlib -mno-red-zone -Wall -Wextra
LDFLAGS = -T $(LINKER_SCRIPT) -ffreestanding -O2 -nostdlib -lgcc

# Build all
all: $(TARGET)

# Rule for assembling .asm files
$(TMP_DIR)/%.o: $(SRC_DIR)/%.asm
	$(NASM) -felf32 $< -o $@

# Rule for compiling .c files (top-level)
$(TMP_DIR)/%.o: $(SRC_DIR)/%.c
	$(GCC) $(CFLAGS) -c $< -o $@

# Rule for compiling .c files in subdirectories
$(TMP_DIR)/%_%.o: $(SRC_DIR)/%/%.c
	$(GCC) $(CFLAGS) -c $< -o $@

# Rule for deeper subdirectories (e.g., src/dir1/dir2/file.c)
$(TMP_DIR)/%_%.o: $(SRC_DIR)/%/%/%.c
	$(GCC) $(CFLAGS) -c $< -o $@

# Linking the kernel
$(KERNEL_BIN): $(ASM_OBJS) $(C_OBJS)
	$(GCC) $(LDFLAGS) $^ -o $@

# Build the ISO
$(TARGET): $(KERNEL_BIN)
	mkdir -p $(ISO_DIR)/boot/grub
	cp $(KERNEL_BIN) $(ISO_DIR)/boot/pinedos.bin
	cp $(GRUB_CFG) $(ISO_DIR)/boot/grub/grub.cfg
	$(GRUB_MKRESCUE) -o $@ $(ISO_DIR)

# Run in QEMU
run: $(TARGET)
	$(QEMU) -hda $< -m 4096M -no-reboot -d int

# Clean
clean:
	rm -rf $(TMP_DIR)
	rm -f $(TARGET)
	mkdir -p $(TMP_DIR)
	mkdir $(TMP_DIR)/drivers
	mkdir $(TMP_DIR)/libc_freestanding

	
# Phony targets
.PHONY: all run clean
