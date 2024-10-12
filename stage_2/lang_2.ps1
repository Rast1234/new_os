echo "Languages: state with custom layout installed"
Get-WinUserLanguageList

$langs=Get-WinUserLanguageList
$langs[0].InputMethodTips.Clear()
$langs[0].InputMethodTips.Add("0409:A0000409")
$langs[1].InputMethodTips.Clear()
$langs[1].InputMethodTips.Add("0419:A0000419")
Set-WinUserLanguageList $langs -force
echo "Languages: final lang list, should have custom layouts only"
Get-WinUserLanguageList

$final=Get-WinUserLanguageList
if($final[0].InputMethodTips.Count -eq 0 -or $final[1].InputMethodTips.Count -eq 0){
    throw "Failed to set up keyboard input methods: one of languages has empty input method list"
}