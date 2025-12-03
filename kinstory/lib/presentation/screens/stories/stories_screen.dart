import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/story_providers.dart';
import '../../../data/datasources/local/mock_database.dart';

class StoriesScreen extends ConsumerStatefulWidget {
  const StoriesScreen({super.key});

  @override
  ConsumerState<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends ConsumerState<StoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'all';
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storiesAsync = ref.watch(storiesProvider);
    final categoriesAsync = ref.watch(storyCategoriesProvider);
    final featuredStoriesAsync = ref.watch(featuredStoriesProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Family Stories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => context.go('/dashboard'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.orange),
            onPressed: () => context.go('/dashboard/stories/new'),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.orange),
            onPressed: () => _showSearchDialog(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Stories Section
            featuredStoriesAsync.when(
              data: (featuredStories) {
                if (featuredStories.isEmpty) {
                  return const SizedBox();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Featured Stories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredStories.take(5).length,
                        itemBuilder: (context, index) {
                          final story = featuredStories[index];
                          return _FeaturedStoryCard(story: story);
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                );
              },
              loading: () => const SizedBox(),
              error: (_, __) => const SizedBox(),
            ),

            // Category Filter
            categoriesAsync.when(
              data: (categories) => _CategoryFilter(
                categories: categories,
                selectedCategory: _selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
              loading: () => const SizedBox(),
              error: (_, __) => const SizedBox(),
            ),

            const SizedBox(height: 24),

            // Stories List
            const Text(
              'All Stories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            storiesAsync.when(
              data: (stories) {
                // Filter stories by category and search
                var filteredStories = stories;

                if (_selectedCategory != 'all') {
                  filteredStories = filteredStories
                      .where((story) => story.category == _selectedCategory)
                      .toList();
                }

                if (_searchQuery.isNotEmpty) {
                  final query = _searchQuery.toLowerCase();
                  filteredStories = filteredStories.where((story) {
                    return story.title.toLowerCase().contains(query) ||
                           story.content.toLowerCase().contains(query) ||
                           story.tags.any((tag) => tag.toLowerCase().contains(query));
                  }).toList();
                }

                if (filteredStories.isEmpty) {
                  return _EmptyStoriesView(
                    selectedCategory: _selectedCategory,
                    hasSearchQuery: _searchQuery.isNotEmpty,
                  );
                }

                return Column(
                  children: filteredStories.map((story) {
                    return _StoryCard(
                      story: story,
                      onTap: () => context.go('/dashboard/stories/${story.id}'),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              ),
              error: (error, stackTrace) => Center(
                child: Column(
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    const Text('Error loading stories'),
                    const SizedBox(height: 8),
                    Text(error.toString(), style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/dashboard/stories/new'),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white),
        tooltip: 'Add New Story',
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Stories'),
        content: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Enter search terms...',
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: (value) {
            setState(() {
              _searchQuery = value;
            });
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _searchQuery = '';
                _searchController.clear();
              });
              Navigator.of(context).pop();
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _searchQuery = _searchController.text;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}

class _FeaturedStoryCard extends StatelessWidget {
  final MockStory story;

  const _FeaturedStoryCard({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () => context.go('/dashboard/stories/${story.id}'),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.orange.shade400, Colors.orange.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _getCategoryIcon(story.category),
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        story.category.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  story.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  story.content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${story.likesCount}',
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.comment, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${story.commentsCount}',
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'memory':
        return Icons.photo_album;
      case 'tradition':
        return Icons.temple_hindu;
      case 'historical':
        return Icons.history;
      case 'milestone':
        return Icons.celebration;
      default:
        return Icons.auto_stories;
    }
  }
}

class _CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const _CategoryFilter({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final allCategories = ['all', ...categories];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              final category = allCategories[index];
              final isSelected = category == selectedCategory;

              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  selected: isSelected,
                  label: Text(
                    category == 'all' ? 'All Stories' : category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.orange,
                    ),
                  ),
                  selectedColor: Colors.orange,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.orange.shade300),
                  onSelected: (selected) => onCategorySelected(category),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  final MockStory story;
  final VoidCallback onTap;

  const _StoryCard({
    required this.story,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      story.category.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('MMM d, y').format(story.createdAt),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                story.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                story.content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              if (story.tags.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  children: story.tags.take(3).map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '#$tag',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[700],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red.shade300, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${story.likesCount}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.comment, color: Colors.blue.shade300, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${story.commentsCount}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  if (story.location != null) ...[
                    const SizedBox(width: 16),
                    Icon(Icons.location_on, color: Colors.green.shade300, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        story.location!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyStoriesView extends StatelessWidget {
  final String selectedCategory;
  final bool hasSearchQuery;

  const _EmptyStoriesView({
    required this.selectedCategory,
    required this.hasSearchQuery,
  });

  @override
  Widget build(BuildContext context) {
    String message;
    String description;

    if (hasSearchQuery) {
      message = 'No Stories Found';
      description = 'Try adjusting your search terms or filters';
    } else if (selectedCategory != 'all') {
      message = 'No $selectedCategory Stories';
      description = 'Be the first to share a $selectedCategory story with your family';
    } else {
      message = 'No Stories Yet';
      description = 'Start sharing your family memories and traditions';
    }

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            hasSearchQuery ? Icons.search_off : Icons.auto_stories,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          if (!hasSearchQuery) ...[
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.go('/dashboard/stories/new'),
              icon: const Icon(Icons.add),
              label: const Text('Share Your First Story'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}