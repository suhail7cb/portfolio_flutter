import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/local_asset_image.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutSection extends StatelessWidget {
  final PersonalInfo personalInfo;

  const AboutSection({
    super.key,
    required this.personalInfo,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sizingInformation.isMobile ? 16.w : 80.w,
            vertical: 80.h,
          ),
          child: Column(
            children: [
              // Section Header
              Text(
                l10n.aboutMe,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 32.sp : 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.aboutDescription,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 14.sp : 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),

              // Content
              sizingInformation.isMobile
                  ? _buildMobileLayout(context, l10n)
                  : _buildDesktopLayout(context, l10n),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context, AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildMobileAppImage(),
        ),
        SizedBox(width: 80.w),
        Expanded(
          flex: 3,
          child: _buildAboutContent(context, l10n, false),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        _buildMobileAppImage(),
        SizedBox(height: 40.h),
        _buildAboutContent(context, l10n, true),
      ],
    );
  }

  Widget _buildMobileAppImage() {
    return Container(
      // height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white.withOpacity(0.05),
      ),
      child: Center(
        child: Container(
          // width: 200.w,
          // height: 350.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.grey[800],
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              color: Colors.grey[300],
              //mobile_app_image.jpg
              child: const LocalAssetImage(
                imageName: 'assets/images/mobile_app_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          l10n.leadMobileDeveloper,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 24.sp : 32.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 24.h),
        Text(
          l10n.aboutDetailDescription,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14.sp : 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 16.h),
        Text(
          personalInfo.detailedDescription,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14.sp : 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 40.h),

        // Stats and Education
        isMobile
            ? Column(
          children: [
            _buildStatsCard(l10n),
            SizedBox(height: 24.h),
            _buildEducationCard(l10n),
          ],
        )
            : Row(
          children: [
            Expanded(child: _buildStatsCard(l10n)),
            SizedBox(width: 24.w),
            Expanded(child: _buildEducationCard(l10n)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsCard(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF252B42),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '10+',
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4285F4),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                l10n.yearsExperience,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                l10n.lead,
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF34C759),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                l10n.developer,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF252B42),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.education,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4285F4),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            personalInfo.education,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            personalInfo.university,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            personalInfo.percentage,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}