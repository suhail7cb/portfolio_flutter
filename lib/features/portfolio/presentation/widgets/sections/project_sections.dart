import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/local_asset_image.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const ProjectsSection({
    super.key,
    required this.projects,
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
                l10n.featuredProjects,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 32.sp : 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.projectsDescription,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 14.sp : 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),

              // Projects Grid
              _buildProjectsGrid(sizingInformation, l10n),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectsGrid(SizingInformation sizingInformation, AppLocalizations l10n) {
    if (sizingInformation.isMobile) {
      return Column(
        children: projects.map((project) => Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: _buildProjectCard(project, l10n, true),
        )).toList(),
      );
    }

    return Column(
      children: [
        // First row - 3 projects
        Row(
          children: projects.take(3).map((project) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: _buildProjectCard(project, l10n, false),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 24.h),

        // Second row - 3 projects
        Row(
          children: projects.skip(3).take(3).map((project) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: _buildProjectCard(project, l10n, false),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 24.h),

        // Third row - 1 project centered
        if (projects.length > 6)
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: _buildProjectCard(projects[6], l10n, false),
              ),
              const Spacer(),
            ],
          ),
      ],
    );
  }

  Widget _buildProjectCard(Project project, AppLocalizations l10n, bool isMobile) {
    return Container(
      height: isMobile ? 320.h : 400.h,
      decoration: BoxDecoration(
        color: const Color(0xFF252B42),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image Placeholder
          Container(
            height: isMobile ? 160.h : 200.h,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child:  Center(
              child: LocalAssetImage(
                imageName: project.imageUrl, // Just the file name
                // imageName: 'profile.jpg', // Just the file name
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Project Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Technology Tags
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 4.h,
                    children: project.technologies.map((tech) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: _getTechColor(tech),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          tech,
                          style: GoogleFonts.inter(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 12.h),

                  // Project Title
                  Text(
                    _getLocalizedProjectName(project.name, l10n),
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 16.sp : 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  // Project Description
                  Expanded(
                    child: Text(
                      _getLocalizedProjectDescription(project.name, l10n),
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 12.sp : 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                        height: 1.4,
                      ),
                      maxLines: isMobile ? 4 : 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Category Badge
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      _getLocalizedCategory(project.category, l10n),
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getTechColor(String tech) {
    switch (tech.toLowerCase()) {
      case 'flutter':
        return const Color(0xFF02569B);
      case 'ios':
        return const Color(0xFF007AFF);
      case 'blockchain':
        return const Color(0xFFF7931A);
      case 'fintech':
        return const Color(0xFF00D4AA);
      case 'healthcare':
        return const Color(0xFF8E44AD);
      case 'education':
        return const Color(0xFFE74C3C);
      default:
        return const Color(0xFF34495E);
    }
  }

  String _getLocalizedProjectName(String projectName, AppLocalizations l10n) {
    switch (projectName) {
      case 'SDS – Slot Delivery Scheduler App':
        return l10n.sdsApp;
      case 'Asset Track™':
        return l10n.assetTrack;
      case 'DL Wallet™':
        return l10n.dlWallet;
      case 'MIA – Translation Service App':
        return l10n.miaApp;
      case 'ASPENRx Health':
        return l10n.aspenrxHealth;
      case 'IBT India':
        return l10n.ibtIndia;
      case 'Stridalyzer':
        return l10n.stridalyzer;
      default:
        return projectName;
    }
  }

  String _getLocalizedProjectDescription(String projectName, AppLocalizations l10n) {
    switch (projectName) {
      case 'SDS – Slot Delivery Scheduler App':
        return l10n.sdsDescription;
      case 'Asset Track™':
        return l10n.assetTrackDescription;
      case 'DL Wallet™':
        return l10n.dlWalletDescription;
      case 'MIA – Translation Service App':
        return l10n.miaDescription;
      case 'ASPENRx Health':
        return l10n.aspenrxDescription;
      case 'IBT India':
        return l10n.ibtDescription;
      case 'Stridalyzer':
        return l10n.stridalyzerDescription;
      default:
        return '';
    }
  }

  String _getLocalizedCategory(String category, AppLocalizations l10n) {
    switch (category) {
      case 'Enterprise':
        return l10n.enterprise;
      case 'B2B':
        return l10n.b2b;
      case 'Finance':
        return l10n.finance;
      case 'Communication':
        return l10n.communication;
      case 'Healthcare':
        return l10n.healthcare;
      case 'Education':
        return l10n.education;
      case 'Sports':
        return l10n.sports;
      default:
        return category;
    }
  }
}