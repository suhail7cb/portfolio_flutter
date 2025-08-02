import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({
    super.key,
    required this.experiences,
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
                l10n.professionalJourney,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 32.sp : 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.journeyDescription,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 14.sp : 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),

              // Timeline
              _buildTimeline(sizingInformation, l10n),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimeline(SizingInformation sizingInformation, AppLocalizations l10n) {
    return Column(
      children: experiences.asMap().entries.map((entry) {
        final index = entry.key;
        final experience = entry.value;
        final isLast = index == experiences.length - 1;
        final isFirst = index == 0;
        final isEven = index % 2 == 0;

        return _buildTimelineItem(
          experience,
          l10n,
          isFirst,
          isLast,
          sizingInformation.isMobile ? false : isEven,
          sizingInformation.isMobile,
        );
      }).toList(),
    );
  }

  Widget _buildTimelineItem(
      Experience experience,
      AppLocalizations l10n,
      bool isFirst,
      bool isLast,
      bool isLeft,
      bool isMobile,
      ) {
    return Row(
      children: [
        if (!isMobile && !isLeft) ...[
          Expanded(child: Container()),
          SizedBox(width: 24.w),
        ],

        if (!isMobile && isLeft) ...[
          Expanded(
            child: _buildExperienceCard(experience, l10n, CrossAxisAlignment.end),
          ),
          SizedBox(width: 24.w),
        ],

        // Timeline Line and Dot
        Column(
          children: [
            // if (!isFirst)
              Container(
                width: 2.w,
                height: isMobile ? 100.h : 120.h,
                color: isFirst ? Colors.transparent : const Color(0xFF4285F4),
              ),
            Container(
              width: 16.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: const Color(0xFF4285F4),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            // if (!isLast)
              Container(
                width: 2.w,
                height: isMobile ? 150.h : 150.h,
                color: isLast ? Colors.transparent : const Color(0xFF4285F4),
              ),
          ],
        ),

        if (!isMobile && !isLeft) ...[
          SizedBox(width: 24.w),
          Expanded(
            child: _buildExperienceCard(experience, l10n, CrossAxisAlignment.start),
          ),
        ],

        if (!isMobile && isLeft) ...[
          SizedBox(width: 24.w),
          Expanded(child: Container()),
        ],

        if (isMobile) ...[
          SizedBox(width: 24.w),
          Expanded(
            child: _buildExperienceCard(experience, l10n, CrossAxisAlignment.start),
          ),
        ],
      ],
    );
  }

  Widget _buildExperienceCard(
      Experience experience,
      AppLocalizations l10n,
      CrossAxisAlignment alignment,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF252B42),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          // Duration Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFF4285F4).withOpacity(0.2),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              experience.duration,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4285F4),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Position
          Text(
            _getLocalizedPosition(experience.position, l10n),
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: alignment == CrossAxisAlignment.end
                ? TextAlign.end
                : TextAlign.start,
          ),
          SizedBox(height: 8.h),

          // Company and Location
          Text(
            _getLocalizedCompany(experience.company, l10n),
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF34C759),
            ),
            textAlign: alignment == CrossAxisAlignment.end
                ? TextAlign.end
                : TextAlign.start,
          ),
          SizedBox(height: 4.h),
          Text(
            experience.location,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
            textAlign: alignment == CrossAxisAlignment.end
                ? TextAlign.end
                : TextAlign.start,
          ),
          SizedBox(height: 16.h),

          // Description
          Text(
            _getLocalizedDescription(experience.position, l10n),
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: alignment == CrossAxisAlignment.end
                ? TextAlign.end
                : TextAlign.start,
          ),
        ],
      ),
    );
  }

  String _getLocalizedPosition(String position, AppLocalizations l10n) {
    switch (position) {
      case 'Lead Software Engineer':
        return l10n.leadSoftwareEngineer;
      case 'Senior Software Engineer':
        return l10n.seniorSoftwareEngineer;
      case 'Software Engineer':
        return l10n.softwareEngineer;
      case 'Jr. Software Engineer':
        return l10n.jrSoftwareEngineer;
      default:
        return position;
    }
  }

  String _getLocalizedCompany(String company, AppLocalizations l10n) {
    switch (company) {
      case 'KNNX Services India Private Limited':
        return l10n.knnxServices;
      case 'Mobile Programming Pvt Ltd':
        return l10n.mobileProgramming;
      case 'Code Brew Labs':
        return l10n.codeBrewLabs;
      case 'Retisense Private Ltd':
        return l10n.retisense;
      default:
        return company;
    }
  }

  String _getLocalizedDescription(String position, AppLocalizations l10n) {
    switch (position) {
      case 'Lead Software Engineer':
        return l10n.leadEngineerDescription;
      case 'Senior Software Engineer':
        return l10n.seniorEngineerDescription;
      case 'Software Engineer':
        return l10n.engineerDescription;
      case 'Jr. Software Engineer':
        return l10n.jrEngineerDescription;
      default:
        return '';
    }
  }
}