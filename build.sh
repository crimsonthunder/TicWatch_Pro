export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=/home/florian/Builds/kernel/toolchains/ARM32/gcc-arm-8.3-2019.03-x86_64-arm-eabi/bin/arm-eabi-
FILE="crimsonthunder_$(date +%Y%m%d_%H%M%S)"
rm -R /home/florian/Builds/outWatch
mkdir -p /home/florian/Builds/outWatch
make clean
make -C $(pwd)  O=/home/florian/Builds/outWatch catshark_defconfig
make -C $(pwd)  O=/home/florian/Builds/outWatch -j12
cd /home/florian/msm/
