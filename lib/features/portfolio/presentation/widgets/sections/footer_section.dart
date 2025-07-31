import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sizingInformation.isMobile ? 16.w : 80.w,
            vertical: 40.h,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF252B42),
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: sizingInformation.isMobile
              ? _buildMobileLayout(l10n)
              : _buildDesktopLayout(l10n),
        );
      },
    );
  }

  Widget _buildDesktopLayout(AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand Section
        Expanded(
          flex: 2,
          child: _buildBrandSection(l10n),
        ),
        SizedBox(width: 80.w),

        // Quick Links
        Expanded(
          child: _buildQuickLinks(l10n),
        ),
        SizedBox(width: 40.w),

        // Services
        Expanded(
          child: _buildServices(l10n),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandSection(l10n),
        SizedBox(height: 32.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildQuickLinks(l10n)),
            SizedBox(width: 24.w),
            Expanded(child: _buildServices(l10n)),
          ],
        ),
        SizedBox(height: 32.h),
        _buildCopyright(l10n),
      ],
    );
  }

  Widget _buildBrandSection(AppLocalizations l10n,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suhail Shabir',
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF4285F4),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Mobile Developer crafting exceptional iOS and Flutter applications with passion and precision.',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.5,
          ),
        ),

        // if (ResponsiveBuilder.of(context).isMobile) ...[
        //   SizedBox(height: 24.h),
        // ] else
          ...[
          SizedBox(height: 32.h),
          _buildCopyright(l10n),
        ],
      ],
    );
  }

  Widget _buildQuickLinks(AppLocalizations l10n) {
    final quickLinks = [
      (l10n.about, 'about'),
      (l10n.skills, 'skills'),
      (l10n.projects, 'projects'),
      (l10n.contact, 'contact'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.quickLinks,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        ...quickLinks.map((link) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: GestureDetector(
              onTap: () {
                // Handle navigation
              },
              child: Text(
                link.$1,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildServices(AppLocalizations l10n) {
    final services = [
      l10n.iosAppDevelopment,
      l10n.flutterDevelopment,
      l10n.appConsulting,
      l10n.uiuxDesign,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.services,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        ...services.map((service) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              service,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildCopyright(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.only(top: 24.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Text(
        '© 2025 Suhail Shabir. ${l10n.allRightsReserved}.',
        style: GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white54,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}