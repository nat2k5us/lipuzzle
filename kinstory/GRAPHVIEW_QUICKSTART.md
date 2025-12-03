# GraphView Family Tree - Quick Start Guide

## 🚀 How to Run

### Option 1: Using the Bash Script (Easiest)

```bash
cd /home/user/familytree/kinstory
./run_graphview.sh
```

### Option 2: Manual Commands

```bash
cd /home/user/familytree/kinstory
flutter pub get
flutter run
```

---

## 🗺️ Navigation Steps

Once the app is running, follow these steps to see the GraphView:

### Step 1: Launch the App
- The app will start and show the sign-in screen
- Sign in or skip if you're auto-authenticated

### Step 2: Get to the Family Tree Screen
You have multiple ways to navigate:

**Option A: From Dashboard**
1. Tap **"Family Tree"** card on the dashboard
2. OR tap the menu icon and select **"Krishna Family Tree"**

**Option B: Direct Navigation**
1. Look for the navigation drawer/menu
2. Select **"Family Tree"** or **"Krishna Family Tree"**

You'll see a screen titled: **"Krishna Family Tree"** (SVG View)

### Step 3: Switch to GraphView
1. **Look at the top-right corner** of the screen
2. You'll see TWO icons:
   - 🌳 **Tree icon** - "Switch to Graph View"
   - 🔍 Zoom icon - "Reset Zoom"
3. **TAP THE TREE ICON** (🌳)

### Step 4: You're There!
The screen will change to show:
- **Title**: "Family Tree - Graph View"
- **Beautiful 3D cards** with family members
- **Modern gradient background**
- **Professional connectors** between nodes
- **Legend card** in the top-left corner

---

## 🎮 Controls

Once you're in GraphView:

### Zoom & Pan
- **Pinch to Zoom**: Use two fingers to zoom in/out
- **Drag to Pan**: Drag with one finger to move around
- **Reset Zoom**: Tap the floating button (top-right)

### Interact with Nodes
- **Tap any person card**: See their details in a bottom sheet
- **Toggle Legend**: Tap the eye icon (top-right) to show/hide legend

### Switch Back
- **Tap the image icon** (📷) in the top-right to return to SVG view

---

## 🎨 What You'll See

### Person Cards
- **3D depth effect** with multiple shadows
- **Colored accent bar** at the top (blue for male, pink for female)
- **Circular avatar** with gender icon
- **Name** in bold, clear typography
- **Birth/Death dates** in colored badge
- **Professional color scheme**

### Layout
- **Hierarchical tree structure** (top to bottom)
- **Parent-child relationships** shown with lines
- **Automatic spacing** between family members
- **Smart layout algorithm** (Buchheim-Walker)

### Colors
- 🔵 **Male**: Material Blue (#2196F3)
- 🔴 **Female**: Material Pink (#E91E63)
- ⚫ **Other**: Material Grey (#9E9E9E)

---

## 📱 Supported Platforms

The app should work on:
- ✅ iOS (iPad/iPhone)
- ✅ Android (Phone/Tablet)
- ✅ macOS
- ✅ Web
- ✅ Linux
- ✅ Windows

---

## 🐛 Troubleshooting

### "Flutter not found"
Install Flutter: https://docs.flutter.dev/get-started/install

### "No family members yet"
The demo data should load automatically. If not:
1. Check the console for errors
2. Ensure `demo-tree-123` exists in the MockDatabase
3. Look for messages starting with 🟢 in the console

### Can't find the tree icon
1. Make sure you're on the **"Krishna Family Tree"** screen (SVG view)
2. Look in the **top-right corner** of the app bar
3. The icon looks like a tree/hierarchy icon

### Black boxes appearing
The latest code should fix this. If you still see black boxes:
1. Hot reload the app (press `r` in terminal)
2. Check console for 🎨 messages showing color values
3. Share the console output for debugging

---

## 📊 Console Output

When navigating to GraphView, you should see:

```
🔴 SVG Screen: Navigating to GraphView...
🧭 ROUTER: path=/dashboard/graph-family-tree
🟢 GraphFamilyTreeScreen: Loading tree demo-tree-123
🟢 GraphFamilyTreeScreen: Found X persons
🟢 GraphFamilyTreeScreen: Found Y relationships
🔵 GraphView: Building graph with X persons and Y relationships
🔵 GraphView: Created X nodes
🔵 GraphView: Created X edges
```

If you see `Found 0 persons`, the demo data didn't load.

---

## 🎯 Direct URL (for Web)

If running on web, you can navigate directly:
```
http://localhost:PORT/#/dashboard/graph-family-tree?treeId=demo-tree-123
```

---

## 📸 Features

### Current Features
✅ 3D card-style person nodes
✅ Hierarchical tree layout
✅ Zoom and pan controls
✅ Person detail bottom sheets
✅ Legend with color coding
✅ Gradient background
✅ Professional connectors

### Future Enhancements
- Photo support (real profile pictures)
- Spouse connectors (horizontal lines)
- Different layout options (horizontal, circular)
- Export to image/PDF
- Animations and transitions
- Search and highlight
- Generation grouping

---

## 🆘 Need Help?

1. Check the console output for debug messages
2. Look for errors in the terminal
3. Hot reload the app (`r` key)
4. Restart the app if needed (`R` key)

---

## 📚 More Info

See `GRAPHVIEW_IMPLEMENTATION.md` for technical details about the implementation.

---

**Enjoy your beautiful family tree! 🌳✨**
