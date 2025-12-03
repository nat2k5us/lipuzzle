# GraphView Family Tree Implementation

This document describes the implementation of the GraphView-based family tree visualization in KinStory.

## Overview

The GraphView package provides an alternative visualization for the family tree, offering an interactive hierarchical graph layout. This complements the existing SVG-based visualization with a more dynamic and algorithmic approach.

## Package Information

- **Package**: `graphview: ^1.2.0`
- **GitHub**: https://github.com/nabil6391/graphview
- **Purpose**: Renders tree, layered, and directed graphs with automatic layout algorithms

## Key Features

1. **Hierarchical Layout**: Uses the Buchheim-Walker algorithm for optimal tree layout
2. **Interactive**: Pinch-to-zoom and pan capabilities via InteractiveViewer
3. **Custom Nodes**: Each person is rendered with a custom widget showing:
   - Profile icon (gender-based)
   - Name
   - Birth/Death dates
   - Gender-based color coding
4. **Relationship Visualization**: Parent-child relationships shown as edges
5. **Person Details**: Tap on any node to view detailed information

## Implementation Structure

### Files Created

1. **`lib/presentation/widgets/tree/graph_tree_view.dart`**
   - Main GraphView widget
   - Handles graph construction from persons and relationships
   - Manages zoom/pan controls
   - Configures Buchheim-Walker layout algorithm

2. **`lib/presentation/widgets/tree/person_node_widget.dart`**
   - Custom widget for rendering each person node
   - Gender-based styling (blue for male, pink for female, grey for other/unknown)
   - Shows name, dates, and profile icon
   - Handles tap interactions

3. **`lib/presentation/screens/graph_family_tree_screen.dart`**
   - Full-screen view of the graph tree
   - Integrates with MockDatabase for data
   - Displays legend for color coding
   - Shows person details in bottom sheet on tap

### Files Modified

1. **`kinstory/pubspec.yaml`**
   - Added `graphview: ^1.2.0` dependency

2. **`lib/core/router/app_router.dart`**
   - Added route: `/dashboard/graph-family-tree`
   - Accepts `treeId` query parameter

3. **`lib/presentation/screens/family_tree_screen.dart`**
   - Added button to switch to Graph View

## Usage

### Accessing the Graph View

1. Navigate to the Family Tree screen (SVG view)
2. Tap the tree icon in the app bar to switch to Graph View
3. Tap the image icon in Graph View to switch back to SVG view

### Navigation Routes

```dart
// Navigate to Graph View with specific tree
context.push('/dashboard/graph-family-tree?treeId=demo-tree-123');

// Navigate to SVG View
context.push('/dashboard/family-tree');
```

### Layout Configuration

The Buchheim-Walker algorithm can be configured in `graph_tree_view.dart`:

```dart
builder
  ..siblingSeparation = 100      // Horizontal spacing between siblings
  ..levelSeparation = 100        // Vertical spacing between generations
  ..subtreeSeparation = 150      // Spacing between different subtrees
  ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
```

## Data Flow

1. **Data Source**: MockDatabase provides `MockPerson` and `MockRelationship` objects
2. **Graph Construction**:
   - Each person becomes a Node in the graph
   - Parent-child relationships become edges
   - Spouse/partner relationships are not shown as edges (optional future enhancement)
3. **Rendering**: GraphView algorithm calculates node positions and renders connections

## Styling

### Node Colors

- **Male**: Light blue background (`Colors.blue.shade100`), dark blue border
- **Female**: Light pink background (`Colors.pink.shade100`), dark pink border
- **Other/Unknown**: Light grey background, dark grey border

### Node Information

- Circle avatar with gender icon
- Name (strikethrough if deceased)
- Birth year or birth-death year range
- Width: 140px
- Rounded corners with shadow

## Interactions

1. **Zoom**: Pinch gesture or scroll
2. **Pan**: Drag gesture
3. **Reset Zoom**: Floating action button (top-right)
4. **View Person**: Tap on any node to see details in bottom sheet
5. **Toggle Legend**: Eye icon in app bar

## Future Enhancements

Potential improvements for the GraphView implementation:

1. **Spouse Connections**: Add horizontal edges for spouse/partner relationships
2. **Different Layouts**: Support for different graph algorithms (Layered, Force-directed)
3. **Filtering**: Show/hide certain relationship types
4. **Export**: Export graph as image or PDF
5. **Customization**: User-configurable colors and node styles
6. **Search**: Highlight and focus on specific persons
7. **Generations**: Color-code or group by generation
8. **Timeline**: Vertical layout based on birth years

## Dependencies

The GraphView implementation requires:

- `graphview: ^1.2.0` - Graph visualization
- `flutter_riverpod` - State management
- `go_router` - Navigation

## Testing

To test the implementation:

1. Ensure demo data is loaded in MockDatabase
2. Run `flutter pub get` to install graphview package
3. Navigate to `/dashboard/graph-family-tree?treeId=demo-tree-123`
4. Verify:
   - Tree renders correctly
   - Zoom/pan works
   - Tapping nodes shows details
   - Legend displays correctly

## Troubleshooting

### Empty Graph
- Check that `treeId` parameter matches a tree in the database
- Verify persons and relationships exist for that tree

### Layout Issues
- Adjust spacing parameters in BuchheimWalkerConfiguration
- Check that parent-child relationships are correctly identified

### Performance
- For large trees (>100 nodes), consider lazy loading or filtering options
- GraphView handles medium-sized trees (20-50 nodes) efficiently

## References

- [GraphView Package](https://pub.dev/packages/graphview)
- [Buchheim-Walker Algorithm](https://llimllib.github.io/pymag-trees/)
- [InteractiveViewer Documentation](https://api.flutter.dev/flutter/widgets/InteractiveViewer-class.html)
