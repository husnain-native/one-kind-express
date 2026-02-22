import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/responsive.dart';
import '../../../theme/app_theme.dart';
import 'profile_widgets.dart';

void showProfilePhotoSheet({
  required BuildContext context,
  required void Function(File? image, bool removed) onResult,
}) {
  final r = Responsive(context);
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.bgCard,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(r.wp(6))),
    ),
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: EdgeInsets.all(r.wp(5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHandle(r),
            SizedBox(height: r.hp(2)),
            Text(
              'Profile photo',
              style: TextStyle(
                fontSize: r.sp(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: r.hp(2)),
            PhotoOptionTile(
              icon: Icons.photo_library_rounded,
              label: 'Choose from gallery',
              onTap: () async {
                Navigator.pop(ctx);
                final picker = ImagePicker();
                final xfile = await picker.pickImage(source: ImageSource.gallery);
                if (xfile != null) {
                  onResult(File(xfile.path), false);
                }
              },
            ),
            PhotoOptionTile(
              icon: Icons.camera_alt_rounded,
              label: 'Use camera',
              onTap: () async {
                Navigator.pop(ctx);
                final picker = ImagePicker();
                final xfile = await picker.pickImage(source: ImageSource.camera);
                if (xfile != null) {
                  onResult(File(xfile.path), false);
                }
              },
            ),
            PhotoOptionTile(
              icon: Icons.delete_outline_rounded,
              label: 'Remove picture',
              onTap: () {
                Navigator.pop(ctx);
                onResult(null, true);
              },
            ),
            SizedBox(height: r.hp(2)),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHandle(Responsive r) {
  return Center(
    child: Container(
      width: 40,
      height: 3,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}
