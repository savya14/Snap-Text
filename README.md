# Snap-Text

A lightweight macOS utility that extracts text from anywhere on your screen using OCR (Optical Character Recognition).

## Overview

TextExtract runs quietly in your menu bar, allowing you to capture and extract text from images, PDFs, or any content displayed on your screen. Perfect for copying text from non-selectable sources, digitizing printed documents, or quickly extracting information from screenshots.

## Features

- **Screen Text Extraction**: Capture text from any area of your screen
- **Menu Bar Integration**: Lightweight app that stays out of your way
- **Native macOS Experience**: Built specifically for macOS 13.0 and later
- **Quick Access**: Fast and efficient text recognition
- **Privacy-Focused**: Runs locally on your machine

### Coming Soon
- ⏳ **Video Text Extraction** - Currently unavailable, will be updated tomorrow

## System Requirements

- macOS 13.0 (Ventura) or later
- Screen Recording permission (required for capturing screen content)

## Download & Installation

### Download Pre-built App (Recommended)

1. Go to the [Releases](https://github.com/savya14/textextract/releases) page
2. Download the latest `TextExtract.app.zip` file
3. Unzip the downloaded file
4. Move `TextExtract.app` to your Applications folder
5. Right-click the app and select "Open" (first time only)
6. Grant Screen Recording permission when prompted

**Requirements for building:**
- macOS 13.0 or later

## Usage

1. Launch TextExtract from your Applications folder
2. The app will appear in your menu bar
3. Click the menu bar icon to access text extraction features
4. Select the area of your screen you want to extract text from
5. The extracted text will be automatically copied to your clipboard

## Permissions

TextExtract requires **Screen Recording** permission to capture content from your screen. This is a standard macOS privacy feature.

**To grant permission:**
1. Open System Settings
2. Go to Privacy & Security → Screen Recording
3. Enable the toggle next to TextExtract
4. Restart the app if it was already running

## Privacy

TextExtract respects your privacy:
- All processing happens locally on your device
- No data is sent to external servers
- Screen captures are processed in memory and not permanently stored
- The app only accesses your screen when you explicitly trigger text extraction

## Troubleshooting

**App won't open or shows security warning**
- Right-click the app and select "Open" the first time you launch it
- Go to System Settings → Privacy & Security and click "Open Anyway"
- This is a standard macOS security measure for apps not downloaded from the App Store

**Text extraction not working**
- Ensure Screen Recording permission is granted in System Settings
- Try restarting the app after granting permissions
- Make sure you're running macOS 13.0 or later

**App not appearing in menu bar**
- Check that the app is running (look in Activity Monitor)
- Try quitting and relaunching the application
- Check if the menu bar icon is hidden (expand the menu bar if needed)

**Build fails when compiling from source**
- Ensure Xcode Command Line Tools are installed: `xcode-select --install`
- Verify Swift version: `swift --version` (should be 5.9+)
- Make sure the build script is executable: `chmod +x create_app.sh`

## Roadmap

- [x] Screen text extraction
- [x] Menu bar integration
- [x] Keyboard shortcuts
- [ ] Video text extraction (Coming later)
- [ ] Multi-language OCR support
- [ ] Text history/clipboard manager

## License

[Choose your license - MIT, Apache 2.0, GPL v3, etc.]

## Acknowledgments

Built with native macOS technologies and Swift to provide a fast, secure, and privacy-focused text extraction tool.

## Support

If you encounter any issues or have questions:
- Open an issue on [GitHub Issues](https://github.com/yourusername/textextract/issues)
- Check the [Troubleshooting](#troubleshooting) section above

---

**Made with ❤️ for macOS users**

**Current Version:** 1.0  
**Last Updated:** January 2026
