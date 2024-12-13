import 'package:flutter/material.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? textColor;

  const CustomChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.backgroundColor,
    this.selectedColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? (selectedColor ?? AppColors.pastelPink.withOpacity(0.2))
              : (backgroundColor ?? Colors.white),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (selectedColor ?? AppColors.pastelPink)
                : Colors.black12,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? (textColor ?? AppColors.pastelPink)
                : Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}