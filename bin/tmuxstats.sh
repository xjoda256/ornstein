
CPU=$(sensors |grep Package |printf " $(cut -b '17,18')° ")
GPU=$(sensors |grep edge |printf "󰢮 $(cut -b '16,17')° ")
MEM=$(free -m |sed -n 2p |awk '{printf "%.1f", $7 / 1000}')

echo "${CPU}█ ${GPU}█  ${MEM}"
