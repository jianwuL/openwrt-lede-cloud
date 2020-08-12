#!/bin/bash
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#修改版本号
sed -i 's/OpenWrt/$(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
git clone https://github.com/bin20088/luci-theme-butongwifi.git package/openwrt-packages/luci-theme-butongwifi
git clone https://github.com/Repobor/luci-app-koolproxyR.git package/openwrt-packages/luci-app-koolproxyR
git clone https://github.com/fw876/helloworld.git package/openwrt-packages/helloworld
svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/openwrt-packages/luci-theme-infinityfreedom
#赋予koolddns权限
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns
./scripts/feeds update -a
./scripts/feeds install -a
