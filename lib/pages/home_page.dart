import 'package:flutter/material.dart';
import 'package:portfolio_jessica/widgets/header/animated_header.dart';
import 'package:portfolio_jessica/widgets/experience/experience_section.dart';
import 'package:portfolio_jessica/widgets/portfolio/portfolio_section.dart';
import 'package:portfolio_jessica/widgets/education/education_section.dart';
import 'package:portfolio_jessica/widgets/skills/skills_section.dart';
import 'package:portfolio_jessica/widgets/footer/footer.dart';
import 'package:portfolio_jessica/utils/responsive_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveHelper(
        mobile: _buildMobileLayout(),
        tablet: _buildTabletLayout(),
        desktop: _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AnimatedHeader(),
          PortfolioSection(),  // Movido para cima
          ExperienceSection(), // Movido para baixo
          EducationSection(),
          SkillsSection(),
          Footer(),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AnimatedHeader(),
          PortfolioSection(),  // Movido para cima
          ExperienceSection(), // Movido para baixo
          EducationSection(),
          SkillsSection(),
          Footer(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AnimatedHeader(),
          PortfolioSection(),  // Movido para cima
          ExperienceSection(), // Movido para baixo
          EducationSection(),
          SkillsSection(),
          Footer(),
        ],
      ),
    );
  }
}