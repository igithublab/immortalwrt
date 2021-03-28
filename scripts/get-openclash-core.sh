ARCH=amd64
if [ ! -z $1 ]
then
  ARCH=$1
fi
# Add openclash

mkdir -p /workdir/openwrt/files/etc/openclash/core
cd /workdir/openwrt/files/etc/openclash/core

clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')

wget $clash_main_url && tar zxvf clash-linux-*.gz && rm -f clash-linux-*.gz
wget -qO- $clash_tun_url  | gunzip -c > clash_tun
wget -qO- $clash_game_url | tar xOvz > clash_game

chmod +x clash*
