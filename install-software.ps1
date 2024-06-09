# Install Chocolatey
Write-Output "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Output "Chocolatey installation completed."

# Install Terraform
Write-Output "Installing Terraform..."
choco install terraform -y
Write-Output "Terraform installation completed."

# Install Azure CLI
Write-Output "Installing Azure CLI..."
choco install azure-cli -y
Write-Output "Azure CLI installation completed."

# Install SQL*Plus
Write-Output "Downloading Oracle Instant Client..."
$oracleClientUrl = "https://download.oracle.com/otn_software/nt/instantclient/instantclient-basiclite-windows.x64-19.8.0.0.0dbru.zip"
Invoke-WebRequest -Uri $oracleClientUrl -OutFile "C:\instantclient-basiclite-windows.x64.zip"
Write-Output "Oracle Instant Client downloaded successfully."

Write-Output "Expanding Oracle Instant Client archive..."
Expand-Archive -Path "C:\instantclient-basiclite-windows.x64.zip" -DestinationPath "C:\Oracle"
Write-Output "Oracle Instant Client archive expanded successfully."

Write-Output "Updating system PATH..."
$env:Path += ";C:\Oracle\instantclient_19_8"
[Environment]::SetEnvironmentVariable("Path", $env:Path, [EnvironmentVariableTarget]::Machine)
Write-Output "System PATH updated."
