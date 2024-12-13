import 'package:flutter/material.dart';
import 'package:portfolio_jessica/models/experience.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceTimeline({
    super.key,
    required this.experiences,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final exp = experiences[index];
        final isLast = index == experiences.length - 1;

        return Stack(
          children: [
            if (!isMobile && !isLast)
              Positioned(
                left: 120,
                top: 50,
                bottom: 0,
                width: 2,
                child: Container(
                  color: AppColors.pastelPink.withOpacity(0.2),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMobile) ...[
                    SizedBox(
                      width: 120,
                      child: Text(
                        exp.period,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isMobile)
                            Text(
                              exp.period,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          if (isMobile) const SizedBox(height: 8),
                          Row(
                            children: [
                              Image.asset(
                                exp.logoUrl,
                                height: 32,
                                width: 32,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exp.company,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    exp.role,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.pastelPink,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            exp.description,
                            style: const TextStyle(
                              color: Colors.black54,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: exp.achievements.map((achievement) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.pastelPink.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  achievement,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.pastelPink,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}