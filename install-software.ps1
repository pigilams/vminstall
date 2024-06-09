# Install Chocolatey
Write-Output "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Terraform
Write-Output "Installing Terraform..."
choco install terraform -y
Write-Output "Terraform installation completed."

# Install Azure CLI
Write-Output "Installing Azure CLI..."
choco install azure-cli -y
Write-Output "Azure CLI installation completed."

