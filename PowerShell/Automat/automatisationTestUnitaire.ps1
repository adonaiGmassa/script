param (
    [string]$projectPath = "C:\Chemin\Vers\Le\Projet"
)

# Vérifier si le chemin du projet existe
if (-Not (Test-Path $projectPath)) {
    Write-Host "Le chemin du projet spécifié n'existe pas : $projectPath"
    exit 1
}

# Naviguer vers le répertoire du projet
Set-Location -Path $projectPath

# Exécuter les tests unitaires avec dotnet test et capturer les résultats dans un fichier
try {
    # Exécution de la commande dotnet test et capture du résultat
    $testResult = dotnet test --no-build --logger "trx;LogFileName=test_results.trx"
    
    # Vérifier si la commande dotnet test a renvoyé un message de succès ou d'échec
    if ($testResult -match "Total tests: (\d+), Passed: (\d+), Failed: (\d+)") {
        $totalTests = [int]$matches[1]
        $passedTests = [int]$matches[2]
        $failedTests = [int]$matches[3]
        
        # Afficher les résultats des tests
        Write-Host "$passedTests tests réussis sur $totalTests"
        
        if ($failedTests -gt 0) {
            Write-Host "Certains tests ont échoué : $failedTests tests échoués."
            exit 1  # Si des tests échouent, retourner un code d'erreur non nul
        } else {
            Write-Host "Tous les tests ont réussi !"
        }
    } else {
        Write-Host "Erreur lors de l'exécution des tests. Impossible de lire les résultats."
        exit 1
    }
} catch {
    # En cas d'erreur d'exécution, afficher l'erreur
    Write-Host "Une erreur est survenue lors de l'exécution des tests : $_"
    exit 1
}