# Définir le chemin du dépôt local
$localRepoPath = "C:\chemin\vers\votre\dépôt"  # Remplacez par le chemin de votre dépôt local

# Fonction pour exécuter une commande Git
function Run-GitCommand {
    param (
        [string]$command
    )
    Write-Host "Exécution de la commande : $command"
    $process = Start-Process git -ArgumentList $command -WorkingDirectory $localRepoPath -PassThru -Wait
    if ($process.ExitCode -ne 0) {
        Write-Host "Erreur lors de l'exécution de la commande git."
    } else {
        Write-Host "Commande exécutée avec succès : $command"
    }
}

# Fonction pour effectuer un git pull
function Git-Pull {
    Write-Host "Récupération des dernières modifications depuis le dépôt distant..."
    
    # Exécuter git pull pour récupérer les dernières modifications
    Run-GitCommand "pull"
}

# Exécution de la fonction
Git-Pull
