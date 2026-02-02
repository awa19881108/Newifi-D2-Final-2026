#!/bin/bash
# 使用 GitHub 鏡像來源，避免 git.openwrt.org 503

# 官方 feed 用 GitHub 鏡像
echo "src-git packages https://github.com/openwrt/packages.git;openwrt-24.10" > feeds.conf.default
echo "src-git luci https://github.com/openwrt/luci.git;openwrt-24.10" >> feeds.conf.default
echo "src-git routing https://github.com/openwrt-routing/packages.git;openwrt-24.10" >> feeds.conf.default
echo "src-git telephony https://github.com/openwrt/telephony.git;openwrt-24.10" >> feeds.conf.default

# 自訂 feed 保持原樣（GitHub 來源）
echo "src-git helloworld https://github.com/sbwml/openwrt_helloworld.git^v5" >> feeds.conf.default
echo "src-git mosdns https://github.com/sbwml/luci-app-mosdns.git^v5" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default

# golang 升級到 24.x（修 geoview / xray 版本）
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

cat feeds.conf.default
