import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';

abstract class PortfolioDataSource {
  Future<PortfolioData> getPortfolioData();
}

class PortfolioDataSourceImpl implements PortfolioDataSource {
  @override
  Future<PortfolioData> getPortfolioData() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    return const PortfolioData(
      personalInfo: PersonalInfo(
        name: 'Suhail Shabir',
        title: 'Mobile Developer',
        description: 'Experienced Flutter & iOS Developer with over a decade of professional experience in mobile application development. Leading development processes and architecting mobile solutions that enhance user engagement.',
        aboutDescription: 'Passionate about creating mobile experiences that make a difference',
        detailedDescription: 'I am passionate about developing innovative mobile applications and adept at leading development processes to consistently exceed client expectations. I am committed to continuous learning and integrating the latest technologies to stay ahead in the industry.',
        profileImageUrl: 'assets/images/profile.jpg',
        education: 'Bachelor of Computer Applications',
        university: 'Kashmir University (2011-2014)',
        percentage: 'Percentage: 60%',
      ),
      skills: [
        Skill(
          name: 'Flutter',
          description: 'Dart, Cross-platform development, State Management',
          proficiency: 0.9,
          color: '#4285F4',
        ),
        Skill(
          name: 'iOS Development',
          description: 'Swift, SwiftUI, Objective-C, Xcode',
          proficiency: 0.95,
          color: '#34C759',
        ),
        Skill(
          name: 'Android Development',
          description: 'Android Studio, Java, Kotlin',
          proficiency: 0.88,
          color: '#34C759',
        ),
        Skill(
          name: 'Version Control',
          description: 'Git, Code Review Management, Team Collaboration',
          proficiency: 0.85,
          color: '#FF9500',
        ),
        Skill(
          name: 'Database',
          description: 'MySQL, SQLite, Core Data',
          proficiency: 0.8,
          color: '#AF52DE',
        ),
        Skill(
          name: 'Programming',
          description: 'C, C++, Python, Software Architecture Design',
          proficiency: 0.9,
          color: '#FF3B30',
        ),
      ],
      projects: [
        Project(
          name: 'SDS – Slot Delivery Scheduler App',
          description: 'Smart delivery slot scheduling app designed to prevent congestion at retail stores and streamline vendor deliveries. Supports vendors booking slots and store managers tracking deliveries in real-time.',
          imageUrl: 'assets/images/sds_app.jpg',
          technologies: ['Flutter','iOS', 'Scheduling'],
          category: 'Enterprise',
        ),
        Project(
          name: 'Asset Track™',
          description: 'Mobile business workflow app enabling users to view dashboards and manage workflows directly from their device. Features workflow tracking, push alerts, and seamless task management on iPhone and iPad.',
          imageUrl: 'assets/images/asset_track.jpg',
          technologies: ['Flutter','iOS', 'Business'],
          category: 'B2B',
        ),
        Project(
          name: 'DL Wallet™',
          description: 'Secure mobile e-wallet built on blockchain, enabling users to create, fund, and manage both fiat and cryptocurrency accounts. Features QR/NFC payments, real-time transactions, and digital identity management.',
          imageUrl: 'assets/images/dl_wallet.jpg',
          technologies: ['Flutter','iOS','Blockchain', 'Fintech'],
          category: 'Finance',
        ),
        Project(
          name: 'MIA – Translation Service App',
          description: 'Translation service app connecting users with interpreters for real-time language translation through audio or video chat. Supports payment via card or cryptocurrency.',
          imageUrl: 'assets/images/mia_app.jpg',
          technologies: ['iOS', 'Translation'],
          category: 'Communication',
        ),
        Project(
          name: 'ASPENRx Health',
          description: 'Healthcare app connecting pharmacists to community and patients. Provides Comprehensive Medication Review (CMR) and Targeted Medication Review (TMR) through guided phone consultations within the app.',
          imageUrl: 'assets/images/aspenrx.jpg',
          technologies: ['iOS', 'Healthcare'],
          category: 'Healthcare',
        ),
        Project(
          name: 'IBT India',
          description: 'Educational app for India\'s Institute for Banking P.O, Clerical, SSC and Competitive Exams Coaching. Features comprehensive exam preparation and study materials for banking and competitive exams.',
          imageUrl: 'assets/images/ibt_india.jpg',
          technologies: ['iOS', 'Education'],
          category: 'Education',
        ),
        Project(
          name: 'Stridalyzer',
          description: 'Revolutionary running analysis app working with Stridalyzer Smart Insoles. Helps understand running style & form, improve performance, and stay injury-free through advanced biomechanical analysis.',
          imageUrl: 'assets/images/stridalyzer.jpg',
          technologies: ['iOS', 'Health & Fitness'],
          category: 'Sports',
        ),
      ],
      experiences: [
        Experience(
          position: 'Lead Software Engineer',
          company: 'KNNX Services India Private Limited',
          location: 'Noida',
          duration: '02/2019 - Present',
          description: 'Leading Flutter/iOS development. Collaborating with QA, Product Management, and UX Designers. Implementing best practices for coding standards, testing, and debugging procedures to ensure high-quality deliverables.',
        ),
        Experience(
          position: 'Senior Software Engineer',
          company: 'Mobile Programming Pvt Ltd',
          location: 'Gurugram',
          duration: '04/2016 - 01/2019',
          description: 'Developed and maintained scalable iOS applications for various platforms. Managed version control systems and ensured codebase integrity. Researched new technologies and methodologies to propose innovative software solutions.',
        ),
        Experience(
          position: 'Software Engineer',
          company: 'Code Brew Labs',
          location: 'Chandigarh, India',
          duration: '11/2015 - 03/2016',
          description: 'Analyzed user requirements to develop iOS software solutions and created technical specifications. Conducted unit tests on code modules to verify the accuracy and functionality of program logic.',
        ),
        Experience(
          position: 'Jr. Software Engineer',
          company: 'Retisense Private Ltd',
          location: 'Bengaluru, India',
          duration: '02/2015 - 10/2015',
          description: 'Performed debugging and troubleshooting of the existing codebase to implement bug fixes. Started my professional journey in mobile development.',
        ),
      ],
      contactInfo: ContactInfo(
        email: 'suhail7.dev@gmail.com',
        phone: '+91-7006401172',
        location: 'New Delhi, India',
        socialLinks: [
          SocialLink(
            platform: 'LinkedIn',
            url: 'https://linkedin.com/in/suhailshabir',
            iconPath: 'assets/icons/linkedin.svg',
          ),
          SocialLink(
            platform: 'GitHub',
            url: 'https://github.com/suhailshabir',
            iconPath: 'assets/icons/github.svg',
          ),
        ],
      ),
    );
  }
}