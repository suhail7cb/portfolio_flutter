import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../image_carousel.dart';

class HomeSection extends StatelessWidget {
  final PersonalInfo personalInfo;
  final Function(String) onNavigate;

  const HomeSection({
    super.key,
    required this.personalInfo,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          constraints: BoxConstraints(
            minHeight: sizingInformation.isMobile ? 600.h : 700.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: sizingInformation.isMobile ? 16.w : 80.w,
            vertical: 40.h,
          ),
          child: sizingInformation.isMobile
              ? _buildMobileLayout(context, l10n)
              : _buildDesktopLayout(context, l10n),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context, AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildContent(context, l10n, false),
        ),
        SizedBox(width: 80.w),
        Expanded(
          flex: 2,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        _buildProfileImage(),
        SizedBox(height: 40.h),
        _buildContent(context, l10n, true),
      ],
    );
  }

  Widget _buildContent(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          personalInfo.name,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 32.sp : 48.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 16.h),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              l10n.mobileDevTitle,
              textStyle: GoogleFonts.inter(
                fontSize: isMobile ? 24.sp : 36.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4285F4),
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          isRepeatingAnimation: true,
          pause: const Duration(seconds: 2),
        ),
        SizedBox(height: 24.h),
        Text(
          personalInfo.description,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14.sp : 18.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _buildPrimaryButton(l10n.viewMyWork, () => onNavigate('projects')),
            SizedBox(width: 16.w),
            _buildSecondaryButton(l10n.downloadResume, () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 500.h, maxWidth: 00.h
      ),
      // width: 400.w,
      // height: 600.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          color: Colors.grey[300],
          child: const AspectRatio(
            aspectRatio: 1,
            child:  ImageCarousel(
              imageNames: [
                'assets/images/profile.jpg',
                'assets/images/profile1.jpg',
                'assets/images/profile2.jpg',
              ],
              autoScrollDuration: Duration(seconds: 3),
              imageFit: BoxFit.cover,// Change scroll speed
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4285F4),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        side: const BorderSide(color: Colors.white54),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}