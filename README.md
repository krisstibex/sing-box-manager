# sing-box-manager

**[For English Users](https://github.com/krisstibex/sing-box-manager/blob/main/README-EN.md)**

## 使用方法
* 使用win+r输入"powershell"以打开powershell
* 运行下面的一键脚本 脚本会在桌面生成一个名为sing-box的文件夹 打开
* 如果配置为本地配置 则重命名为"config.json" 再运行sing-box-manager.bat
* 如果配置为订阅格式 则修改脚本里的 "Your Subscribe URL" 为你的订阅链接 (注意:不要删除双引号) 再通过sing-box-manager.bat下载配置

### 一键脚本
```
irm https://s.mikutabs.eu.org/XQsX | iex
```
- 或者(使用ghproxy加速下载)
```
irm https://s.mikutabs.eu.org/pIgw | iex
```

## 其他
- 您可以使用[sing-box配置生成器](https://github.com/Toperlock/sing-box-subscribe)用来转换您的订阅并生成配置
