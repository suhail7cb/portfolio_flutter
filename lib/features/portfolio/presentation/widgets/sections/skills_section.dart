import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                l10n.technicalExpertise,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 32.sp : 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.skillsDescription,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 14.sp : 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),

              // Skills Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: sizingInformation.isMobile ? 1 : 3,
                  crossAxisSpacing: 24.w,
                  mainAxisSpacing: 24.h,
                  childAspectRatio: sizingInformation.isMobile ? 3 : 2.5,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return _buildSkillCard(skills[index], l10n);
                },
              ),

              SizedBox(height: 60.h),

              // Download Resume Button
              ElevatedButton(
                onPressed: () {},
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
                  l10n.downloadResume,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkillCard(Skill skill, AppLocalizations l10n) {
    Color skillColor = _getColorFromHex(skill.color);

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
            _getLocalizedSkillName(skill.name, l10n),
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            _getLocalizedSkillDescription(skill.name, l10n),
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
          const Spacer(),
          SizedBox(height: 16.h),

          // Progress Bar
          Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: FractionallySizedBox(
              widthFactor: skill.proficiency,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: skillColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getLocalizedSkillName(String skillName, AppLocalizations l10n) {
    switch (skillName) {
      case 'Flutter':
        return l10n.flutter;
      case 'iOS Development':
        return l10n.iosDevTitle;
      case 'Android Development':
        return l10n.androidDevTitle;
      case 'Version Control':
        return l10n.versionControl;
      case 'Database':
        return l10n.database;
      case 'Programming':
        return l10n.programming;
      default:
        return skillName;
    }
  }

  String _getLocalizedSkillDescription(String skillName, AppLocalizations l10n) {
    switch (skillName) {
      case 'Flutter':
        return l10n.flutterDescription;
      case 'iOS Development':
        return l10n.iosDescription;
      case 'Android Development':
        return l10n.androidDescription;
      case 'Version Control':
        return l10n.versionControlDescription;
      case 'Database':
        return l10n.databaseDescription;
      case 'Programming':
        return l10n.programmingDescription;
      default:
        return '';
    }
  }

  Color _getColorFromHex(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (e) {
      return const Color(0xFF4285F4);
    }
  }
}