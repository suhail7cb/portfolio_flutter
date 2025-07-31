Suhail Shabir Portfolio - Flutter Web
A professional portfolio website built with Flutter Web, showcasing mobile development expertise and projects.

Features
Responsive Design: Optimized for both desktop and mobile devices
Clean Architecture: Organized with domain-driven design principles
BLoC State Management: Efficient state management using flutter_bloc
Multilingual Support: Built-in internationalization support
Smooth Animations: Engaging user experience with staggered animations
Modern UI: Contemporary design with dark theme
Contact Form: Functional contact form with validation
SEO Optimized: Proper meta tags and structure for search engines
Tech Stack
Framework: Flutter 3.0+
State Management: BLoC Pattern
Architecture: Clean Architecture
Dependency Injection: GetIt
Internationalization: Flutter Intl
Responsive Design: Responsive Builder & ScreenUtil
Animations: Staggered Animations & Animated Text Kit
Typography: Google Fonts (Inter)
Icons: Font Awesome Flutter
Project Structure
lib/
├── core/
│   ├── di/                 # Dependency Injection
│   └── router/             # App Routing
├── features/
│   └── portfolio/
│       ├── data/
│       │   ├── datasources/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
│               ├── sections/
│               └── shared/
├── l10n/                   # Localization files
└── main.dart
Sections
Hero Section: Introduction with animated text and call-to-action buttons
About Section: Personal information, experience highlights, and education
Skills Section: Technical expertise with proficiency indicators
Projects Section: Featured projects with descriptions and technologies
Experience Section: Professional timeline with detailed descriptions
Contact Section: Contact form and information
Footer: Quick links and services
Getting Started
Prerequisites
Flutter SDK (3.0 or higher)
Dart SDK
Web browser for testing
Installation
Clone the repository:
bash
git clone https://github.com/your-username/portfolio-flutter.git
cd portfolio-flutter
Install dependencies:
bash
flutter pub get
Generate code (if needed):
bash
flutter packages pub run build_runner build
Run the app:
bash
flutter run -d chrome
Building for Production
To build for web deployment:

bash
flutter build web --release
The built files will be in the build/web directory.

Customization
Personal Information
Update the portfolio data in lib/features/portfolio/data/datasources/portfolio_data_source.dart

Styling
Colors and themes can be modified in lib/main.dart
Individual component styles are in their respective widget files
Localization
Add new languages by creating new .arb files in lib/l10n/
Update supported locales in lib/main.dart
Assets
Place your images in assets/images/ and update the pubspec.yaml file accordingly.

Deployment
GitHub Pages
Build the project: flutter build web --base-href "/repository-name/"
Deploy the build/web contents to GitHub Pages
Firebase Hosting
Install Firebase CLI: npm install -g firebase-tools
Login: firebase login
Initialize: firebase init hosting
Build: flutter build web
Deploy: firebase deploy
Netlify
Build: flutter build web
Drag and drop the build/web folder to Netlify
Performance Optimizations
Lazy loading of sections
Optimized images and assets
Efficient state management
Minimal rebuilds with BLoC pattern
Tree shaking for smaller bundle size
Browser Support
Chrome (recommended)
Firefox
Safari
Edge
Contributing
Fork the repository
Create a feature branch
Make your changes
Submit a pull request
License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
Email: suhail7.dev@gmail.com
Phone: +91-7006401172
Location: New Delhi, India
Built with ❤️ using Flutter

# portfolio_flutter
