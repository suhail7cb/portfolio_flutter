import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomAppBar extends StatelessWidget {
  final Function(String) onNavigate;
  final String activeSection;

  const CustomAppBar({
    super.key,
    required this.onNavigate,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sizingInformation.isMobile ? 16.w : 80.w,
            vertical: 3.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Text(
                'Suhail Shabir',
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 20.sp : 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4285F4),
                ),
              ),

              // Navigation Menu
              if (sizingInformation.isMobile)
                _buildMobileMenu(context)
              else
                _buildDesktopMenu(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopMenu(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final menuItems = [
      ('home', l10n.home),
      ('about', l10n.about),
      ('skills', l10n.skills),
      ('projects', l10n.projects),
      ('experience', l10n.experience),
      ('contact', l10n.contact),
    ];

    return Row(
      children: menuItems.map((item) {
        final isActive = activeSection == item.$1;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextButton(
            onPressed: () => onNavigate(item.$1),
            child: Text(
              item.$2,
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? const Color(0xFF4285F4) : Colors.white,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: Colors.white),
      onPressed: () => _showMobileMenu(context),
    );
  }

  void _showMobileMenu(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final menuItems = [
      ('home', l10n.home),
      ('about', l10n.about),
      ('skills', l10n.skills),
      ('projects', l10n.projects),
      ('experience', l10n.experience),
      ('contact', l10n.contact),
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1F36),
      builder: (context) => Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: menuItems.map((item) {
            final isActive = activeSection == item.$1;
            return ListTile(
              title: Text(
                item.$2,
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive ? const Color(0xFF4285F4) : Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                onNavigate(item.$1);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}