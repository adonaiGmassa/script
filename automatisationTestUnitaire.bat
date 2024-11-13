# Script PowerShell pour exécuter les tests unitaires dans un projet .NET
param (
    [string]$projectPath = "C:\Chemin\Vers\Le\Projet"
)

# Naviguer vers le répertoire du projet
cd $projectPath

# Exécuter les tests unitaires avec dotnet test
$testResult = dotnet test --no-build --logger "trx;LogFileName=test_results.trx"

# Vérifier les résultats des tests
if ($testResult -match "Total tests: (\d+), Passed: (\d+), Failed: (\d+)") {
    $totalTests = $matches[1]
    $passedTests = $matches[2]
    $failedTests = $matches[3]
    
    Write-Host "$passedTests tests réussis sur $totalTests"
    if ($failedTests -gt 0) {
        Write-Host "Certains tests ont échoué !"
    }
} else {
    Write-Host "Erreur lors de l'exécution des tests."
}
