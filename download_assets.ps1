# C:\Users\openIT\StudioProjects\flutter_glyco_care\download_assets.ps1

$imageUrls = @{
    "welcome_illustration.png" = "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg"
    "doctor_illustration.png" = "https://img.freepik.com/free-vector/medical-concept-illustration_114360-890.jpg"
}

$outputDir = "assets\images"

# Créer le dossier
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir
    Write-Host "Dossier $outputDir créé" -ForegroundColor Green
}

# Télécharger les images
foreach ($image in $imageUrls.GetEnumerator()) {
    $outputPath = Join-Path $outputDir $image.Key

    if (Test-Path $outputPath) {
        Write-Host "$($image.Key) existe déjà" -ForegroundColor Yellow
        continue
    }

    Write-Host "Téléchargement de $($image.Key)..." -ForegroundColor Cyan

    try {
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($image.Value, $outputPath)
        Write-Host "✓ $($image.Key) téléchargé" -ForegroundColor Green
    }
    catch {
        Write-Host "✗ Erreur: $_" -ForegroundColor Red
    }
}

Write-Host "`nTéléchargement terminé!" -ForegroundColor Green
Write-Host "Images dans: $(Resolve-Path $outputDir)" -ForegroundColor Cyan