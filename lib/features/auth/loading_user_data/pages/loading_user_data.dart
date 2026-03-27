import 'package:apk/core/api/api_error_helper.dart';
import 'package:apk/core/storage/local_storage.dart';
import 'package:apk/core/theme/app_colors.dart';
import 'package:apk/core/theme/app_text_styles.dart';
import 'package:apk/core/widgets/brk_circular_progress_indicator.dart';
import 'package:apk/features/auth/models/user_model.dart';
import 'package:apk/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoadingUserData extends StatefulWidget {
  const LoadingUserData({super.key});

  @override
  State<LoadingUserData> createState() => _LoadingUserDataState();
}

class _LoadingUserDataState extends State<LoadingUserData> {
  final service = AuthService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setUserData();
    });
  }

  Future<void> _setUserData() async {
    try {
      UserModel? user = await LocalStorage.getUser();

      if (user == null) {
        user = await service.getInitialUserData();
        await LocalStorage.setUser(user);
      }
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } catch (e) {
      ApiErrorHelper.handle(
        e,
        defaultMessage: 'Erro ao buscar dados do usuário',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BrkCircularProgressIndicator(size: 28, strokeWidth: 4),
                SizedBox(width: 16),
                Flexible(
                  child: Text(
                    'Carregando informações do usuário',
                    style: AppTextStyles.h4.copyWith(color: AppColors.text50),
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
