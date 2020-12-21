## 1. uboot设置ip
setenv serverip 192.168.88.153  
setenv ipaddr 192.168.88.55

## 2. 板子设置ip  
ifconfig eth0 192.168.88.55 netmask 255.255.255.0  
route add default gw 192.168.88.1

## 3. 挂在虚拟机Ubuntu 桥接方式  
mount -t nfs -o nolock -o tcp 192.168.88.153:/home/john/nfs /mnt

## 4. 富瀚交叉工具前缀
V1.1  
arm-fullhan-linux-uclibcgnueabi-  
V1.2  
arm-fullhanv2-linux-uclibcgnueabi-

## 5. 查看编译器环境
echo 'main(){}'| arm-fullhan-linux-uclibcgnueabi-gcc -E -v -


## 6. 源码安装库
mkdir tmp  
./configure --host=arm-fullhan-linux-uclibcgnueabi --prefix=$PWD/tmp  
make  
make install  
cd tmp/  
sudo cp -rf include/* /opt/fullhan/toolchain/arm-fullhan-linux-uclibcgnueabi-b2/arm-fullhan-linux-uclibcgnueabi/sysroot/usr/include  
sudo cp -rfd lib/* /opt/fullhan/toolchain/arm-fullhan-linux-uclibcgnueabi-b2/arm-fullhan-linux-uclibcgnueabi/sysroot/usr/lib  
环境路径  
/opt/fullhan/toolchain/arm-fullhan-linux-uclibcgnueabi/arm-fullhan-linux-uclibcgnueabi/sysroot/usr

## 7. 制作 JFFS2 镜像 (11M fs)
mkfs.jffs2 --pad=0xB00000 -d ../rootfs_pub/ -e 0x10000 -l -o serial.jffs2

## 8. minicom用法
sudo minicom -D /dev/ttyUSB0 -b 115200  
Ctrl—A s 选择y modem 选择文件 传输

## 9. uboot使用loady
### 烧内核
sf probe 0  
sf erase 90000 400000  
loady a1000000 115200  
sf write a1000000 90000 400000  
### 烧fs (11M fs)
sf probe 0  
sf erase 490000 B00000  
loady a1000000 115200  
sf write a1000000 490000 B00000

kernel V1.1  
/home/john/fullhan/FH8856_IPC_V1.1.0_20190125/board_support/kernel/linux-3.0.8/arch/arm/boot/uImage  
fs V1.1  
/home/john/fullhan/FH8856_IPC_V1.1.0_20190125/board_support/rootfs/serial/serial.jffs2

## 10. 设置uboot启动参数(8852 需设置系统mem=29M (11M fs))
setenv bootargs 'console=ttyS0,115200 mem=29M ip=192.168.1.3 root=/dev/mtdblock4 rootfstype=jffs2 mtdparts=spi_flash:256k(bootstrap),64k(uboot-env),256k(uboot),4M(kernel),11M(rootfs)'  
setenv bootcmd 'sf probe 0;sf read a1000000 90000 400000;bootm a1000000'  
sa  

## 11. lrzsz交叉编译
mkdir tmp  
./configure --prefix=$PWD/tmp  
vim  config.cache  (gcc -> arm-fullhan-linux-uclibcgnueabi-gcc  & Line85 yes->no 关nsl)  
./configure --prefix=$PWD/tmp  
config.h 注释掉 L88 和 L254  
make && make install  

## 搜索文件内容
find . -name "*.h" | xargs grep "xxx"  

## 运行demo程序 将hex文件放置sample程序于同一路径下