import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';
import '../../../core/widgets/lux_button.dart';
import '../../../theme/app_theme.dart';
import 'profile_widgets.dart';

typedef EditProfileValues = ({
  String name,
  String phone,
  String driverId,
  String email,
  String vehicle,
  String plate,
});

void showEditProfileSheet({
  required BuildContext context,
  required EditProfileValues initial,
  required void Function(EditProfileValues values) onSave,
}) {
  final r = Responsive(context);
  final nameController = TextEditingController(text: initial.name);
  final phoneController = TextEditingController(text: initial.phone);
  final driverIdController = TextEditingController(text: initial.driverId);
  final emailController = TextEditingController(text: initial.email);
  final vehicleController = TextEditingController(text: initial.vehicle);
  final plateController = TextEditingController(text: initial.plate);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.vertical(top: Radius.circular(r.wp(6))),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(r.wp(5)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHandle(r),
                SizedBox(height: r.hp(2)),
                Text(
                  'Edit profile',
                  style: TextStyle(
                    fontSize: r.sp(18),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: r.hp(2)),
                ProfileFormField(
                  label: 'Full name',
                  controller: nameController,
                  icon: Icons.person_rounded,
                ),
                ProfileFormField(
                  label: 'Phone',
                  controller: phoneController,
                  icon: Icons.phone_rounded,
                  keyboardType: TextInputType.phone,
                ),
                ProfileFormField(
                  label: 'Driver ID',
                  controller: driverIdController,
                  icon: Icons.badge_rounded,
                ),
                ProfileFormField(
                  label: 'Email',
                  controller: emailController,
                  icon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                ),
                ProfileFormField(
                  label: 'Vehicle',
                  controller: vehicleController,
                  icon: Icons.local_shipping_rounded,
                ),
                ProfileFormField(
                  label: 'Plate number',
                  controller: plateController,
                  icon: Icons.numbers_rounded,
                ),
                SizedBox(height: r.hp(2.4)),
                LuxButton(
                  label: 'Save changes',
                  icon: Icons.check_rounded,
                  onPressed: () {
                    Navigator.pop(ctx);
                    onSave((
                      name: nameController.text,
                      phone: phoneController.text,
                      driverId: driverIdController.text,
                      email: emailController.text,
                      vehicle: vehicleController.text,
                      plate: plateController.text,
                    ));
                  },
                ),
                SizedBox(height: r.hp(2)),
              ],
            ),
          ),
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
