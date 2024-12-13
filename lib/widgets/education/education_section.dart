import 'package:flutter/material.dart';
import 'package:portfolio_jessica/widgets/common/section_title.dart';
import 'package:portfolio_jessica/widgets/education/education_card.dart';
import 'package:portfolio_jessica/models/education.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  final List<Education> educations = const [
    Education(
      institution: 'Fundação Armando Alvares Penteado',
      degree: 'Pós-graduação em Fashion Business',
      period: '2023',
      description: 'Especialização em gestão de negócios de moda, com foco em mercado infantil e sustentabilidade.',
      location: 'São Paulo, SP',
    ),
    Education(
      institution: 'FURB - Universidade de Blumenau',
      degree: 'Bacharelado em Moda',
      period: '2020',
      description: 'Formação em design de moda com ênfase em moda infantil e processos criativos.',
      location: 'Blumenau, SC',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      color: Colors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Educação',
            color: Colors.black87,
          ),
          const SizedBox(height: 48),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: educations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: EducationCard(education: educations[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}