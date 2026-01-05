# set lockscreen background. file should be relocated to somewhere persistent first!
cp lockscreen.png c:\vault
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V "LockScreenImage" /T REG_SZ /D "c:\vault\lockscreen.png" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" /V "LockScreenImageStatus" /T REG_DWORD /D "00000001" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" /V "LockScreenImagePath" /T REG_SZ /D "c:\vault\lockscreen.png" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP" /V "LockScreenImageUrl" /T REG_SZ /D "c:\vault\lockscreen.png" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V "NoChangingLockScreen" /T REG_DWORD /D "00000001" /F
