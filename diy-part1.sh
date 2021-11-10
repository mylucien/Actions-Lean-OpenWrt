#!/bin/bash
#=============================================================
# https://github.com/Lancenas/Actions-Lean-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================
# fw876/helloworld
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >> feeds.conf.default

# other-plugins
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/other-plugins/luci-app-adguardhome
git clone https://github.com/pexcn/openwrt-chinadns-ng.git package/other-plugins/chinadns-ng
git clone https://github.com/izilzty/luci-app-chinadns-ng.git package/other-plugins/luci-app-chinadns-ng
git clone https://github.com/riverscn/openwrt-iptvhelper.git package/other-plugins/openwrt-iptvhelper
svn https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-supervisord package/other-plugins/luci-app-supervisord
svn https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-nginx-manager package/other-plugins/luci-app-nginx-manager
