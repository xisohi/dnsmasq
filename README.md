【padavan固件】全自动脚本
![img](https://raw.githubusercontent.com/xisohi/dnsmasq/master/img/318752-14013109302178.jpg)

|    [Telegram群][telegram-group-link]     | [Telegram通知频道][telegram-channel-link]  |  [微信公众号][wx-link]  |    [QQ群][qq-link]    |
|                  :---:                   |                   :---:                    |             :---:              |             :---:              |
| [![telegram-badge]][telegram-group-link] | [![telegram-badge]][telegram-channel-link] | [![wx-badge]][wx-link] | [![qq-badge]][qq-link] |

[telegram-badge]: https://raw.githubusercontent.com/xisohi/dnsmasq/master/img/tg.png
[telegram-group-link]: https://t.me/googlehosts
[telegram-channel-link]: https://t.me/googlehostsnews
[wx-badge]: https://raw.githubusercontent.com/xisohi/dnsmasq/master/img/lf.png
[wx-link]: https://mp.weixin.qq.com/ 
[qq-badge]: https://raw.githubusercontent.com/xisohi/dnsmasq/master/img/qq.png
[qq-link]: http://www.qq.com/
setting.sh：初次运行的脚本，自动修改配置与启用dnsmasq，只需要运行一次。 start.sh：立刻下载规则的脚本 del.sh：删除所有更改，出问题了只需要运行一下即可还原 此脚本只适用于老毛子华硕固件，其他固件请勿直接使用 hiboy大的老毛子华硕固件：http://www.right.com.cn/forum/thread-161324-1-1.html 脚本参考自恩山论坛原帖：http://www.right.com.cn/forum/thread-184121-1-1.html 使用脚本

请先找个可以运行命令的终端控制区。如老毛子固件打开【网页终端】（Shellinabox）功能来运行命令或脚本。在【配置扩展环境】→启用【网页终端】→【打开网页终端】，进入终端界面后输入路由账号、密码即可开始。直接复制以下的一键命令执行即可。

一键运行命令：mkdir -p /etc/storage/dnsmasq/dns;wget --no-check-certificate https://raw.githubusercontent.com/xisohi/dnsmasq/master/setting.sh -O /etc/storage/dnsmasq/dns/setting.sh;sh /etc/storage/dnsmasq/dns/setting.sh 一键还原命令：sh /etc/storage/dnsmasq/dns/del.sh 其他命令

查看规则文件dnsfq是否下载成功，命令cat /etc/storage/dnsmasq/dns/dnsmasq.conf，即可看到第一行的update日期时间。 立即更新命令：sh /etc/storage/dnsmasq/dns/start.sh
