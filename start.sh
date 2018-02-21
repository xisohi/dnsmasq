#!/bin/sh

#创建文件夹
mkdir -p /etc/storage/dnsmasq/dns/conf

#下载dnsmasq规则
cd /etc/storage/dnsmasq/dns/conf
wget --no-check-certificate https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/dnsmasq.conf -O dnsmasq.conf;sed -i "1 i\## Downloaded：$(date "+%Y-%m-%d %H:%M:%S")" dnsmasq.conf
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/ip.conf -O ip.conf;sed -i "1 i\## Downloaded：$(date "+%Y-%m-%d %H:%M:%S")" ip.conf
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/union.conf -O union.conf;sed -i "1 i\## Downloaded：$(date "+%Y-%m-%d %H:%M:%S")" union.conf
wget --no-check-certificate https://raw.githubusercontent.com/xuhui0607/dnsmasq/master/dnslb -O /etc/storage/dnsmasq/dns/dnslb;sed -i "1 i\## Downloaded：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/dns/dnslb

##下载hosts规则
cd /etc/storage/dnsmasq/dns
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O hosts

echo "…………精简AD hosts……………‥"
echo "批量删除AD hosts内不必要的域名，可大量减少hosts行数与不想要的域名。包含dnsmasq规则union.conf域名、自定义白名单white.txt（关键词，一行一条）。"
echo "* 自定义编辑白名单white.txt：/etc/storage/dnsmasq/dns/white.txt"
touch white.txt
echo "—— 提取待精简域名列表domain"
cat /etc/storage/dnsmasq/dns/conf/union.conf | sed '/#\|^ *\$/d' | awk -F/ '{print \$2}' | sed  's#^\.##g' > domain;cat white.txt >> domain
echo "—— 开始精简AD hosts……"
for abc in \$(cat domain)
do
sed -i "/^## \|^#.*201\|^#url/!{/\$abc/d}" hosts
done
wait
sed -i "1 i\## Download：\$(date "+%Y-%m-%d %H:%M:%S")" hosts


#重启dnsmasq
restart_dhcpd

