// Signup Screen
import 'package:flutter/material.dart';
import 'auth_provider.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authProvider.signUp(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text('Create Account'),
            ),
            if (authProvider.error != null)
              Text(authProvider.error!, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
