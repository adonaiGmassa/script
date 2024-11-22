#!/bin/bash

# Définir le chemin du dépôt local
localRepoPath="/chemin/vers/votre/depot"  # Remplacez par le chemin de votre dépôt local

# Fonction pour exécuter une commande Git
run_git_command() {
    local command="$1"
    echo "Exécution de la commande : $command"
    
    # Exécuter la commande git dans le répertoire du dépôt local
    git -C "$localRepoPath" $command
    
    # Vérifier si la commande a réussi
    if [ $? -ne 0 ]; then
        echo "Erreur lors de l'exécution de la commande git."
    else
        echo "Commande exécutée avec succès : $command"
    fi
}

# Fonction pour ajouter, committer et pousser les changements
push_changes() {
    echo "Vérification des modifications locales..."
    
    # Vérifier s'il y a des modifications non suivies
    status=$(git -C "$localRepoPath" status --porcelain)
    
    if [ -n "$status" ]; then
        echo "Modifications détectées, préparation du commit..."
        
        # Ajouter toutes les modifications
        run_git_command "add ."
        
        # Faire un commit
        run_git_command "commit -m 'Automated commit'"
        
        # Pousser les changements vers le dépôt distant
        run_git_command "push"
    else
        echo "Aucune modification détectée. Aucune action nécessaire."
    fi
}

# Exécution de la fonction de push
push_changes

#Commande pour rendre le script exécutable : chmod +x autoGitPush.sh

#Commande pour pour exécuter le script :./autoGitPush.sh