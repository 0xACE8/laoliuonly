#---------Ace Sourse-----
sed -i '1 i\src-git ace8 https://github.com/0xACE8/4c38-p4ck463;laoliu' feeds.conf.default
sed -i '2 i\src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' feeds.conf.default
sed -i '$a src-git hello https://github.com/fw876/helloworld' feeds.conf.default


## 修改DTS的ubi为490MB的0x1ea00000
sed -i 's/reg = <0x600000 0x6e00000>/reg = <0x600000 0x1ea00000>/' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-xiaomi-redmi-router-ax6000.dts
## 修改DTS的spi_nand的spi-max-frequency为52MHz，52000000
#sed -i 's/spi-max-frequency = <20000000>/spi-max-frequency = <52000000>/' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-xiaomi-redmi-router-ax6000-uboot.dts
