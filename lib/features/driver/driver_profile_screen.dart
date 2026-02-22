import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_card.dart';
import '../../theme/app_theme.dart';
import 'widgets/edit_profile_sheet.dart';
import 'widgets/profile_dialogs.dart';
import 'widgets/profile_photo_sheet.dart';
import 'widgets/profile_widgets.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  String _name = 'Alexander Pierce';
  String _phone = '+1 202 555 0199';
  String _driverId = 'LUX-8421';
  String _email = 'alexander@luxparcel.com';
  String _vehicle = 'Mercedes Sprinter • Black';
  String _plate = 'LUX-4321';
  String _rating = '4.9';

  File? _profileImage;
  bool _photoRemoved = false;

  EditProfileValues get _editValues => (
        name: _name,
        phone: _phone,
        driverId: _driverId,
        email: _email,
        vehicle: _vehicle,
        plate: _plate,
      );

  void _onPhotoResult(File? image, bool removed) {
    if (!mounted) return;
    setState(() {
      _profileImage = image;
      _photoRemoved = removed;
    });
  }

  void _openEditProfile() {
    showEditProfileSheet(
      context: context,
      initial: _editValues,
      onSave: (values) {
        showSaveChangesConfirmation(
          context: context,
          onConfirm: () {
            setState(() {
              _name = values.name;
              _phone = values.phone;
              _driverId = values.driverId;
              _email = values.email;
              _vehicle = values.vehicle;
              _plate = values.plate;
            });
          },
        );
      },
    );
  }

  void _openLogout() {
    showLogoutConfirmation(
      context: context,
      onLogout: () {
        // TODO: clear auth state and navigate to login
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          SizedBox(height: r.hp(1)),
          _buildHeader(r),
          SizedBox(height: r.hp(2.4)),
          _buildProfileSection(r),
          SizedBox(height: r.hp(2.4)),
          _buildContactCard(r),
          SizedBox(height: r.hp(1.6)),
          _buildVehicleCard(r),
          SizedBox(height: r.hp(12)),
          //padding: Padding(padding: EdgeInsets.only(bottom: r.hp(10))),
        ],
      ),
    );
  }

  Widget _buildHeader(Responsive r) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Driver profile',
            style: TextStyle(
              fontSize: r.sp(20),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          onPressed: _openLogout,
          icon: Icon(
            Icons.logout_rounded,
            color: AppColors.gold,
            size: r.sp(24),
          ),
          style: IconButton.styleFrom(
            // backgroundColor: AppColors.bgCard,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection(Responsive r) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => showProfilePhotoSheet(
              context: context,
              onResult: _onPhotoResult,
            ),
            child: Container(
              padding: EdgeInsets.all(r.wp(1.4)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [AppColors.gold, Color(0xFFFFF3C0)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.35),
                    blurRadius: 24,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipOval(
                child: SizedBox(
                  width: r.wp(28),
                  height: r.wp(28),
                  child: _buildProfileImage(r),
                ),
              ),
            ),
          ),
          SizedBox(height: r.hp(1.6)),
          Text(
            _name,
            style: TextStyle(
              fontSize: r.sp(18),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: r.hp(0.6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_rounded, size: r.sp(16), color: AppColors.gold),
              SizedBox(width: r.wp(1)),
              Text(
                '$_rating • Elite partner',
                style: TextStyle(
                  fontSize: r.sp(12),
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(width: r.wp(2)),
              GestureDetector(
                onTap: _openEditProfile,
                child: Container(
                  padding: EdgeInsets.all(r.wp(2)),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.gold.withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Icon(Icons.edit_rounded, size: r.sp(18), color: AppColors.gold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(Responsive r) {
    return LuxCard(
      padding: EdgeInsets.symmetric(
        vertical: r.hp(1.6),
        horizontal: r.wp(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: 'Contact'),
          SizedBox(height: r.hp(0.8)),
          InfoRow(icon: Icons.phone_rounded, label: _phone),
          Divider(height: r.hp(1.6), color: Colors.white.withOpacity(0.08)),
          InfoRow(icon: Icons.badge_rounded, label: 'Driver ID  $_driverId'),
          Divider(height: r.hp(1.6), color: Colors.white.withOpacity(0.08)),
          InfoRow(icon: Icons.email_rounded, label: _email),
        ],
      ),
    );
  }

  Widget _buildVehicleCard(Responsive r) {
    return LuxCard(
      padding: EdgeInsets.symmetric(
        vertical: r.hp(1.6),
        horizontal: r.wp(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: 'Vehicle'),
          SizedBox(height: r.hp(0.8)),
          InfoRow(icon: Icons.local_shipping_rounded, label: _vehicle),
          Divider(height: r.hp(1.6), color: Colors.white.withOpacity(0.08)),
          InfoRow(icon: Icons.numbers_rounded, label: 'Plate $_plate'),
        ],
      ),
    );
  }

  Widget _buildProfileImage(Responsive r) {
    if (_photoRemoved || _profileImage == null) {
      if (_photoRemoved) {
        return Container(
          color: Colors.white.withOpacity(0.06),
          child: Icon(
            Icons.person_rounded,
            size: r.sp(48),
            color: Colors.white,
          ),
        );
      }
      return Image.asset(
        'assets/images/profile.avif',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.white.withOpacity(0.06),
          child: Icon(
            Icons.person_rounded,
            size: r.sp(48),
            color: Colors.white,
          ),
        ),
      );
    }
    return Image.file(_profileImage!, fit: BoxFit.cover);
  }
}
