# Définir les répertoires source et de destination
$sourceDirectory = "C:\Chemin\Vers\Dossier\Source"  # Remplacez par le chemin de votre répertoire source
$destinationDirectory = "C:\Chemin\Vers\Dossier\Destination"  # Remplacez par le chemin de votre répertoire de destination

# Vérifier si le répertoire de destination existe, sinon le créer
if (-not (Test-Path -Path $destinationDirectory)) {
    New-Item -Path $destinationDirectory -ItemType Directory
}

# Fonction de sauvegarde des fichiers Word et PDF
function Backup-Files {
    # Trouver tous les fichiers Word (.docx, .doc) et PDF (.pdf) dans le répertoire source
    $files = Get-ChildItem -Path $sourceDirectory -Recurse -Include *.docx, *.doc, *.pdf

    foreach ($file in $files) {
        # Définir le chemin de destination pour chaque fichier
        $destinationFile = Join-Path -Path $destinationDirectory -ChildPath $file.Name

        # Si le fichier n'existe pas déjà dans la destination, le copier
        if (-not (Test-Path -Path $destinationFile)) {
            Write-Host "Sauvegarde du fichier : $($file.FullName)"
            Copy-Item -Path $file.FullName -Destination $destinationFile
        } else {
            Write-Host "Le fichier existe déjà dans la destination : $destinationFile"
        }
    }
}

# Boucle infinie pour effectuer la sauvegarde toutes les 30 minutes
while ($true) {
    # Exécuter la fonction de sauvegarde
    Backup-Files
    
    # Attendre 30 minutes (1800 secondes)
    Write-Host "Attente de 30 minutes avant la prochaine sauvegarde..."
    Start-Sleep -Seconds 1800
}
