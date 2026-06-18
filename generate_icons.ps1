# C:\Users\openIT\StudioProjects\flutter_glyco_care\generate_icons.ps1

Write-Host "=== GÉNÉRATION DES ICÔNES GLYCOCARE ===" -ForegroundColor Cyan
Write-Host ""

# Créer le dossier icons
$iconsDir = "assets\icons"
if (-not (Test-Path $iconsDir)) {
    New-Item -ItemType Directory -Force -Path $iconsDir
    Write-Host "✓ Dossier $iconsDir créé" -ForegroundColor Green
}

Write-Host "Étape 1: Exécution du script Dart..." -ForegroundColor Yellow
dart run create_icons.dart

Write-Host ""
Write-Host "Étape 2: Vérification des fichiers..." -ForegroundColor Yellow

$requiredFiles = @(
    "app_icon.png",
    "app_icon_foreground.png",
    "app_icon_background.png",
    "notification_badge.png"
)

$allPresent = $true

foreach ($file in $requiredFiles) {
    $filePath = Join-Path $iconsDir $file

    if (Test-Path $filePath) {
        $fileInfo = Get-Item $filePath
        $sizeKB = [math]::Round($fileInfo.Length / 1KB, 2)
        Write-Host "  ✓ $file" -ForegroundColor Green -NoNewline
        Write-Host " ($sizeKB KB)" -ForegroundColor Gray
    } else {
        Write-Host "  ✗ $file - MANQUANT" -ForegroundColor Red
        $allPresent = $false
    }
}

Write-Host ""
if ($allPresent) {
    Write-Host "✅ Toutes les icônes sont prêtes!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Prochaine étape:" -ForegroundColor Cyan
    Write-Host "  flutter pub run flutter_launcher_icons" -ForegroundColor White
} else {
    Write-Host "❌ Certaines icônes sont manquantes" -ForegroundColor Red
}