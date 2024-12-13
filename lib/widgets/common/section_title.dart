import 'package:flutter/material.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isMobile;
  final Color? color;

  const SectionTitle({
    super.key,
    required this.title,
    this.isMobile = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: color ?? Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            color: color ?? AppColors.pastelPink,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}