import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Education',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.pink.shade400,
                ),
          ),
          const SizedBox(height: 32),
          const EducationItem(
            institution: 'Fundação Armando Alvares Penteado',
            degree: 'Post-graduation in Fashion Business',
            year: '2023',
          ),
          const SizedBox(height: 16),
          const EducationItem(
            institution: 'FURB - Universidade de Blumenau',
            degree: 'Bachelor\'s in Fashion Design',
            year: '2020',
          ),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String institution;
  final String degree;
  final String year;

  const EducationItem({
    super.key,
    required this.institution,
    required this.degree,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            institution,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            degree,
            style: TextStyle(
              fontSize: 16,
              color: Colors.pink.shade400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            year,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}