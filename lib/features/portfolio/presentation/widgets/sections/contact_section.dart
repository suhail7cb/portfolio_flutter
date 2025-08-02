import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  final ContactInfo contactInfo;

  const ContactSection({
    super.key,
    required this.contactInfo,
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedProjectType = '';

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
                l10n.letsWorkTogether,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 32.sp : 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.workTogetherDescription,
                style: GoogleFonts.inter(
                  fontSize: sizingInformation.isMobile ? 14.sp : 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),

              // Contact Content
              sizingInformation.isMobile
                  ? _buildMobileLayout(l10n)
                  : _buildDesktopLayout(l10n),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildContactInfo(l10n),
        ),
        SizedBox(width: 80.w),
        Expanded(
          flex: 3,
          child: _buildContactForm(l10n),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(AppLocalizations l10n) {
    return Column(
      children: [
        _buildContactForm(l10n),
        SizedBox(height: 40.h),
        _buildContactInfo(l10n),
      ],
    );
  }

  Widget _buildContactInfo(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.getInTouch,
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 32.h),

        // Email
        _buildContactItem(
          icon: Icons.email,
          iconColor: const Color(0xFF4285F4),
          title: l10n.email,
          value: widget.contactInfo.email,
          onTap: () => _launchEmail(widget.contactInfo.email),
        ),
        SizedBox(height: 24.h),

        // Phone
        _buildContactItem(
          icon: Icons.phone,
          iconColor: const Color(0xFF34C759),
          title: l10n.phone,
          value: widget.contactInfo.phone,
          onTap: () => _launchPhone(widget.contactInfo.phone),
        ),
        SizedBox(height: 24.h),

        // Location
        _buildContactItem(
          icon: Icons.location_on,
          iconColor: const Color(0xFFAF52DE),
          title: l10n.location,
          value: widget.contactInfo.location,
          onTap: null,
        ),
        SizedBox(height: 40.h),

        // Social Links
        Text(
          l10n.followMe,
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: widget.contactInfo.socialLinks.map((link) {
            return Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                onTap: () => _launchUrl(link.url),
                child: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF252B42),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Icon(
                    link.platform == 'LinkedIn' ? Icons.business : Icons.code,
                    color: Colors.white70,
                    size: 24.sp,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(AppLocalizations l10n) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          color: const Color(0xFF252B42),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            // First Name and Last Name
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    controller: _firstNameController,
                    label: l10n.firstName,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildFormField(
                    controller: _lastNameController,
                    label: l10n.lastName,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Email
            _buildFormField(
              controller: _emailController,
              label: l10n.email,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),

            // Project Type Dropdown
            _buildDropdownField(l10n),
            SizedBox(height: 24.h),

            // Message
            _buildFormField(
              controller: _messageController,
              label: l10n.message,
              maxLines: 5,
              hintText: l10n.tellAboutProject,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            SizedBox(height: 32.h),

            // Send Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4285F4),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  l10n.sendMessage,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              color: Colors.white54,
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: const Color(0xFF3A4056),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildDropdownField(AppLocalizations l10n) {
    final projectTypes = [
      'iOS App Development',
      'Flutter Development',
      'App Consulting',
      'UI/UX Design',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.projectType,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: _selectedProjectType.isEmpty ? null : _selectedProjectType,
          decoration: InputDecoration(
            hintText: l10n.selectProjectType,
            hintStyle: GoogleFonts.inter(
              color: Colors.white54,
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: const Color(0xFF3A4056),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          dropdownColor: const Color(0xFF3A4056),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14.sp,
          ),
          items: projectTypes.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedProjectType = value ?? '';
            });
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please select a project type';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent successfully!'),
          backgroundColor: Color(0xFF34C759),
        ),
      );

      // Clear form
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _messageController.clear();
      setState(() {
        _selectedProjectType = '';
      });
    }
  }

  void _launchEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}