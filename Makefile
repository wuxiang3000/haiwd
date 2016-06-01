TARGET = fs_w100ap_$(shell date +%Y%m%d%H%M).bin

BOARD = ac15
MODEL = w100ap
CFE_END = 40000
KERNEL_END = 1d8d14
ROOTFS_END = fc0000
all: cfe trx vmlinuz fs rootfs
	cp fs_$(MODEL)_patch/* squashfs-root/ -fr -d
	/usr/local/bin/mksquashfs squashfs-root sqfs_$(MODEL).bin -comp xz -b 131072 -all-root -noappend
	./tools/trx -o us_$(BOARD).bin vmlinuz sqfs_$(MODEL).bin
	dd if=/dev/zero of=$(TARGET) bs=1M count=16
	cp cfe temp.bin
	cat us_$(BOARD).bin >> temp.bin
	dd if=temp.bin of=$(TARGET) conv=notrunc
	rm -rf temp.bin
	rm -rf fs
	rm -rf us_$(BOARD).bin
cfe: 
	dd if=fs_$(BOARD).bin of=cfe bs=1  count=$$((16#$(CFE_END)))
trx: 
	dd if=fs_$(BOARD).bin of=trx bs=1 skip=$$((16#$(CFE_END))) count=$$[$$((16#$(ROOTFS_END))) - $$((16#$(CFE_END)))]
vmlinuz: trx
	dd if=trx of=vmlinuz skip=28 bs=1 count=$$[$$((16#$(KERNEL_END))) - 28 - $$((16#$(CFE_END)))]
fs: trx
	dd if=fs_$(BOARD).bin of=fs bs=1 skip=$$[$$((16#$(KERNEL_END)))] count=$$[$$((16#$(ROOTFS_END))) - $$((16#$(KERNEL_END)))]
rootfs: fs
	rm -rf squashfs-root
	/usr/local/bin/unsquashfs fs
clean:
	rm -rf cfe
	rm -rf trx
	rm -rf vmlinuz
	rm -rf fs
	rm -rf squashfs-root	
	rm -rf fs_w100ap_*.bin
	rm -rf sqfs_w100ap.bin
