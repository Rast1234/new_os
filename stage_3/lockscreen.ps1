# set lockscreen background
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V "LockScreenImage" /T REG_SZ /D "c:\bin\pictures\lockscreen.png" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" /V "LockScreenImageStatus" /T REG_DWORD /D "00000001" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" /V "LockScreenImagePath" /T REG_SZ /D "c:\bin\pictures\lockscreen.png" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" /V "LockScreenImageUrl" /T REG_SZ /D "c:\bin\pictures\lockscreen.png" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V "NoChangingLockScreen" /T REG_DWORD /D "00000001" /F

# disable blur
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /V "DisableAcrylicBackgroundOnLogon" /T REG_DWORD /D "00000001" /F
