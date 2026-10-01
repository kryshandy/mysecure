# build_apk.ps1 - Build script for mySecure APK (Windows PowerShell)

param(
    [switch]$Install,
    [switch]$Clean
)

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "mySecure APK Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

$ProjectDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$FlutterDir = $ProjectDir
$BuildDir = Join-Path $FlutterDir "build"
$ApkOutputDir = Join-Path $BuildDir "apk"

Write-Host "Project directory: $ProjectDir" -ForegroundColor Yellow

# Step 1: Clean if requested
if ($Clean) {
    Write-Host "`nStep 1: Cleaning previous builds..." -ForegroundColor Yellow
    Set-Location $FlutterDir
    flutter clean
    Set-Location (Join-Path $FlutterDir "android")
    .\gradlew clean
}

# Step 2: Get dependencies
Write-Host "`nStep 2: Getting Flutter dependencies..." -ForegroundColor Yellow
Set-Location $FlutterDir
flutter pub get

# Step 3: Generate code
Write-Host "`nStep 3: Generating code (freezed, json_serializable, drift, riverpod)..." -ForegroundColor Yellow
dart run build_runner build --delete-conflicting-outputs

# Step 4: Verify native libraries
Write-Host "`nStep 4: Checking native libraries..." -ForegroundColor Yellow
$NativeDir = Join-Path $FlutterDir "android\app\src\main\jniLibs"
if (-not (Test-Path $NativeDir)) {
    Write-Host "Creating jniLibs directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path (Join-Path $NativeDir "arm64-v8a") -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $NativeDir "armeabi-v7a") -Force | Out-Null

    Write-Host "NOTE: Native libraries (libmysecure_wifi.so, libmysecure_crypto.so) need to be compiled and placed in:" -ForegroundColor Yellow
    Write-Host "  $NativeDir\arm64-v8a\" -ForegroundColor Yellow
    Write-Host "  $NativeDir\armeabi-v7a\" -ForegroundColor Yellow
    Write-Host "For now, creating placeholder files..." -ForegroundColor Yellow

    New-Item -ItemType File -Path (Join-Path $NativeDir "arm64-v8a\libmysecure_wifi.so") -Force | Out-Null
    New-Item -ItemType File -Path (Join-Path $NativeDir "arm64-v8a\libmysecure_crypto.so") -Force | Out-Null
    New-Item -ItemType File -Path (Join-Path $NativeDir "armeabi-v7a\libmysecure_wifi.so") -Force | Out-Null
    New-Item -ItemType File -Path (Join-Path $NativeDir "armeabi-v7a\libmysecure_crypto.so") -Force | Out-Null
}

# Step 5: Build APK
Write-Host "`nStep 5: Building APK (release)..." -ForegroundColor Yellow
Set-Location $FlutterDir
flutter build apk --release --target-platform android-arm64,android-arm

# Step 6: Copy APK to output directory
Write-Host "`nStep 6: Copying APK to output directory..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path $ApkOutputDir -Force | Out-Null

$ApkPath = Get-ChildItem (Join-Path $FlutterDir "build\app\outputs\flutter-apk") -Filter "*.apk" | Select-Object -First 1
if ($ApkPath) {
    $Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $DestPath = Join-Path $ApkOutputDir "mySecure_v1.0.0_${Timestamp}.apk"
    Copy-Item $ApkPath.FullName -Destination $DestPath -Force
    Write-Host "APK copied to: $DestPath" -ForegroundColor Green

    $Size = "{0:N2} MB" -f ($ApkPath.Length / 1MB)
    Write-Host "APK size: $Size" -ForegroundColor Green
} else {
    Write-Host "ERROR: APK not found!" -ForegroundColor Red
    exit 1
}

# Step 7: Verify APK
Write-Host "`nStep 7: APK Info:" -ForegroundColor Yellow
Write-Host "  Location: $DestPath" -ForegroundColor Green

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "BUILD SUCCESSFUL!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "APK Location: $DestPath" -ForegroundColor Yellow
Write-Host "`nTo install on device:" -ForegroundColor Cyan
Write-Host "  adb install -r `"$DestPath`"" -ForegroundColor Cyan

# Optional: Install if device connected
$Devices = adb devices 2>$null
if ($Devices -match "device$") {
    if ($Install -or (Read-Host "Device detected. Install automatically? (y/n)" -eq 'y')) {
        Write-Host "Installing..." -ForegroundColor Yellow
        adb install -r $DestPath
        Write-Host "Installed successfully!" -ForegroundColor Green
    }
}