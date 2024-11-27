# CreateDotNetConsole.ps1

param(
    [string]$projectName
)

# Vérifie si le nom du projet est fourni
if (-not $projectName) {
    Write-Host "Vous devez spécifier un nom de projet."
    exit
}

# Exécute la commande pour créer un projet console avec --use-program-main
dotnet new console --use-program-main -n $projectName

Write-Host "Le projet '$projectName' a été créé avec une méthode Main explicite."
