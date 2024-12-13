import 'package:flutter/material.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';
import 'package:portfolio_jessica/pages/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jessica Schatz Portfolio',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}