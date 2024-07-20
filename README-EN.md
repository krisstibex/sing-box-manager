# sing-box-manager

## Usage
* Press `win+r`, type "powershell" to open PowerShell.
* Run the one-click script below. The script will create a folder named `sing-box` on the desktop. Open it.
* If the configuration is local, rename it to "config.json" and then run `sing-box-manager.bat`.
* If the configuration is in subscription format, modify the "Your Subscribe URL" in the script to your subscription link (note: do not remove the double quotes), then use `sing-box-manager.bat` to download the configuration.

### One-Click Script
```
irm https://s.mikutabs.eu.org/XQsX | iex
```
- Or (using ghproxy to speed up downloads)(Only applicable to users in China)
```
irm https://s.mikutabs.eu.org/pIgw | iex
```

## Additional
- You can use the [sing-box configuration generator](https://github.com/Toperlock/sing-box-subscribe) to convert your subscription and generate configurations.
