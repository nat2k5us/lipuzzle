import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/datasources/local/mock_database.dart';
import '../widgets/tree/graph_tree_view.dart';
import '../providers/person_providers.dart';

/// A screen that displays the family tree using GraphView package.
/// This provides an alternative visualization to the SVG-based tree view.
class GraphFamilyTreeScreen extends ConsumerStatefulWidget {
  final String? treeId;

  const GraphFamilyTreeScreen({
    Key? key,
    this.treeId,
  }) : super(key: key);

  @override
  ConsumerState<GraphFamilyTreeScreen> createState() =>
      _GraphFamilyTreeScreenState();
}

class _GraphFamilyTreeScreenState
    extends ConsumerState<GraphFamilyTreeScreen> {
  bool _showLegend = true;

  @override
  Widget build(BuildContext context) {
    // Get the current tree ID (either from parameter or from selected tree)
    final treeId = widget.treeId;

    if (treeId == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Family Tree'),
        ),
        body: const Center(
          child: Text('No tree selected'),
        ),
      );
    }

    // Watch persons and relationships for the tree
    // Use the existing personsProvider which fetches from demo tree
    // For a specific tree, we'll need to implement tree-specific providers
    final database = ref.read(databaseProvider);
    final persons = database.getPersonsByTreeId(treeId);
    final relationships = database.getRelationshipsByTreeId(treeId);

    print('🟢 GraphFamilyTreeScreen: Loading tree $treeId');
    print('🟢 GraphFamilyTreeScreen: Found ${persons.length} persons');
    print('🟢 GraphFamilyTreeScreen: Found ${relationships.length} relationships');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Tree - Graph View'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/dashboard/family-tree');
            },
            icon: const Icon(Icons.image),
            tooltip: 'Switch to SVG View',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _showLegend = !_showLegend;
              });
            },
            icon: Icon(_showLegend ? Icons.visibility : Icons.visibility_off),
            tooltip: _showLegend ? 'Hide Legend' : 'Show Legend',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFF5F7FA),
              const Color(0xFFE8EAF6),
            ],
          ),
        ),
        child: persons.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No family members yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add family members to see the tree',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  GraphTreeView(
                    persons: persons,
                    relationships: relationships,
                    onPersonTap: (person) {
                      _showPersonDetails(context, person);
                    },
                  ),
                // Modern Legend Card - Bottom Right
                if (_showLegend)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF5E35B1).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.info_outline,
                                    size: 16,
                                    color: Color(0xFF5E35B1),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Legend',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF212121),
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildModernLegendItem(
                              context,
                              icon: Icons.male,
                              color: const Color(0xFF2196F3),
                              label: 'Male',
                            ),
                            _buildModernLegendItem(
                              context,
                              icon: Icons.female,
                              color: const Color(0xFFE91E63),
                              label: 'Female',
                            ),
                            _buildModernLegendItem(
                              context,
                              icon: Icons.person,
                              color: const Color(0xFF9E9E9E),
                              label: 'Other',
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.account_tree,
                                    size: 14,
                                    color: Color(0xFF90A4AE),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Lines show relationships',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF616161),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildModernLegendItem(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              size: 18,
              color: color,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF424242),
            ),
          ),
        ],
      ),
    );
  }

  void _showPersonDetails(BuildContext context, MockPerson person) {
    final fullName = person.lastName != null
        ? '${person.firstName} ${person.lastName}'
        : person.firstName;

    // Use showDialog instead of showModalBottomSheet to prevent state issues
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  fullName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                if (person.birthDate != null) ...[
                  _buildDetailRow(
                    context,
                    'Date of Birth',
                    _formatDate(person.birthDate!),
                  ),
                ],
                if (person.deathDate != null) ...[
                  _buildDetailRow(
                    context,
                    'Date of Death',
                    _formatDate(person.deathDate!),
                  ),
                ],
                _buildDetailRow(
                  context,
                  'Gender',
                  person.gender.toUpperCase(),
                ),
                if (person.birthPlace != null) ...[
                  _buildDetailRow(
                    context,
                    'Birth Place',
                    person.birthPlace!,
                  ),
                ],
                if (person.bio != null && person.bio!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Biography',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    person.bio!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPersonDetailsOLD(BuildContext context, MockPerson person) {
    final fullName = person.lastName != null
        ? '${person.firstName} ${person.lastName}'
        : person.firstName;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                fullName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              if (person.birthDate != null) ...[
                _buildDetailRow(
                  context,
                  'Date of Birth',
                  _formatDate(person.birthDate!),
                ),
              ],
              if (person.deathDate != null) ...[
                _buildDetailRow(
                  context,
                  'Date of Death',
                  _formatDate(person.deathDate!),
                ),
              ],
              _buildDetailRow(
                context,
                'Gender',
                person.gender.toUpperCase(),
              ),
              if (person.birthPlace != null) ...[
                _buildDetailRow(
                  context,
                  'Birth Place',
                  person.birthPlace!,
                ),
              ],
              if (person.bio != null && person.bio!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Biography',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  person.bio!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate to full person detail screen
                  // This would require proper routing setup
                },
                icon: const Icon(Icons.person),
                label: const Text('View Full Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

// Provider for the database instance
final databaseProvider = Provider<MockDatabase>((ref) {
  return MockDatabase.instance;
});

/// Provider for relationships in a specific tree
final relationshipsForTreeProvider =
    FutureProvider.family<List<MockRelationship>, String>((ref, treeId) async {
  final database = ref.read(databaseProvider);
  return database.getRelationshipsByTreeId(treeId);
});
