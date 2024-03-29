@echo off
REM Consolidator:https://github.com/tintoser

REM # for enabling Remote Desktop
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0x00000000 /f

REM # for enabling Network Level Authentication, you can set last bit to 0 to disable it
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-TCP" /v UserAuthentication /t REG_DWORD /d 0x00000001 /f

REM # for opening firewall port for RDP
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

REM # for allowing blank password, this is beneficial when no password is there for user account
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0x00000000 /f
