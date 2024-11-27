@echo off
REM Définir le chemin du dépôt local
set localRepoPath=C:\chemin\vers\votre\dépôt  REM Remplacez par le chemin de votre dépôt local

REM Fonction pour exécuter une commande Git
:RunGitCommand
set command=%1
echo Exécution de la commande : %command%

REM Exécuter la commande Git dans le répertoire du dépôt local
git -C "%localRepoPath%" %command%

REM Vérifier le code de sortie de la commande Git
if %ERRORLEVEL% neq 0 (
    echo Erreur lors de l'exécution de la commande git.
) else (
    echo Commande exécutée avec succès : %command%
)

goto :eof

REM Fonction pour effectuer un git pull
:GitPull
echo Récupération des dernières modifications depuis le dépôt distant...

REM Exécuter git pull pour récupérer les dernières modifications
call :RunGitCommand pull

REM Exécution de la fonction GitPull
call :GitPull
