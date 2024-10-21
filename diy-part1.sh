#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# 定义变量
telephony_line='src-git telephony https://github.com/openwrt/telephony.git;openwrt-23.05'
luci_line='src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05'

# 检查并处理 telephony 行
if grep -q '^#\?'"$telephony_line"' feeds.conf.default; then
    sed -i 's/^#\?'"$telephony_line"'/'"$telephony_line"'/g' feeds.conf.default
else
    echo "$telephony_line" >> feeds.conf.default
fi

# 检查并处理 luci 行
if grep -q '^#\?'"$luci_line"' feeds.conf.default; then
    sed -i 's/^#\?'"$luci_line"'/'"$luci_line"'/g' feeds.conf.default
else
    echo "$luci_line" >> feeds.conf.default
fi

# Add a feed source
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
echo 'src-git smpackage https://github.com/kenzok8/small-package' >>feeds.conf.default
