import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../theme/app_theme.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    final logos = [
      'assets/logo_hug.png',
      'assets/logo_kyly.png',
      'assets/logo_milon.png',
      'assets/logo_nanai.png',
      'assets/rollu_logo.jpg',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.pastelPink.withOpacity(0.1),
            AppColors.pastelBlue.withOpacity(0.1),
            AppColors.pastelYellow.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          // Título com ícones decorativos
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: AppColors.pastelPink,
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                'Professional Experience',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.pastelPink,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.star,
                color: AppColors.pastelPink,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Carrossel de logos
          Stack(
            alignment: Alignment.center,
            children: [
              // Indicadores decorativos nas laterais
              Positioned(
                left: 16,
                child: Icon(
                  Icons.toys,
                  color: AppColors.pastelBlue.withOpacity(0.3),
                  size: 32,
                ),
              ),
              Positioned(
                right: 16,
                child: Icon(
                  Icons.bubble_chart,
                  color: AppColors.pastelPurple.withOpacity(0.3),
                  size: 32,
                ),
              ),
              // Carrossel
              CarouselSlider(
                options: CarouselOptions(
                  height: 100,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.25,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: logos.map((logo) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      logo,
                      fit: BoxFit.contain,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Indicador de navegação personalizado
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: logos.asMap().entries.map((entry) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.pastelPink.withOpacity(0.3),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}