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

# Fonction pour ajouter, committer et pousser les changements
function Push-Changes {
    Write-Host "Vérification des modifications locales..."
    
    # Vérifier s'il y a des modifications non suivies
    $status = git -C $localRepoPath status --porcelain
    if ($status) {
        Write-Host "Modifications détectées, préparation du commit..."

        # Ajouter toutes les modifications
        Run-GitCommand "add ."

        # Faire un commit
        Run-GitCommand 'commit -m "Automated commit"'

        # Pousser les changements vers le dépôt distant
        Run-GitCommand "push"
    } else {
        Write-Host "Aucune modification détectée. Aucune action nécessaire."
    }
}

# Exécution de la fonction de push
Push-Changes
