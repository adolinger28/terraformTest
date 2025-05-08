# main.tf

terraform {
  required_version = ">= 1.3.0"
}

# This resource uses a null provider and local-exec to run PowerShell
resource "null_resource" "rename_d_drive" {
  provisioner "local-exec" {
    command = "powershell.exe -Command \"Get-Volume -DriveLetter D | Set-Volume -NewFileSystemLabel 'DataVolume'\""
  }
}
