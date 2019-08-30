
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/florian/Builds/kernel/toolchains/ARM32/gcc-linaro-4.9.4-2017.01-x86_64_arm-eabi/bin/arm-eabi-
FILE="Crystal_Kernel_$(date +%Y%m%d_%H%M%S)"
rm -R /home/florian/Builds/outWatch/
rm /home/florian/android-unpackbootimg/boot.img-zImage
mkdir -p /home/florian/Builds/outWatch/
make clean
make -C $(pwd)  O=/home/florian/Builds/outWatch/ catshark_defconfig
make -C $(pwd)  O=/home/florian/Builds/outWatch/ -j12
cp /home/florian/Builds/outWatch/arch/arm/boot/zImage-dtb /home/florian/android-unpackbootimg/boot.img-zImage
cd /home/florian/android-unpackbootimg/
./mkbootimg --kernel boot.img-zImage  \
           --ramdisk boot.img-ramdisk.gz  \
           --cmdline "androidboot.hardware=catfish msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78af000 firmware_class.path=/vendor/firmware_mnt/image console=null androidboot.console=null buildvariant=user" \
           --base 80000000 \
           --pagesize 2048 \
           --ramdisk_offset 01000000 \
           --kernel_offset 00008000 \
           --second_offset 00f00000 \
           --tags_offset 00000100 \
           --os_version 9.0.0 \
           --os_patch_level 2019-06 \
           --hash sha1 \
           -o $FILE.img
cd /home/florian/msm/
