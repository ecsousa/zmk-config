Write-Warning "Deploying Glove80 firmware..."

while( (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80RHBOOT' }) -eq $null )
{
    Start-Sleep -Seconds 0.3
}

cp -Verbose .\glove80.uf2 (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80RHBOOT' }).path

while( (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80LHBOOT' }) -eq $null )
{
    Start-Sleep -Seconds 0.3
}

cp -Verbose .\glove80.uf2 (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80LHBOOT' }).path
