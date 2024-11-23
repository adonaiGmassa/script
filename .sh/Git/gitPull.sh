# Définir le chemin du dépôt local
localRepoPath="/chemin/vers/votre/depot"  # Remplacez par le chemin de votre dépôt local

# Fonction pour exécuter une commande Git
run_git_command() {
    local command="$1"
    echo "Exécution de la commande : $command"
    
    # Exécuter la commande git
    git -C "$localRepoPath" $command
    
    # Vérifier si la commande a réussi
    if [ $? -ne 0 ]; then
        echo "Erreur lors de l'exécution de la commande git."
    else
        echo "Commande exécutée avec succès : $command"
    fi
}

# Fonction pour effectuer un git pull
git_pull() {
    echo "Récupération des dernières modifications depuis le dépôt distant..."
    
    # Exécuter git pull
    run_git_command "pull"
}

# Exécution de la fonction
git_pull

#Commande pour rendre le script exécutable : chmod +x gitPull.sh

#Commande pour pour exécuter le script :./git_pull.sh