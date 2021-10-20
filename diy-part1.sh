git clone https://github.com/tty228/luci-app-serverchan.git package/other-plugins/luci-app-serverchan
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/other-plugins/luci-app-adguardhome
git clone https://github.com/pexcn/openwrt-chinadns-ng.git package/other-plugins/chinadns-ng
git clone https://github.com/izilzty/luci-app-chinadns-ng.git package/other-plugins/luci-app-chinadns-ng
echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
wget https://raw.githubusercontent.com/mylucien/Actions-Lean-OpenWrt/main/luci-app-bridge.tar.gz
tar -zxvf luci-app-bridge.tar.gz -C ./feeds/luci/applications
pushd ./package/feeds/luci
ln -s ../../../feeds/luci/applications/luci-app-bridge luci-app-bridge
popd
