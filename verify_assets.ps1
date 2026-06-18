# C:\Users\openIT\StudioProjects\flutter_glyco_care\verify_assets.ps1

$assetsDir = "assets\images"
$requiredFiles = @(
    "welcome_illustration.png",
    "doctor_illustration.png",
    "avatar_placeholder.png",
    "logo.png"
)

Write-Host "=== VÉRIFICATION DES ASSETS ===" -ForegroundColor Cyan
Write-Host ""

$allPresent = $true

foreach ($file in $requiredFiles) {
    $filePath = Join-Path $assetsDir $file

    if (Test-Path $filePath) {
        $fileInfo = Get-Item $filePath
        $sizeKB = [math]::Round($fileInfo.Length / 1KB, 2)
        Write-Host "✓ $file" -ForegroundColor Green -NoNewline
        Write-Host " ($sizeKB KB)" -ForegroundColor Gray
    } else {
        Write-Host "✗ $file - MANQUANT" -ForegroundColor Red
        $allPresent = $false
    }
}

Write-Host ""
if ($allPresent) {
    Write-Host "✅ Tous les assets sont présents!" -ForegroundColor Green
} else {
    Write-Host "❌ Certains assets sont manquants. Exécutez 'dart run create_assets.dart'" -ForegroundColor Red
}