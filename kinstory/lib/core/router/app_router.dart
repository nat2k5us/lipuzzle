import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/providers/auth_providers.dart';
import '../../presentation/screens/auth/sign_in_screen.dart';
import '../../presentation/screens/auth/sign_up_screen.dart';
import '../../presentation/screens/auth/email_verification_screen.dart';
import '../../presentation/screens/dashboard/dashboard_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/people/people_screen.dart';
import '../../presentation/screens/people/person_detail_screen.dart';
import '../../presentation/screens/people/person_form_screen.dart';
import '../../presentation/screens/trees/trees_screen.dart';
import '../../presentation/screens/trees/tree_detail_screen.dart';
import '../../presentation/screens/relationships/relationship_form_screen.dart';
import '../../presentation/screens/stories/stories_screen.dart';
import '../../presentation/screens/family_tree_screen.dart';
import '../../presentation/screens/graph_family_tree_screen.dart';
import '../../main.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final currentUser = ref.watch(currentUserProvider); // Primary auth state for demo

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final currentPath = state.uri.path;
      final isAuthenticated = currentUser != null;

      // Debug logging
      print('🧭 ROUTER SIMPLE: path=$currentPath, authenticated=$isAuthenticated');

      // Public routes that don't require authentication
      final publicRoutes = [
        '/',
        '/sign-in',
        '/sign-up',
        '/onboarding',
      ];

      // If authenticated user is on public route, go to dashboard
      if (isAuthenticated && publicRoutes.contains(currentPath)) {
        print('🧭 ROUTER: Authenticated user on public route, redirecting to dashboard');
        return '/dashboard';
      }

      // If not authenticated and trying to access protected route, go to sign-in
      if (!isAuthenticated && !publicRoutes.contains(currentPath)) {
        print('🧭 ROUTER: Unauthenticated user on protected route, redirecting to sign-in');
        return '/sign-in';
      }

      // No redirect needed
      print('🧭 ROUTER: No redirect needed for $currentPath');
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/email-verification',
        builder: (context, state) => const EmailVerificationScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: 'profile',
            builder: (context, state) => const Placeholder(), // ProfileScreen(),
          ),
          GoRoute(
            path: 'trees',
            builder: (context, state) => const TreesScreen(),
          ),
          GoRoute(
            path: 'family-tree',
            builder: (context, state) => const FamilyTreeScreen(),
          ),
          GoRoute(
            path: 'graph-family-tree',
            builder: (context, state) {
              final treeId = state.uri.queryParameters['treeId'] ?? 'demo-tree-123';
              return GraphFamilyTreeScreen(treeId: treeId);
            },
          ),
          GoRoute(
            path: 'tree/:id',
            builder: (context, state) {
              final treeId = state.pathParameters['id']!;
              return TreeDetailScreen(treeId: treeId);
            },
          ),
          GoRoute(
            path: 'stories',
            builder: (context, state) => const StoriesScreen(),
          ),
          GoRoute(
            path: 'people',
            builder: (context, state) => const PeopleScreen(),
          ),
          GoRoute(
            path: 'person/new',
            builder: (context, state) => const PersonFormScreen(),
          ),
          GoRoute(
            path: 'person/:id',
            builder: (context, state) {
              final personId = state.pathParameters['id']!;
              return PersonDetailScreen(personId: personId);
            },
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) {
                  final personId = state.pathParameters['id']!;
                  return PersonFormScreen(personId: personId);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'relationships/new',
            builder: (context, state) {
              final treeId = state.uri.queryParameters['treeId'] ?? '';
              final person1Id = state.uri.queryParameters['person1Id'];
              return RelationshipFormScreen(
                treeId: treeId,
                person1Id: person1Id,
              );
            },
          ),
          GoRoute(
            path: 'relationships/:relationshipId/edit',
            builder: (context, state) {
              final relationshipId = state.pathParameters['relationshipId']!;
              final treeId = state.uri.queryParameters['treeId'] ?? '';
              return RelationshipFormScreen(
                treeId: treeId,
                relationshipId: relationshipId,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const Placeholder(), // SettingsScreen(),
      ),
      GoRoute(
        path: '/help',
        builder: (context, state) => const Placeholder(), // HelpScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
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
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});

// Navigation helper methods
extension AppNavigation on GoRouter {
  void pushAndClearStack(String location) {
    while (canPop()) {
      pop();
    }
    go(location);
  }
}

// Navigation service for dependency injection
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static void showDialog({
    required String title,
    required String content,
    String? primaryAction,
    VoidCallback? onPrimaryAction,
    String? secondaryAction,
    VoidCallback? onSecondaryAction,
  }) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (secondaryAction != null)
            TextButton(
              onPressed: onSecondaryAction ?? () => Navigator.of(context).pop(),
              child: Text(secondaryAction),
            ),
          if (primaryAction != null)
            ElevatedButton(
              onPressed: onPrimaryAction ?? () => Navigator.of(context).pop(),
              child: Text(primaryAction),
            ),
        ],
      ),
    );
  }
}