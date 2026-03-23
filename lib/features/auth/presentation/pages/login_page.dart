import 'package:apk/core/theme/app_colors.dart';
import 'package:apk/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/login-bg.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.text50.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/full-logo.png',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 32),
                      LoginForm(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
