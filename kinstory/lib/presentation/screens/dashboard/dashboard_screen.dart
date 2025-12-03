import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_providers.dart';
import '../../providers/person_providers.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _selectedIndex = 0;

  final List<DashboardItem> _items = [
    DashboardItem(
      title: 'Family Trees',
      icon: Icons.account_tree,
      color: Colors.teal,
      description: 'View and manage your family trees',
    ),
    DashboardItem(
      title: 'People',
      icon: Icons.people,
      color: Colors.blue,
      description: 'Manage family members and their profiles',
    ),
    DashboardItem(
      title: 'Stories',
      icon: Icons.auto_stories,
      color: Colors.orange,
      description: 'Share and preserve family memories',
    ),
    DashboardItem(
      title: 'Photos & Media',
      icon: Icons.photo_library,
      color: Colors.purple,
      description: 'Organize family photos and videos',
    ),
    DashboardItem(
      title: 'Timeline',
      icon: Icons.timeline,
      color: Colors.green,
      description: 'Explore your family history chronologically',
    ),
    DashboardItem(
      title: 'Collaboration',
      icon: Icons.group_work,
      color: Colors.red,
      description: 'Work together with family members',
    ),
    DashboardItem(
      title: 'Krishna Tree',
      icon: Icons.auto_awesome,
      color: Colors.deepPurple,
      description: 'Explore the divine Krishna family lineage',
    ),
  ];

  void _signOut() async {
    print('🚪 SIGN OUT: Starting sign out process');

    try {
      // Clear demo user state
      final currentUserNotifier = ref.read(currentUserProvider.notifier);
      currentUserNotifier.state = null;
      print('✅ SIGN OUT: Demo user cleared');

      // Also clear Supabase auth state in case there's a real user
      final authController = ref.read(authControllerProvider.notifier);
      await authController.signOut();
      print('✅ SIGN OUT: Supabase auth cleared');

      if (mounted) {
        print('🧭 SIGN OUT: Navigating to sign-in');
        context.go('/');
      }
    } catch (e) {
      print('❌ SIGN OUT ERROR: $e');
      // Even if there's an error, try to navigate to sign-in
      if (mounted) {
        context.go('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final personStats = ref.watch(personStatsProvider);
    // DISABLED: Local user provider - using current user directly for UI testing
    // final localUser = currentUser != null
    //     ? ref.watch(localUserProvider(currentUser.id))
    //     : const AsyncValue<dynamic>.data(null);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'KinStory',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'profile':
                  context.go('/dashboard/profile');
                  break;
                case 'settings':
                  context.go('/settings');
                  break;
                case 'help':
                  context.go('/help');
                  break;
                case 'sign_out':
                  _signOut();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'help',
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'sign_out',
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out', style: TextStyle(color: Colors.red)),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.teal.shade100,
                child: currentUser?.userMetadata?['avatar_url'] != null
                    ? ClipOval(
                        child: Image.network(
                          currentUser!.userMetadata!['avatar_url'],
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : currentUser?.userMetadata != null
                        ? Text(
                            '${currentUser!.userMetadata!['first_name']?.substring(0, 1) ?? ''}${currentUser.userMetadata!['last_name']?.substring(0, 1) ?? ''}'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Icon(Icons.person, color: Colors.teal),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade600, Colors.teal.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, ${currentUser?.userMetadata?['first_name'] ?? 'User'}! 👋',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Continue building your family story',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Quick stats
            Row(
              children: [
                Expanded(
                  child: _QuickStatCard(
                    title: 'Family Members',
                    value: '${personStats['total'] ?? 0}',
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _QuickStatCard(
                    title: 'Stories Shared',
                    value: '0',
                    icon: Icons.auto_stories,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Feature grid
            const Text(
              'What would you like to do?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return _DashboardCard(
                  item: item,
                  onTap: () {
                    // Navigate to specific feature
                    if (item.title == 'People') {
                      context.go('/dashboard/people');
                    } else if (item.title == 'Family Trees') {
                      context.go('/dashboard/trees');
                    } else if (item.title == 'Stories') {
                      context.go('/dashboard/stories');
                    } else if (item.title == 'Krishna Tree') {
                      context.go('/dashboard/family-tree');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.title} feature coming soon!'),
                          backgroundColor: item.color,
                        ),
                      );
                    }
                  },
                );
              },
            ),

            const SizedBox(height: 32),

            // Recent activity
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.history,
                      size: 48,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No recent activity',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start by creating your first family tree!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final DashboardItem item;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item.icon,
                color: item.color,
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _QuickStatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  DashboardItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  });
}