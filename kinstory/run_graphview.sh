#!/bin/bash

echo "🚀 Starting KinStory with GraphView Family Tree..."
echo ""

# Navigate to the kinstory directory
cd /home/user/familytree/kinstory

# Check if Flutter is available
if ! command -v flutter &> /dev/null; then
    echo "⚠️  Flutter is not installed or not in PATH"
    echo ""
    echo "Please install Flutter first:"
    echo "https://docs.flutter.dev/get-started/install"
    exit 1
fi

# Install dependencies if needed
echo "📦 Installing dependencies..."
flutter pub get

echo ""
echo "✅ Dependencies installed!"
echo ""

# Run the app
echo "🎨 Launching KinStory app..."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  HOW TO VIEW THE GRAPHVIEW FAMILY TREE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1️⃣  Sign in to the app (or skip if auto-signed in)"
echo ""
echo "2️⃣  Navigate: Dashboard → Family Tree"
echo "    (Or use the menu to find 'Krishna Family Tree')"
echo ""
echo "3️⃣  In the app bar (top right), tap the 🌳 TREE ICON"
echo "    (Tooltip: 'Switch to Graph View')"
echo ""
echo "4️⃣  You'll see the title change to:"
echo "    'Family Tree - Graph View' ✨"
echo ""
echo "5️⃣  Enjoy the 3D card-style family tree!"
echo "    • Pinch to zoom"
echo "    • Drag to pan"
echo "    • Tap nodes for details"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Starting Flutter app now..."
echo ""

flutter run
