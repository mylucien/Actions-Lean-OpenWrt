/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#加入helloworld
echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
#other-plugins
		if [[ -e package/other-plugins ]]; then
			echo ""
		else
			mkdir package/other-plugins
		fi

		
		#下载一下微信推送插件
		if [[ -e package/other-plugins/luci-app-serverchan ]]; then
			cd  package/other-plugins/luci-app-serverchan
			source_update_No_git_pull
			cd $HOME/$OW/$file/lede/
		else
			git clone https://github.com/tty228/luci-app-serverchan.git package/other-plugins/luci-app-serverchan
		fi

		#下载lienol的fileassistant
		if [[ -e package/other-plugins/luci-app-fileassistant ]]; then
			rm -rf   package/other-plugins/luci-app-fileassistant
			svn checkout https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-fileassistant package/other-plugins/luci-app-fileassistant
		else
			svn checkout https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-fileassistant package/other-plugins/luci-app-fileassistant
		fi


		#adguardhome插件
		if [[ -e package/other-plugins/luci-app-adguardhome ]]; then
			cd  package/other-plugins/luci-app-adguardhome && source_update_No_git_pull
			cd $HOME/$OW/$file/lede/
		else
			git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/other-plugins/luci-app-adguardhome
		fi
    	#隐藏首页显示用户名(by:kokang)
	sed -i 's/name="luci_username" value="<%=duser%>"/name="luci_username"/g' feeds/luci/modules/luci-base/luasrc/view/sysauth.htm
		
	#移动光标至第一格(by:kokang)
	sed -i "s/'luci_password'/'luci_username'/g" feeds/luci/modules/luci-base/luasrc/view/sysauth.htm

	#修改固件生成名字,增加当天日期(by:左右）
	sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=[$(shell date +%Y%m%d)]-$(VERSION_DIST_SANITIZED)/g' include/image.mk

