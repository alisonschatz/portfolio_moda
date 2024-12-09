import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: Colors.pink.shade50,
      child: Column(
        children: [
          Text(
            'Contact',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.pink.shade400,
                ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                Icons.email,
                'Email',
                () {},
                context,
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                Icons.link,
                'LinkedIn',
                () {},
                context,
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                Icons.camera_alt,
                'Instagram',
                () {},
                context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
    IconData icon,
    String label,
    VoidCallback onPressed,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Colors.pink.shade400,
                  size: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.pink.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}