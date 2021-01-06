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

		#采用lisaac的luci-app-dockerman
		if [[ -e package/lean/luci-app-dockerman ]]; then
			rm -rf package/lean/luci-app-dockerman
		fi

		if [[ -e package/other-plugins/luci-app-dockerman ]]; then
			cd  package/other-plugins/luci-app-dockerman
			source_update_No_git_pull
			cd $HOME/$OW/$file/lede/
		else
			git clone https://github.com/lisaac/luci-app-dockerman.git package/other-plugins/luci-app-dockerman
		fi

		#下载lienol的fileassistant
		if [[ -e package/other-plugins/luci-app-fileassistant ]]; then
			rm -rf   package/other-plugins/luci-app-fileassistant
			svn checkout https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-fileassistant package/other-plugins/luci-app-fileassistant
		else
			svn checkout https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-fileassistant package/other-plugins/luci-app-fileassistant
		fi

		#将diskman选项启用
		sed -i "s/default n/default y/g" package/lean/luci-app-diskman/Makefile

		if [[ -e package/other-plugins/copy-pan ]]; then
			sed -i "s/lm-sensors autocore #tr_ok/lm-sensors autocore copy-pan #tr_ok/g" include/target.mk
		else
			echo ""
		fi

		#下载jd插件
		if [[ -e package/other-plugins/luci-app-jd-dailybonus ]]; then
			cd  package/other-plugins/node-request && source_update_No_git_pull
			cd $HOME/$OW/$file/lede/
			cd  package/other-plugins/luci-app-jd-dailybonus && source_update_No_git_pull
			cd $HOME/$OW/$file/lede/
		else
			git clone https://github.com/jerrykuku/node-request.git package/other-plugins/node-request
			git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/other-plugins/luci-app-jd-dailybonus
		fi

		#adguardhome插件
		if [[ -e package/other-plugins/luci-app-adguardhome ]]; then
			cd  package/other-plugins/luci-app-adguardhome && source_update_No_git_pull
			cd $HOME/$OW/$file/lede/
		else
			git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/other-plugins/luci-app-adguardhome
		fi
    
