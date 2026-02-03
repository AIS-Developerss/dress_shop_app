# Генерация Dart gRPC кода из proto.
# Требования: protoc в PATH (winget install Google.Protobuf), dart pub global activate protoc_plugin
# Добавьте в PATH: $env:LOCALAPPDATA\Pub\Cache\bin

$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
Set-Location $projectRoot

$dartBin = "$env:LOCALAPPDATA\Pub\Cache\bin"
if (Test-Path $dartBin) {
    $env:Path = "$dartBin;$env:Path"
}

$generatedDir = "lib\generated"
if (-not (Test-Path $generatedDir)) {
    New-Item -ItemType Directory -Path $generatedDir -Force
}

Write-Host "Generating gRPC Dart code from proto/api.proto..."
protoc --dart_out=grpc:$generatedDir -I proto proto/api.proto
if ($LASTEXITCODE -ne 0) {
    Write-Error "protoc failed. Install: winget install Google.Protobuf ; dart pub global activate protoc_plugin"
    exit 1
}
Write-Host "Done. Generated files in $generatedDir"
