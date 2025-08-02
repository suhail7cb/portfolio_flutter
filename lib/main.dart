import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/core/di/injection.dart';
import 'package:portfolio_flutter/core/router/app_router.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';


///Road Map
///  Add action on download resume, it should download the resume placed in assets folder.
///  Validation on connect us form, email should be validated, name should not be empty, message should not be empty.
///  Add a loading indicator while the form is being submitted.
///  Add a success message after the form is submitted successfully.
///  Add a failure message if the form submission fails.

///------ Release v1 -----
///  Add Links to footer sections
///  Email trigerring
///  Add Whatsapp Link
///  Fetch the details from API
///-----Release v2------
///  Make this portfolio customizable link theme, color selection
/// Dark theme/light theme/system theme implementation / Give color pallet option based on that the theme should reflect
///  Add Project detail via expansion/Popup Along with app screenshots, Store Links if available
///  Add animation to sections while being presented on screen
///  Add Localisation, add french, Japanese, Hindi, Urdu Arabic, Chinese, Kashmiri Language Support
///-----Release v3------


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => getIt<PortfolioBloc>(),
          child: MaterialApp.router(
            title: 'Suhail Shabir - Mobile Developer',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: const Color(0xFF1A1F36),
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme,
              ).apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          ),
        );
      },
    );
  }
}