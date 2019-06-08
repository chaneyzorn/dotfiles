#!/bin/sh

WD=$(pwd)

declare -A pkgs=(
    ["ss-quick"]="https://github.com/Campanula/ss-quick.git"
)

for pkg in ${!pkgs[@]}; do
    if [ ! -d "pkg/${pkg}" ]; then
        echo "拉取 ${pkg} ..."
        git clone ${pkgs[$pkg]} pkg/${pkg}
    else
        echo "检查更新 ${pkg} ..."
        git -C pkg/${pkg} pull
    fi
done

echo "创建目标链接..."
ln -rsf src/sync_src.py                 bin/sync-src
ln -rsf src/screenshot.sh               bin/screenshot
ln -rsf pkg/ss-quick/src/ss-quick.py    bin/ss-quick
echo "安装完成!"

