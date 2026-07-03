# shift.ps1 - manual gear shifter for Claude CLI
# Run: .\shift.ps1   (pick gear, launches claude in that model)
#      .\shift.ps1 3  (skip menu, straight into gear 3)

$gears = [ordered]@{
  1 = @{ name = 'Haiku 4.5 (light, zippy)';   model = 'claude-haiku-4-5-20251001' }
  2 = @{ name = 'Sonnet 5 (cruising)';         model = 'claude-sonnet-5' }
  3 = @{ name = 'Fable 5 (sport)';             model = 'claude-fable-5' }
  4 = @{ name = 'Opus 4.8 (full power)';       model = 'claude-opus-4-8' }
}

$g = $args[0]
if (-not $g) {
  Write-Host "`n  CLAUDE GEARBOX" -ForegroundColor Cyan
  foreach ($k in $gears.Keys) { Write-Host ("  [{0}] {1}" -f $k, $gears[$k].name) }
  $g = Read-Host "`n  shift into gear"
}

$sel = $gears[[int]$g]
if (-not $sel) { Write-Host "  no such gear: $g" -ForegroundColor Red; exit 1 }

Write-Host ("  >> {0}" -f $sel.name) -ForegroundColor Green
claude --model $sel.model
