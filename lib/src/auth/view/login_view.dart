import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../vm/login_vm.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: vm.usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) {
                vm.setUsername(value);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Username updated: $value'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            TextField(
              controller: vm.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: false,
              onChanged: (value) {
                vm.setPassword(value);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Password updated'),
                    duration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            // Add further UI elements as needed
          ],
        ),
      ),
    );
  }
}
