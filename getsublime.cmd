@echo off
set vendor_path=%~dp0cmder_mini\vendor
pushd %vendor_path%
wget https://download.sublimetext.com/latest/stable/windows/x64/zip --no-check-certificate -O sublimezip.zip
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('sublimezip.zip', 'Sublime Text 3'); }"
del sublimezip.zip
set pkg_path="%vendor_path%\Sublime Text 3\Packages"
cd %pkg_path%
rmdir /s /q Packages > NUL 2>&1
rmdir /s /q "Installed Packages" > NUL 2>&1
mklink /d Packages "%APPDATA%\Sublime Text 3\Packages"
mklink /d "Installed Packages" "%APPDATA%\Sublime Text 3\Installed Packages"



popd