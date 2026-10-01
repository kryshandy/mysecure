#!/bin/bash
# build_apk.sh - Build script for mySecure APK

set -e  # Exit on error

echo "========================================"
echo "mySecure APK Build Script"
echo "========================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLUTTER_DIR="$PROJECT_DIR"
BUILD_DIR="$FLUTTER_DIR/build"
APK_OUTPUT_DIR="$BUILD_DIR/apk"

echo -e "${YELLOW}Project directory: $PROJECT_DIR${NC}"

# Step 1: Clean previous builds
echo -e "\n${YELLOW}Step 1: Cleaning previous builds...${NC}"
cd "$FLUTTER_DIR"
flutter clean
cd "$FLUTTER_DIR/android"
./gradlew clean

# Step 2: Get dependencies
echo -e "\n${YELLOW}Step 2: Getting Flutter dependencies...${NC}"
cd "$FLUTTER_DIR"
flutter pub get

# Step 3: Generate code (freezed, json_serializable, drift, riverpod)
echo -e "\n${YELLOW}Step 3: Generating code...${NC}"
dart run build_runner build --delete-conflicting-outputs

# Step 4: Verify native libraries exist
echo -e "\n${YELLOW}Step 4: Checking native libraries...${NC}"
NATIVE_DIR="$FLUTTER_DIR/android/app/src/main/jniLibs"
if [ ! -d "$NATIVE_DIR" ]; then
    echo -e "${YELLOW}Creating jniLibs directory...${NC}"
    mkdir -p "$NATIVE_DIR/arm64-v8a"
    mkdir -p "$NATIVE_DIR/armeabi-v7a"
    echo -e "${YELLOW}NOTE: Native libraries (libmysecure_wifi.so, libmysecure_crypto.so) need to be compiled and placed in:${NC}"
    echo -e "  $NATIVE_DIR/arm64-v8a/"
    echo -e "  $NATIVE_DIR/armeabi-v7a/"
    echo -e "${YELLOW}For now, creating placeholder files...${NC}"
    touch "$NATIVE_DIR/arm64-v8a/libmysecure_wifi.so"
    touch "$NATIVE_DIR/arm64-v8a/libmysecure_crypto.so"
    touch "$NATIVE_DIR/armeabi-v7a/libmysecure_wifi.so"
    touch "$NATIVE_DIR/armeabi-v7a/libmysecure_crypto.so"
fi

# Step 5: Build APK
echo -e "\n${YELLOW}Step 5: Building APK (release)...${NC}"
cd "$FLUTTER_DIR"
flutter build apk --release --target-platform android-arm64,android-arm

# Step 6: Copy APK to output directory
echo -e "\n${YELLOW}Step 6: Copying APK to output directory...${NC}"
mkdir -p "$APK_OUTPUT_DIR"

# Find and copy the APK
APK_PATH=$(find "$FLUTTER_DIR/build/app/outputs/flutter-apk" -name "*.apk" | head -1)
if [ -n "$APK_PATH" ]; then
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    DEST_PATH="$APK_OUTPUT_DIR/mySecure_v1.0.0_${TIMESTAMP}.apk"
    cp "$APK_PATH" "$DEST_PATH"
    echo -e "${GREEN}APK copied to: $DEST_PATH${NC}"
    
    # Get file size
    SIZE=$(du -h "$DEST_PATH" | cut -f1)
    echo -e "${GREEN}APK size: $SIZE${NC}"
else
    echo -e "${RED}ERROR: APK not found!${NC}"
    exit 1
fi

# Step 7: Verify APK
echo -e "\n${YELLOW}Step 7: Verifying APK...${NC}"
if command -v aapt &> /dev/null; then
    aapt dump badging "$DEST_PATH" | grep -E "package|versionCode|versionName|application-label|native-code"
else
    echo -e "${YELLOW}aapt not found, skipping APK verification${NC}"
fi

echo -e "\n${GREEN}========================================"
echo "BUILD SUCCESSFUL!"
echo "========================================${NC}"
echo -e "APK Location: ${YELLOW}$DEST_PATH${NC}"
echo -e "\nTo install on device:"
echo -e "  adb install -r \"$DEST_PATH\""
echo -e "\nTo install on multiple architectures (universal APK):"
echo -e "  flutter build apk --release"
echo ""

# Optional: Install if device connected
if adb devices | grep -q "device$"; then
    echo -e "${YELLOW}Device detected. Install automatically? (y/n)${NC}"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        adb install -r "$DEST_PATH"
        echo -e "${GREEN}Installed successfully!${NC}"
    fi
fi