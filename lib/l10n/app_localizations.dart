import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with Localizations.of<AppLocalizations>(context, AppLocalizations).
///
/// {@template app_localizations}
/// Lookups for the application
/// {@endtemplate}
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    // Locale('hi'),
    //Add other locales
  ];

  // Navigation
  String get home;
  String get about;
  String get skills;
  String get projects;
  String get experience;
  String get contact;

  // Hero Section
  String get mobileDevTitle;
  String get heroDescription;
  String get viewMyWork;
  String get downloadResume;

  // About Section
  String get aboutMe;
  String get aboutDescription;
  String get leadMobileDeveloper;
  String get aboutDetailDescription;
  String get aboutSecondDescription;
  String get yearsExperience;
  String get lead;
  String get developer;

  // Education
  String get education;
  String get bachelorDegree;
  String get university;
  String get percentage;

  // Skills Section
  String get technicalExpertise;
  String get skillsDescription;
  String get flutter;
  String get flutterDescription;
  String get iosDevTitle;
  String get iosDescription;
  String get androidDevTitle;
  String get androidDescription;
  String get versionControl;
  String get versionControlDescription;
  String get database;
  String get databaseDescription;
  String get programming;
  String get programmingDescription;

  // Projects Section
  String get featuredProjects;
  String get projectsDescription;
  String get sdsApp;
  String get sdsDescription;
  String get assetTrack;
  String get assetTrackDescription;
  String get dlWallet;
  String get dlWalletDescription;
  String get miaApp;
  String get miaDescription;
  String get aspenrxHealth;
  String get aspenrxDescription;
  String get ibtIndia;
  String get ibtDescription;
  String get stridalyzer;
  String get stridalyzerDescription;

  // Experience Section
  String get professionalJourney;
  String get journeyDescription;
  String get leadSoftwareEngineer;
  String get knnxServices;
  String get leadEngineerDescription;
  String get seniorSoftwareEngineer;
  String get mobileProgramming;
  String get seniorEngineerDescription;
  String get softwareEngineer;
  String get codeBrewLabs;
  String get engineerDescription;
  String get jrSoftwareEngineer;
  String get retisense;
  String get jrEngineerDescription;

  // Contact Section
  String get letsWorkTogether;
  String get workTogetherDescription;
  String get getInTouch;
  String get email;
  String get phone;
  String get location;
  String get newDelhi;
  String get followMe;

  // Contact Form
  String get firstName;
  String get lastName;
  String get projectType;
  String get selectProjectType;
  String get message;
  String get tellAboutProject;
  String get sendMessage;

  // Footer
  String get quickLinks;
  String get services;
  String get iosAppDevelopment;
  String get flutterDevelopment;
  String get appConsulting;
  String get uiuxDesign;
  String get allRightsReserved;

  // Project Categories
  String get enterprise;
  String get b2b;
  String get finance;
  String get communication;
  String get healthcare;
  String get sports;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
          'an issue with the localizations generation tool. Please file an issue on GitHub with a '
          'reproducible sample app and the gen-l10n configuration that was used.'
  );
}