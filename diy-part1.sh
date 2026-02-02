#!/bin/bash
# 簡單版 diy-part1.sh，加 helloworld + mosdns + passwall2

sed -i '/helloworld/d' feeds.conf.default
sed -i '/mosdns/d' feeds.conf.default
sed -i '/passwall/d' feeds.conf.default

echo "src-git helloworld https://github.com/sbwml/openwrt_helloworld.git^v5" >> feeds.conf.default
echo "src-git mosdns https://github.com/sbwml/luci-app-mosdns.git^v5" >> feeds.conf.default
# echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default

# 升級 golang 到 24.x（修 geoview / xray 等 Go 包版本需求）
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

cat feeds.conf.default
