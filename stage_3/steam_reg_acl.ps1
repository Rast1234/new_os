# remove permissions to prevent steam from overwriting startup parameters

$key = [Microsoft.Win32.Registry]::ClassesRoot.OpenSubKey("steam\Shell\Open\Command",[Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,[System.Security.AccessControl.RegistryRights]::ChangePermissions)
$acl = $key.GetAccessControl()
# disable inheritance, copy inherited to explicit permissions
$acl.SetAccessRuleProtection($True, $True)
$key.SetAccessControl($acl)

# set explicit permissions
$acl = $key.GetAccessControl()
$permissions = "CreateSubKey, CreateLink, Delete, ReadKey, ChangePermissions, TakeOwnership"
$user = [System.Security.Principal.WindowsIdentity]::GetCurrent().User
$rule = New-Object System.Security.AccessControl.RegistryAccessRule ($user, $permissions,"Allow")
$acl.SetAccessRule($rule)
$key.SetAccessControl($acl)

#echo "==== read result ==="
#$acl = $key.GetAccessControl()
#$acl.Access | format-list
