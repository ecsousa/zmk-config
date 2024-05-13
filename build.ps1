param (
[string]$Branch = 'main',
[string]$ImageName = 'glove80-zmk-config-docker',
[switch]$Clipboard
)

if ($Clipboard) {
    Set-Content -Path config\glove80.keymap -Value (Get-Clipboard)
}

docker build -t "$ImageName" .

docker run --rm -v "$(Convert-Path .):/config" -e GID=0 -e BRANCH="$Branch" "$ImageName"

