import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CompanyCarousel extends StatelessWidget {
  const CompanyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final logos = [
      'assets/images/logos/logo_hug.png',
      'assets/images/logos/logo_kyly.png',
      'assets/images/logos/logo_milon.png',
      'assets/images/logos/logo_nanai.png',
      'assets/images/logos/rollu_logo.jpg',
    ];

    final isMobile = MediaQuery.of(context).size.width < 600;

    return CarouselSlider(
      options: CarouselOptions(
        height: 60,
        autoPlay: true,
        viewportFraction: isMobile ? 0.5 : 0.2,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
      ),
      items: logos.map((logo) {
        return Image.asset(
          logo,
          fit: BoxFit.contain,
          color: Colors.black54,
        );
      }).toList(),
    );
  }
}