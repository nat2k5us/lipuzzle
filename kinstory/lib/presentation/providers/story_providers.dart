import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/mock_database.dart';
import 'person_providers.dart';

// Mock database provider for stories
final storyDatabaseProvider = Provider<MockDatabase>((ref) => MockDatabase());

// Stories providers
final storiesProvider = FutureProvider<List<MockStory>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  return database.getAllStories();
});

final storyProvider = FutureProvider.family<MockStory?, String>((ref, storyId) async {
  final database = ref.read(storyDatabaseProvider);
  return database.getStoryById(storyId);
});

final treeStoriesProvider = FutureProvider.family<List<MockStory>, String>((ref, treeId) async {
  final database = ref.read(storyDatabaseProvider);
  return database.getStoriesByTreeId(treeId);
});

final personStoriesProvider = FutureProvider.family<List<MockStory>, String>((ref, personId) async {
  final database = ref.read(storyDatabaseProvider);
  return database.getStoriesForPerson(personId);
});

final categoryStoriesProvider = FutureProvider.family<List<MockStory>, String>((ref, category) async {
  final database = ref.read(storyDatabaseProvider);
  return database.getStoriesByCategory(category);
});

final tagStoriesProvider = FutureProvider.family<List<MockStory>, String>((ref, tag) async {
  final database = ref.read(storyDatabaseProvider);
  return database.getStoriesByTag(tag);
});

// Story search provider
final storySearchProvider = FutureProvider.family<List<MockStory>, String>((ref, query) async {
  if (query.isEmpty) {
    return [];
  }
  final database = ref.read(storyDatabaseProvider);
  return database.searchStories(query);
});

// Story statistics provider
final storyStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  final stories = database.getAllStories();

  final categories = <String, int>{};
  final tags = <String, int>{};
  var totalLikes = 0;
  var totalComments = 0;

  for (final story in stories) {
    // Count categories
    categories[story.category] = (categories[story.category] ?? 0) + 1;

    // Count tags
    for (final tag in story.tags) {
      tags[tag] = (tags[tag] ?? 0) + 1;
    }

    // Sum likes and comments
    totalLikes += story.likesCount.toInt();
    totalComments += story.commentsCount.toInt();
  }

  return {
    'total': stories.length,
    'totalLikes': totalLikes,
    'totalComments': totalComments,
    'categories': categories,
    'tags': tags,
    'mostLikedStory': stories.isEmpty
        ? null
        : stories.reduce((a, b) => a.likesCount > b.likesCount ? a : b),
    'newestStory': stories.isEmpty
        ? null
        : stories.reduce((a, b) => a.createdAt.isAfter(b.createdAt) ? a : b),
  };
});

// Featured stories provider (recent + popular)
final featuredStoriesProvider = FutureProvider<List<MockStory>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  final allStories = database.getAllStories();

  // Get recent stories (last 30 days)
  final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));
  final recentStories = allStories
      .where((story) => story.createdAt.isAfter(thirtyDaysAgo))
      .toList();

  // Sort by engagement score (likes + comments * 2)
  recentStories.sort((a, b) {
    final scoreA = a.likesCount + (a.commentsCount * 2);
    final scoreB = b.likesCount + (b.commentsCount * 2);
    return scoreB.compareTo(scoreA);
  });

  // Return top 10
  return recentStories.take(10).toList();
});

// Story categories provider
final storyCategoriesProvider = FutureProvider<List<String>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  final stories = database.getAllStories();

  final categories = <String>{};
  for (final story in stories) {
    categories.add(story.category);
  }

  final sortedCategories = categories.toList();
  sortedCategories.sort();
  return sortedCategories;
});

// Popular tags provider
final popularTagsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  final stories = database.getAllStories();

  final tagCounts = <String, int>{};
  for (final story in stories) {
    for (final tag in story.tags) {
      tagCounts[tag] = (tagCounts[tag] ?? 0) + 1;
    }
  }

  final tagsList = tagCounts.entries
      .map((entry) => {'tag': entry.key, 'count': entry.value})
      .toList();

  // Sort by count, then alphabetically
  tagsList.sort((a, b) {
    final countComparison = (b['count'] as int).compareTo(a['count'] as int);
    if (countComparison != 0) return countComparison;
    return (a['tag'] as String).compareTo(b['tag'] as String);
  });

  return tagsList;
});

// Story timeline provider (stories sorted by event date)
final storyTimelineProvider = FutureProvider<List<MockStory>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  final stories = database.getAllStories();

  // Filter stories that have event dates and sort by event date
  final timelineStories = stories
      .where((story) => story.eventDate != null)
      .toList();

  timelineStories.sort((a, b) {
    final dateA = a.eventDate!;
    final dateB = b.eventDate!;
    return dateA.compareTo(dateB); // Oldest first for timeline
  });

  return timelineStories;
});

// Privacy-filtered stories provider
final publicStoriesProvider = FutureProvider<List<MockStory>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  final stories = database.getAllStories();

  return stories.where((story) => story.privacy == 'public').toList();
});

final familyStoriesProvider = FutureProvider<List<MockStory>>((ref) async {
  final database = ref.read(storyDatabaseProvider);
  final stories = database.getAllStories();

  return stories.where((story) =>
    story.privacy == 'public' || story.privacy == 'family'
  ).toList();
});