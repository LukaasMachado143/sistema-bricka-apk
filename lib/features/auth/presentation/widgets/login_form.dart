import 'package:apk/core/storage/local_storage.dart';
import 'package:apk/core/widgets/brk_button.dart';
import 'package:apk/core/widgets/brk_checkbox.dart';
import 'package:apk/core/widgets/brk_text_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _isLoading = false;
  bool _obscurePassword = true;

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });
    if (_rememberMe == true) {
      await LocalStorage.saveLoginData(
        rememberMe: _rememberMe,
        username: _usernameController.text,
        password: _passwordController.text,
      );
    }

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    final loginData = LocalStorage.getLoginData();
    if (loginData['rememberMe'] == true) {
      _usernameController.text = loginData['username'];
      _passwordController.text = loginData['password'];
      setState(() {
        _rememberMe = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BrkTextField(
          label: 'Usuário',
          controller: _usernameController,
          icon: Icons.person_outline,
          required: true,
          disabled: _isLoading,
        ),
        const SizedBox(height: 16),
        BrkTextField(
          label: 'Senha',
          controller: _passwordController,
          icon: _obscurePassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          obscureText: _obscurePassword,
          onIconPressed: _toggleObscurePassword,
          required: true,
          disabled: _isLoading,
        ),
        const SizedBox(height: 16),
        BrkCheckbox(
          label: 'Lembrar meus dados',
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value ?? false;
            });
          },
        ),
        const SizedBox(height: 24),
        BrkButton(
          title: 'Entrar',
          onPressed: _handleLogin,
          isLoading: _isLoading,
        ),
      ],
    );
  }
}
