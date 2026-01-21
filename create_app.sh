#!/bin/bash

APP_NAME="TextExtract"
BUILD_DIR=".build/release"
APP_BUNDLE="${APP_NAME}.app"
CONTENTS_DIR="${APP_BUNDLE}/Contents"
MACOS_DIR="${CONTENTS_DIR}/MacOS"
RESOURCES_DIR="${CONTENTS_DIR}/Resources"

echo "🚀 Building ${APP_NAME}..."
swift build -c release

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

echo "📦 Creating App Bundle Structure..."
rm -rf "${APP_BUNDLE}"
mkdir -p "${MACOS_DIR}"
mkdir -p "${RESOURCES_DIR}"

# Copy binary
echo "📄 Copying binary..."
cp "${BUILD_DIR}/${APP_NAME}" "${MACOS_DIR}/"

# Create Info.plist
echo "📝 Creating Info.plist..."
cat > "${CONTENTS_DIR}/Info.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>${APP_NAME}</string>
    <key>CFBundleIdentifier</key>
    <string>com.example.${APP_NAME}</string>
    <key>CFBundleName</key>
    <string>${APP_NAME}</string>
    <key>CFBundleIconFile</key>
    <string>AppIcon</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>LSMinimumSystemVersion</key>
    <string>13.0</string>
    <key>NSHighResolutionCapable</key>
    <true/>
    <key>NSScreenCaptureUsageDescription</key>
    <string>TextExtract needs access to screen recording to capture text from other apps.</string>
    <key>LSUIElement</key>
    <true/>
</dict>
</plist>
EOF

# Process App Icon
echo "🎨 Processing App Icon..."
PRE_GENERATED_ICNS="text_extract/text_extract/AppIcon.icns"

if [ -f "$PRE_GENERATED_ICNS" ]; then
    echo "✅ Found pre-generated AppIcon.icns"
    cp "$PRE_GENERATED_ICNS" "${RESOURCES_DIR}/AppIcon.icns"
else
    # Fallback to generation (legacy)
    ICON_SOURCE=""
    if [ -d "text_extract/Assets.xcassets/AppIcon.appiconset" ]; then
        ICON_SOURCE="text_extract/Assets.xcassets/AppIcon.appiconset"
    elif [ -d "text_extract/text_extract/Assets.xcassets/AppIcon.appiconset" ]; then
        ICON_SOURCE="text_extract/text_extract/Assets.xcassets/AppIcon.appiconset"
    fi

    if [ ! -z "$ICON_SOURCE" ]; then
        ABSOLUTE_RESOURCES_DIR="$(pwd)/${RESOURCES_DIR}"
        echo "🔄 Converting .appiconset to .iconset format..."
        TEMP_ICONSET="TempAppIcon.iconset"
        rm -rf "$TEMP_ICONSET"
        cp -R "$ICON_SOURCE/" "$TEMP_ICONSET"
        # iconutil doesn't use Contents.json and it might interfere
        rm -f "$TEMP_ICONSET/Contents.json"
        
        iconutil -c icns "$TEMP_ICONSET" -o "${ABSOLUTE_RESOURCES_DIR}/AppIcon.icns"
        rm -rf "$TEMP_ICONSET"
    fi
fi

# Ad-hoc signing (required for some permissions/architectures locally)
echo "✍️  Signing app..."
codesign --force --deep --sign - "${APP_BUNDLE}"

echo "✅ App created at: $(pwd)/${APP_BUNDLE}"
echo "👉 Move this to your Applications folder and run it!"
