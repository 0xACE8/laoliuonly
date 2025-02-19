#---------Ace Sourse-----
sed -i '1 i\src-git ace8 https://github.com/0xACE8/l40l1u-p4ck463' feeds.conf.default
sed -i '2 i\src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' feeds.conf.default
sed -i '$a src-git hello https://github.com/fw876/helloworld' feeds.conf.default


