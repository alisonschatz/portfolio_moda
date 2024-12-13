import 'package:flutter/material.dart';
import 'package:portfolio_jessica/models/skill.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class ToolsGrid extends StatelessWidget {
  final List<Tool> tools;

  const ToolsGrid({
    super.key,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'FERRAMENTAS',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: tools.map((tool) => _buildToolItem(tool)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildToolItem(Tool tool) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.pastelPink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            tool.iconPath,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(
            tool.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}