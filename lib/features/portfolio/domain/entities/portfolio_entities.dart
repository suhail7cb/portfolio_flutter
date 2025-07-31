import 'package:equatable/equatable.dart';

class PortfolioData extends Equatable {
  final PersonalInfo personalInfo;
  final List<Skill> skills;
  final List<Project> projects;
  final List<Experience> experiences;
  final ContactInfo contactInfo;

  const PortfolioData({
    required this.personalInfo,
    required this.skills,
    required this.projects,
    required this.experiences,
    required this.contactInfo,
  });

  @override
  List<Object?> get props => [personalInfo, skills, projects, experiences, contactInfo];
}

class PersonalInfo extends Equatable {
  final String name;
  final String title;
  final String description;
  final String aboutDescription;
  final String detailedDescription;
  final String profileImageUrl;
  final String education;
  final String university;
  final String percentage;

  const PersonalInfo({
    required this.name,
    required this.title,
    required this.description,
    required this.aboutDescription,
    required this.detailedDescription,
    required this.profileImageUrl,
    required this.education,
    required this.university,
    required this.percentage,
  });

  @override
  List<Object?> get props => [
    name,
    title,
    description,
    aboutDescription,
    detailedDescription,
    profileImageUrl,
    education,
    university,
    percentage,
  ];
}

class Skill extends Equatable {
  final String name;
  final String description;
  final double proficiency;
  final String color;

  const Skill({
    required this.name,
    required this.description,
    required this.proficiency,
    required this.color,
  });

  @override
  List<Object?> get props => [name, description, proficiency, color];
}

class Project extends Equatable {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String category;

  const Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.category,
  });

  @override
  List<Object?> get props => [name, description, imageUrl, technologies, category];
}

class Experience extends Equatable {
  final String position;
  final String company;
  final String location;
  final String duration;
  final String description;

  const Experience({
    required this.position,
    required this.company,
    required this.location,
    required this.duration,
    required this.description,
  });

  @override
  List<Object?> get props => [position, company, location, duration, description];
}

class ContactInfo extends Equatable {
  final String email;
  final String phone;
  final String location;
  final List<SocialLink> socialLinks;

  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
    required this.socialLinks,
  });

  @override
  List<Object?> get props => [email, phone, location, socialLinks];
}

class SocialLink extends Equatable {
  final String platform;
  final String url;
  final String iconPath;

  const SocialLink({
    required this.platform,
    required this.url,
    required this.iconPath,
  });

  @override
  List<Object?> get props => [platform, url, iconPath];
}