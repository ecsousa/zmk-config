Write-Warning "Deploying Glove80 firmware..."

Write-Warning "Waiting for left hand to be connected..."

while( (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80RHBOOT' }) -eq $null )
{
    Start-Sleep -Seconds 0.3
}

cp -Verbose .\glove80.uf2 (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80RHBOOT' }).path

Write-Warning "Waiting for right hand to be connected..."

while( (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80LHBOOT' }) -eq $null )
{
    Start-Sleep -Seconds 0.3
}

cp -Verbose .\glove80.uf2 (Get-Volume | ? { $_.FileSystemLabel -eq 'GLV80LHBOOT' }).path
