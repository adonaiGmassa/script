@echo off
echo Sauvegarde en cours...

:: Définir le chemin du dossier source et de destination
set "source=C:\MesDocuments"
set "destination=D:\Sauvegarde"

:: Créer le dossier de destination si il n'existe pas
if not exist "%destination%" (
    mkdir "%destination%"
)

:: Supprimer les anciennes sauvegardes (conserver la plus récente)
for /f "tokens=*" %%F in ('dir "%destination%\*.*" /A:D /O:-D /B') do (
    set "oldBackup=%%F"
    set "foundOldBackup=true"
    if defined foundOldBackup (
        rd /s /q "%destination%\%oldBackup%" 2>nul
    )
    exit /b
)

:: Copier le dossier source dans le répertoire de destination
xcopy "%source%" "%destination%\MesDocuments" /E /H /C /I

echo Sauvegarde termine.
pause
