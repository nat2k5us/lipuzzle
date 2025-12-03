import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/family_tree_svg.dart';

class FamilyTreeScreen extends StatefulWidget {
  const FamilyTreeScreen({super.key});

  @override
  State<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends State<FamilyTreeScreen> {
  String? _svg;
  bool _loading = true;
  String? _error;
  final TransformationController _transformationController = TransformationController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final svg = await loadFamilyTreeSvg();
      if (mounted) {
        setState(() {
          _svg = svg;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Family Tree')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading family tree',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  _error!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _loading = true;
                    _error = null;
                  });
                  _load();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Krishna Family Tree'),
        actions: [
          IconButton(
            onPressed: () {
              print('🔴 SVG Screen: Navigating to GraphView...');
              context.push('/dashboard/graph-family-tree?treeId=demo-tree-123');
            },
            icon: const Icon(Icons.account_tree),
            tooltip: 'Switch to Graph View',
          ),
          IconButton(
            onPressed: _resetZoom,
            icon: const Icon(Icons.zoom_out_map),
            tooltip: 'Reset Zoom',
          ),
        ],
      ),
      body: _svg == null
          ? const Center(child: Text('No SVG data available'))
          : Stack(
              children: [
                InteractiveViewer(
                  transformationController: _transformationController,
                  minScale: 0.1,
                  maxScale: 5,
                  boundaryMargin: const EdgeInsets.all(100),
                  child: Center(
                    child: SvgPicture.string(
                      _svg!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Legend
                Positioned(
                  top: 8,
                  right: 8,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Legend',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildLegendItem(
                            color: const Color(0xFFFFE4B5),
                            borderColor: const Color(0xFF8B4513),
                            label: 'Supreme',
                          ),
                          _buildLegendItem(
                            color: const Color(0xFFE6F3FF),
                            borderColor: const Color(0xFF0066CC),
                            label: 'Viṣṇu Expansions',
                          ),
                          _buildLegendItem(
                            color: const Color(0xFFFFE6E6),
                            borderColor: const Color(0xFFCC0000),
                            label: 'Brahmā',
                          ),
                          _buildLegendItem(
                            color: const Color(0xFFE6FFE6),
                            borderColor: const Color(0xFF006600),
                            label: 'Pāṇḍavas',
                          ),
                          _buildLegendItem(
                            color: const Color(0xFFFFE6E6),
                            borderColor: const Color(0xFF990000),
                            label: 'Kauravas',
                          ),
                          _buildLegendItem(
                            color: const Color(0xFFF7F7FF),
                            borderColor: const Color(0xFF444444),
                            label: 'Others',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Instructions
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.touch_app,
                            size: 20,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Pinch to zoom • Drag to pan',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required Color borderColor,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}