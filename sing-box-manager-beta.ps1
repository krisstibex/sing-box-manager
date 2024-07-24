# 设置窗口标题
$Host.UI.RawUI.WindowTitle = "Sing-Box Manager"

# 检查是否以管理员权限运行
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # 重新启动脚本并要求以管理员身份运行
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# 注册表路径
$REG_PATH = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
$EXE_FILE = Join-Path $PSScriptRoot "sing-box.exe"

# 将EXE_FILE添加到注册表以管理员身份运行
Set-ItemProperty -Path $REG_PATH -Name $EXE_FILE -Value "RUNASADMIN" -Force

# 定义CSV文件路径
$csvPath = Join-Path $PSScriptRoot "subscribe.csv"

# 检查是否存在CSV文件，如果不存在则创建一个
if (-Not (Test-Path -Path $csvPath)) {
    # 创建一个带有表头的CSV文件
    $header = "NodeID,SubName,SubURL"
    Out-File -FilePath $csvPath -InputObject $header -Encoding UTF8
}

function Show-Menu {
    Clear-Host
    Write-Host ""
    Write-Host "=============================================="
    Write-Host ""
    Write-Host "        Sing-Box Manager by Miku404"
    Write-Host ""
    Write-Host "=============================================="
    Write-Host ""
    Write-Host "1. Start Sing-Box Service"
    Write-Host "2. Stop Sing-Box Service"
    Write-Host "3. Open MetaCubeXD Dashboard"
    Write-Host "4. Config Manager"
    Write-Host "5. Exit"
    Write-Host ""
}

function Start-Service {
    & .\sing-box-service.exe install
    & .\sing-box-service.exe start
    Write-Host "Service Started"
    Start-Sleep -Seconds 3
}

function Stop-Service {
    & .\sing-box-service.exe stop
    & .\sing-box-service.exe uninstall
    Write-Host "Service Stopped"
    Start-Sleep -Seconds 3
}

function Open-Dashboard {
    Start-Process "http://127.0.0.1:9090/ui"
    Write-Host "Dashboard Opened"
    Start-Sleep -Seconds 3
}

function Show-Config-Menu {
    Clear-Host
    Write-Host ""
    Write-Host "=============================================="
    Write-Host ""
    Write-Host "        Config Manager"
    Write-Host ""
    Write-Host "=============================================="
    Write-Host ""
    Write-Host "1. Add Subscription"
    Write-Host "2. Download Subscription"
    Write-Host "3. Back to Main Menu"
    Write-Host ""
}

function Add-Subscription {
    # 读取现有数据
    $data = Import-Csv -Path $csvPath

    # 获取新的ID
    $newId = if ($data) { ($data | Measure-Object).Count + 1 } else { 1 }

    # 获取订阅名称和URL
    $subName = Read-Host "Enter subscription name"
    $subURL = Read-Host "Enter subscription URL"

    # 创建新的订阅对象
    $newSubscription = [PSCustomObject]@{
        NodeID = $newId
        SubName = $subName
        SubURL = $subURL
    }

    # 将新订阅添加到数据并导出到CSV
    $data += $newSubscription
    $data | Export-Csv -Path $csvPath -NoTypeInformation
    Write-Host "Subscription added successfully."
    Start-Sleep -Seconds 3
}

function Download-Subscription {
    # 读取现有数据
    $data = Import-Csv -Path $csvPath

    # 显示订阅名称和ID
    $data | ForEach-Object { Write-Host ("{0}:{1}" -f $_.NodeID, $_.SubName) }

    # 获取要下载的订阅ID
    $subId = Read-Host "Enter the subscription ID to download"

    # 查找匹配的订阅
    $subscription = $data | Where-Object { $_.NodeID -eq $subId }

    if ($subscription) {
        # 下载订阅
        $outputFile = Join-Path $PSScriptRoot "config.json"
        Invoke-WebRequest -Uri $subscription.SubURL -OutFile $outputFile
        Write-Host "Subscription downloaded successfully to $outputFile."
    } else {
        Write-Host "Subscription ID not found."
    }
    Start-Sleep -Seconds 2
}

function Config-Manager {
    do {
        Show-Config-Menu
        $configChoice = Read-Host "Please make a choice"

        switch ($configChoice) {
            1 { Add-Subscription }
            2 { Download-Subscription }
            3 { break }
            deafult { Write-Host "Invalid choice, please try again." }
        }
    } while ($configChoice -ne 3)
}

do {
    Show-Menu
    $choice = Read-Host "Please make a choice"

    switch ($choice) {
        1 { Start-Service }
        2 { Stop-Service }
        3 { Open-Dashboard }
        4 { Config-Manager }
        5 { break }
        deafult { Write-Host "Invalid choice, please try again." }
    }
} while ($choice -ne 5)

exit
