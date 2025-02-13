#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
sed -i 's/192.168.110.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i "s/ip6assign='60'/ip6assign='64'/g" package/base-files/files/bin/config_generate
sed -i "s/globals.ula_prefix='auto'/globals.packet_steering='1'/g" package/base-files/files/bin/config_generate
sed -i "s|DISTRIB_REVISION='%R'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='laoliuwrt'" >>package/base-files/files/etc/openwrt_release
sed -i 's/ImmortalWrt/Redmi_AX6000/g' package/base-files/files/bin/config_generate
sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd

echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

sed -i '/interface}/d' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config
sed -i 's/"终端"/"TTYD 终端"/g' feeds/luci/applications/luci-app-ttyd/po/zh_Hans/ttyd.po
sed -i '4 i\\t\t"order": 89,' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json

sed -i 's/\[ \-f \/etc\/banner \] \&\& cat \/etc\/banner/\[ \-f \/etc\/banner \] \&\& cat \/etc\/banner \| lolcat \-h 0.30 \-r \-b/g' package/base-files/files/etc/profile
rm -rf package/base-files/files/etc/banner
wget --no-check-certificate -O package/base-files/files/etc/banner "https://raw.githubusercontent.com/0xACE8/laoliuonly/main/redmi_ax6000/banner"

wget --no-check-certificate -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh "https://raw.githubusercontent.com/0xACE8/0p3nwrt-general/refs/heads/main/30-sysinfo.sh"
wget --no-check-certificate -O package/base-files/files/etc/uci-defaults/zzz-updata-settings "https://raw.githubusercontent.com/0xACE8/laoliuonly/main/redmi_ax6000/zzz-updata-settings"
