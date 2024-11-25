@echo off
:: Définir le chemin du dépôt local
set localRepoPath=C:\chemin\vers\votre\dépôt

:: Fonction pour exécuter une commande Git
:RunGitCommand
set command=%1
echo Exécution de la commande : %command%
cd /d %localRepoPath%
git %command%
if errorlevel 1 (
    echo Erreur lors de l'exécution de la commande git.
    exit /b 1
) else (
    echo Commande exécutée avec succès : %command%
)
exit /b 0

:: Fonction pour ajouter, committer et pousser les changements
:PushChanges
echo Vérification des modifications locales...
:: Vérifier s'il y a des modifications non suivies
for /f %%i in ('git status --porcelain') do set status=true
if defined status (
    echo Modifications détectées, préparation du commit...
    :: Ajouter toutes les modifications
    call :RunGitCommand "add ."

    :: Faire un commit
    call :RunGitCommand "commit -m \"Automated commit\""

    :: Pousser les changements vers le dépôt distant
    call :RunGitCommand "push"
) else (
    echo Aucune modification détectée. Aucune action nécessaire.
)

:: Exécution de la fonction de push
call :PushChanges
pause
