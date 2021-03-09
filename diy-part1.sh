			sed -i '$a \       ' feeds/luci/modules/luci-base/po/zh-cn/base.po
			sed -i '$a #首页显示编译时间' feeds/luci/modules/luci-base/po/zh-cn/base.po
			sed -i '$a msgid "Compile_time"' feeds/luci/modules/luci-base/po/zh-cn/base.po
			sed -i '$a msgstr "固件编译时间"' feeds/luci/modules/luci-base/po/zh-cn/base.po
			sed -i '$d' package/lean/default-settings/files/zzz-default-settings
			sed -i '$d' package/lean/default-settings/files/zzz-default-settings
			echo "echo \"`date "+%Y-%m-%d %H:%M"` (commit:`git log -1 --format=format:'%C(bold white)%h%C(reset)'`)\" >> /etc/Compile_time" >> package/lean/default-settings/files/zzz-default-settings
			echo "exit 0" >> package/lean/default-settings/files/zzz-default-settings
                #other-plugins
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
