# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Terraform
choco install terraform -y

# Install Azure CLI
choco install azure-cli -y

# Install SQL*Plus
$oracleClientUrl = "https://download.oracle.com/otn_software/nt/instantclient/instantclient-basiclite-windows.x64-19.8.0.0.0dbru.zip"
Invoke-WebRequest -Uri $oracleClientUrl -OutFile "C:\instantclient-basiclite-windows.x64.zip"
Expand-Archive -Path "C:\instantclient-basiclite-windows.x64.zip" -DestinationPath "C:\Oracle"
$env:Path += ";C:\Oracle\instantclient_19_8"
[Environment]::SetEnvironmentVariable("Path", $env:Path, [EnvironmentVariableTarget]::Machine)
