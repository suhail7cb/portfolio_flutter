import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/core/di/injection.dart';
import 'package:portfolio_flutter/core/router/app_router.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:portfolio_flutter/l10n/app_localizations.dart';

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