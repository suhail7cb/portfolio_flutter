import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/sections/about_section.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/sections/contact_section.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/sections/experience_section.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/sections/footer_section.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/sections/home_section.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/sections/project_sections.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/sections/skills_section.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/shared/custom_app_bar.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/shared/loading_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<PortfolioBloc>().add(LoadPortfolioData());
  }

  void _scrollToSection(String section) {
    GlobalKey? key;
    switch (section) {
      case 'home':
        key = _homeKey;
        break;
      case 'about':
        key = _aboutKey;
        break;
      case 'skills':
        key = _skillsKey;
        break;
      case 'projects':
        key = _projectsKey;
        break;
      case 'experience':
        key = _experienceKey;
        break;
      case 'contact':
        key = _contactKey;
        break;
    }

    if (key!= null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        if (state is PortfolioLoading) {
          return const Scaffold(
            body: LoadingWidget(),
          );
        }

        if (state is PortfolioError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        if (state is PortfolioLoaded) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return Scaffold(
                body: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 0,
                      backgroundColor: const Color(0xFF1A1F36).withOpacity(0.95),
                      flexibleSpace: CustomAppBar(
                        onNavigate: _scrollToSection,
                        activeSection: state.activeSection,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        AnimationLimiter(
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 600),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(child: widget),
                              ),
                              children: [
                                Container(
                                  key: _homeKey,
                                  child: HomeSection(
                                    personalInfo: state.portfolioData.personalInfo,
                                    onNavigate: _scrollToSection,
                                  ),
                                ),
                                Container(
                                  key: _aboutKey,
                                  child: AboutSection(
                                    personalInfo: state.portfolioData.personalInfo,
                                  ),
                                ),
                                Container(
                                  key: _skillsKey,
                                  child: SkillsSection(
                                    skills: state.portfolioData.skills,
                                  ),
                                ),
                                Container(
                                  key: _projectsKey,
                                  child: ProjectsSection(
                                    projects: state.portfolioData.projects,
                                  ),
                                ),
                                Container(
                                  key: _experienceKey,
                                  child: ExperienceSection(
                                    experiences: state.portfolioData.experiences,
                                  ),
                                ),
                                Container(
                                  key: _contactKey,
                                  child: ContactSection(
                                    contactInfo: state.portfolioData.contactInfo,
                                  ),
                                ),
                                const FooterSection(),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            },
          );
        }

        return const Scaffold(
          body: LoadingWidget(),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}