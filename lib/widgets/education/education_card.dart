import 'package:flutter/material.dart';
import 'package:portfolio_jessica/models/education.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class EducationCard extends StatelessWidget {
  final Education education;

  const EducationCard({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.pastelPink.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Period badge
          Positioned(
            top: -10,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.pastelPink.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                education.period,
                style: TextStyle(
                  color: AppColors.pastelPink,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  education.institution,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  education.degree,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.pastelPink,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (education.location != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        education.location!,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 12),
                Text(
                  education.description,
                  style: const TextStyle(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}