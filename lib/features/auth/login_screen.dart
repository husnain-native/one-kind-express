import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_button.dart';
import '../../theme/app_theme.dart';
import '../../routing/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF111111)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: r.wp(8),
              vertical: r.hp(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: r.hp(4)),
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    fontSize: r.sp(18),
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: r.hp(0.8)),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: r.sp(24),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: r.hp(5)),
                Container(
                  padding: EdgeInsets.all(r.wp(5)),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 40,
                        offset: const Offset(0, 24),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _LuxTextField(
                        label: 'Email',
                        hint: 'you@example.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: r.hp(2.4)),
                      _LuxTextField(
                        label: 'Password',
                        hint: '••••••••',
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: r.hp(1.6)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: AppColors.gold,
                              fontSize: r.sp(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: r.hp(1.6)),
                      LuxButton(
                        label: 'Login',
                        icon: Icons.near_me_rounded,
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.dashboard);
                        },
                      ),
                      SizedBox(height: r.hp(2.4)),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white.withOpacity(0.06),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: r.wp(3),
                            ),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: r.sp(11),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white.withOpacity(0.06),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: r.hp(2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialCircle(icon: Icons.apple),
                          SizedBox(width: r.wp(4)),
                          _SocialCircle(icon: Icons.g_mobiledata_rounded),
                        ],
                      ),
                    ],
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

class _LuxTextField extends StatelessWidget {
  const _LuxTextField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: r.sp(12),
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: r.hp(0.8)),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white.withOpacity(0.02),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.18),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: AppColors.gold,
                width: 1.6,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: r.hp(1.5),
              horizontal: r.wp(4),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  const _SocialCircle({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    return Container(
      width: r.wp(10),
      height: r.wp(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.04),
        border: Border.all(
          color: Colors.white.withOpacity(0.16),
        ),
      ),
      child: Icon(icon, size: r.sp(20)),
    );
  }
}

