import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

void showSaveChangesConfirmation({
  required BuildContext context,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.bgCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        'Save changes?',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Text(
        'Are you sure you want to save these changes?',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text('No', style: TextStyle(color: AppColors.textSecondary)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
            onConfirm();
          },
          child: Text(
            'Yes',
            style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

void showLogoutConfirmation({
  required BuildContext context,
  required VoidCallback onLogout,
}) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.bgCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        'Log out?',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Text(
        'Are you sure you want to log out?',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
            onLogout();
          },
          child: Text(
            'Log out',
            style: TextStyle(
              color: AppColors.danger,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
