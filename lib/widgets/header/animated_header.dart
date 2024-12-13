import 'package:flutter/material.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';
import 'package:portfolio_jessica/widgets/header/pattern_painter.dart';


class AnimatedHeader extends StatefulWidget {
  const AnimatedHeader({super.key});

  @override
  State<AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final padding = isMobile ? 20.0 : 48.0;

    return Container(
      height: isMobile ? 400 : 500,
      color: Colors.white,
      child: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: CustomPaint(
              painter: PatternPainter(
                color: AppColors.pastelPink.withOpacity(0.05),
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfileSection(isMobile),
                const SizedBox(height: 32),
                _buildStatsSection(isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(bool isMobile) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          padding: EdgeInsets.all(isMobile ? 20 : 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.pastelPink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'FASHION DESIGNER',
                  style: TextStyle(
                    color: AppColors.pastelPink,
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Jessica Schatz',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Criando moda infantil com amor e imaginação',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(bool isMobile) {
    final stats = [
      {'value': '10+', 'label': 'Anos de Experiência'},
      {'value': '150+', 'label': 'Coleções Criadas'},
      {'value': '5+', 'label': 'Marcas Parceiras'},
    ];

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Wrap(
        spacing: isMobile ? 16 : 32,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: stats.map((stat) => _buildStatItem(stat, isMobile)).toList(),
      ),
    );
  }

  Widget _buildStatItem(Map<String, String> stat, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.pastelPink.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stat['value']!,
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.pastelPink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            stat['label']!,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}