# Définir le chemin du dépôt local
localRepoPath="/chemin/vers/votre/depot"  # Remplacez par le chemin de votre dépôt local

# Se déplacer dans le répertoire du dépôt
cd "$localRepoPath" || { echo "Échec de l'accès au dépôt Git."; exit 1; }

# Obtenir les informations du dernier commit
commitHash=$(git log -n 1 --pretty=format:"%h")
commitDate=$(git log -n 1 --pretty=format:"%ad" --date=short)
commitMessage=$(git log -n 1 --pretty=format:"%s")

# Créer le fichier version.txt
versionFilePath="$localRepoPath/version.txt"
versionContent="Commit Hash: $commitHash\nDate: $commitDate\nMessage: $commitMessage"

echo -e "$versionContent" > "$versionFilePath"

echo "Version générée dans $versionFilePath"

#Commande pour rendre le script exécutable : chmod +x verionningGit.sh

#Commande pour pour exécuter le script :./verionningGit.sh