import 'package:flutter/material.dart';
import 'package:portfolio_jessica/widgets/common/section_title.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final logos = [
      'assets/images/logos/logo_hug.png',
      'assets/images/logos/logo_kyly.png',
      'assets/images/logos/logo_milon.png',
      'assets/images/logos/logo_nanai.png',
      'assets/images/logos/rollu_logo.jpg',
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 64,
        horizontal: isMobile ? 24 : 48,
      ),
      decoration: BoxDecoration(
        color: AppColors.pastelPink.withOpacity(0.05),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Experiência Profissional',
          ),
          const SizedBox(height: 48),
          CarouselSlider(
            options: CarouselOptions(
              height: 100,
              autoPlay: true,
              viewportFraction: isMobile ? 0.5 : 0.2,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            ),
            items: logos.map((logo) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  logo,
                  fit: BoxFit.contain,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}