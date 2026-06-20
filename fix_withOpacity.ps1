# C:\Users\openIT\StudioProjects\flutter_glyco_care\fix_withOpacity.ps1

Write-Host "=== CORRECTION withOpacity → withValues ===" -ForegroundColor Cyan
Write-Host ""

$projectPath = "C:\Users\openIT\StudioProjects\flutter_glyco_care\lib"
$dartFiles = Get-ChildItem -Path $projectPath -Recurse -Filter "*.dart"

$count = 0

foreach ($file in $dartFiles) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content

    # Remplacer .withOpacity( par .withValues(alpha:
    $content = $content -replace '\.withOpacity\(', '.withValues(alpha: '

    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        $relativePath = $file.FullName.Replace((Get-Location).Path + "\", "")
        Write-Host "✓ Modifié: $relativePath" -ForegroundColor Green
        $count++
    }
}

Write-Host ""
Write-Host "=== $count fichier(s) modifié(s) ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Vérifiez les fichiers modifiés avec:" -ForegroundColor Yellow
Write-Host "  git diff" -ForegroundColor White