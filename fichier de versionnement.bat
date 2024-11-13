# Script PowerShell pour créer un fichier version.txt avec les informations du dernier commit Git
cd "C:\Chemin\Vers\Le\Dépôt"

# Obtenir les informations du dernier commit
$commitHash = git log -n 1 --pretty=format:"%h"
$commitDate = git log -n 1 --pretty=format:"%ad" --date=short
$commitMessage = git log -n 1 --pretty=format:"%s"

# Créer le fichier version.txt
$versionFilePath = "C:\Chemin\Vers\Le\Dépôt\version.txt"
$versionContent = "Commit Hash: $commitHash`nDate: $commitDate`nMessage: $commitMessage"

Set-Content -Path $versionFilePath -Value $versionContent

Write-Host "Version générée dans $versionFilePath"
