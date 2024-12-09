import 'package:flutter/material.dart';
import 'package:portfolio_jessica/page/home_page.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jessica Schatz Portfolio',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}