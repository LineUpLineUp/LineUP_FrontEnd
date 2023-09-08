import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Username'),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // 로그인 로직 처리 후 메인 화면으로 이동
                Navigator.pushReplacementNamed(context, "home");
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}