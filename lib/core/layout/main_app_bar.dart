import 'package:apk/core/theme/app_colors.dart';
import 'package:apk/core/theme/app_text_styles.dart';
import 'package:apk/features/auth/models/user_model.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final UserModel? user;
  final VoidCallback onLogout;

  const MainAppBar({super.key, required this.user, required this.onLogout});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    final surname = widget.user?.surname ?? '...';
    final image = widget.user?.image;
    return AppBar(
      backgroundColor: AppColors.background,
      title: Row(
        children: [
          // 🔹 Avatar do usuário
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: image != null && image.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(image, fit: BoxFit.cover),
                  )
                : const Icon(Icons.person),
          ),

          const SizedBox(width: 10),

          Text(
            surname,
            style: AppTextStyles.body.copyWith(color: AppColors.primary),
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: widget.onLogout,
          icon: const Icon(Icons.logout, color: AppColors.primary),
        ),
      ],
    );
  }
}
