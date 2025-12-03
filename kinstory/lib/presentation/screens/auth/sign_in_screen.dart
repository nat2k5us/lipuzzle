import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../../providers/auth_providers.dart';
// import '../../widgets/auth/social_login_buttons.dart'; // Commented out due to asset issues
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/common/loading_overlay.dart';
import '../../../data/datasources/local/mock_database.dart'; // For MockTree type

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'demo@mahabharata.com');
  final _passwordController = TextEditingController(text: 'Krishna123!');
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmail() async {
    print('🔑 DEMO LOGIN: _signInWithEmail called');
    print('🔑 Email: "${_emailController.text.trim()}"');
    print('🔑 Password: "${_passwordController.text}"');

    if (!_formKey.currentState!.validate()) {
      print('❌ Form validation failed');
      return;
    }

    // Demo account bypass
    if (_emailController.text.trim() == 'demo@mahabharata.com' &&
        _passwordController.text == 'Krishna123!') {
      print('✅ DEMO BYPASS: Credentials match, starting demo bypass');
      try {
        print('🗄️ Getting mock database provider...');
        final database = ref.read(databaseProvider);
        print('🗄️ Mock database provider obtained: $database');

        print('📋 Demo data already initialized in MockDatabase...');
        print('✅ Demo data available');

        print('👤 Setting demo user in auth state...');
        final userNotifier = ref.read(currentUserProvider.notifier);
        print('👤 User notifier obtained: $userNotifier');

        print('🎭 Creating fake demo user...');
        final demoUser = _createDemoUser();
        print('🎭 Demo user created: ${demoUser.email}');

        print('💾 Setting user state...');
        userNotifier.state = demoUser;
        print('✅ User state set successfully');

        print('🧭 Navigating to dashboard...');
        context.go('/dashboard');
        print('✅ Navigation completed');
        return;
      } catch (e, stackTrace) {
        print('❌ DEMO ERROR: $e');
        print('❌ STACK TRACE: $stackTrace');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Demo initialization failed: $e',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.red.shade600,
            duration: const Duration(seconds: 5),
          ),
        );
        return;
      }
    }

    final authController = ref.read(authControllerProvider.notifier);
    await authController.signInWithEmail(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  Future<void> _createDemoData(dynamic database) async {
    print('📊 _createDemoData started');
    try {
      // Quick demo data creation - simplified version
      final now = DateTime.now();
      print('📊 Current time: $now');

      print('🔍 Checking if demo data already exists...');
      print('🔍 Database: $database');
      print('🔍 Trees table: ${database.treesTable}');

      // Check if demo data already exists
      final existingTrees = await database.select(database.treesTable).get();
      print('🔍 Found ${existingTrees.length} existing trees');

      MockTree? existingTree;
      try {
        existingTree = existingTrees.firstWhere(
          (tree) => tree.name == 'The Mahabharata Dynasty',
        );
      } catch (e) {
        existingTree = null; // No tree found with that name
      }

      print('🔍 Existing tree query result: $existingTree');

      if (existingTree == null) {
        print('➕ No existing tree found, creating demo tree...');
        // Create minimal demo tree
        await database.into(database.treesTable).insert({
          'id': 'demo-tree-123',
          'name': 'The Mahabharata Dynasty',
          'description': 'The legendary family tree from the Hindu epic Mahabharata',
          'ownerId': 'demo-user-123',
          'visibility': 'public',
          'settings': '{}',
          'createdAt': now,
          'updatedAt': now,
        });
        print('✅ Demo tree created successfully');
      } else {
        print('ℹ️ Demo tree already exists, skipping creation');
      }
      print('📊 _createDemoData completed successfully');
    } catch (e, stackTrace) {
      print('❌ ERROR in _createDemoData: $e');
      print('❌ STACK TRACE: $stackTrace');
      rethrow;
    }
  }

  supabase.User _createDemoUser() {
    // Create a demo user object for bypass authentication
    return supabase.User(
      id: 'demo-user-123',
      appMetadata: const {
        'provider': 'demo',
        'providers': ['demo'],
      },
      userMetadata: const {
        'first_name': 'Veda',
        'last_name': 'Vyasa',
        'display_name': 'Veda Vyasa',
      },
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
      email: 'demo@mahabharata.com',
      emailConfirmedAt: DateTime.now().toIso8601String(),
    );
  }

  Future<void> _signInWithGoogle() async {
    final authController = ref.read(authControllerProvider.notifier);
    await authController.signInWithGoogle();
  }

  Future<void> _signInWithApple() async {
    final authController = ref.read(authControllerProvider.notifier);
    await authController.signInWithApple();
  }

  void _showResetPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => _ResetPasswordDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    // Listen to auth state changes
    ref.listen<AsyncValue<dynamic>>(authControllerProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            // Navigate to main app
            context.go('/dashboard');
          }
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              backgroundColor: Colors.red.shade600,
              duration: const Duration(seconds: 5),
            ),
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: LoadingOverlay(
        isLoading: authState.isLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Logo
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.family_restroom,
                    color: Colors.white,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 24),

                // Title
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Sign in to continue your family story',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 48),

                // Sign in form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email field
                      CustomTextField(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Email is required';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value!)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Password field
                      CustomTextField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Enter your password',
                        obscureText: !_isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Remember me and forgot password
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                activeColor: Colors.teal,
                              ),
                              const Text('Remember me'),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: _showResetPasswordDialog,
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Sign in button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _signInWithEmail,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 8,
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Demo account info
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.teal.shade200),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.info_outline, color: Colors.teal.shade600),
                            const SizedBox(height: 8),
                            Text(
                              'Demo Account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Email: demo@mahabharata.com\nPassword: Krishna123!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.teal.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Sign up link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          TextButton(
                            onPressed: () => context.go('/sign-up'),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResetPasswordDialog extends ConsumerStatefulWidget {
  @override
  ConsumerState<_ResetPasswordDialog> createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends ConsumerState<_ResetPasswordDialog> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final authController = ref.read(authControllerProvider.notifier);
      await authController.resetPassword(_emailController.text.trim());

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Password reset email sent! Check your inbox.',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.red.shade600,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset Password'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Email is required';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _resetPassword,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Send Reset Email'),
        ),
      ],
    );
  }
}