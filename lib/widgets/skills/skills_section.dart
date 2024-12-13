import 'package:flutter/material.dart';
import 'package:portfolio_jessica/widgets/common/section_title.dart';
import 'package:portfolio_jessica/widgets/skills/skill_card.dart';
import 'package:portfolio_jessica/widgets/skills/tools_grid.dart';
import 'package:portfolio_jessica/models/skill.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<Skill> skills = const [
    Skill(
      name: 'Design de Moda Infantil',
      percentage: 95,
      category: 'Design',
      description: 'Desenvolvimento de coleções com foco no público infantil',
    ),
    Skill(
      name: 'Ilustração de Moda',
      percentage: 90,
      category: 'Design',
      description: 'Criação de croquis e ilustrações técnicas',
    ),
    Skill(
      name: 'Desenvolvimento de Coleção',
      percentage: 88,
      category: 'Gestão',
      description: 'Planejamento e execução de coleções completas',
    ),
    Skill(
      name: 'Pesquisa de Tendências',
      percentage: 85,
      category: 'Pesquisa',
      description: 'Análise e aplicação de tendências do mercado',
    ),
    Skill(
      name: 'Gestão de Projetos',
      percentage: 82,
      category: 'Gestão',
      description: 'Coordenação de equipes e cronogramas',
    ),
    Skill(
      name: 'Sustentabilidade',
      percentage: 80,
      category: 'Especialidade',
      description: 'Desenvolvimento de produtos sustentáveis',
    ),
  ];

  final List<Tool> tools = const [
    Tool(
      name: 'Adobe Illustrator',
      iconPath: 'assets/images/tools/illustrator.png',
      description: 'Desenvolvimento de ilustrações e desenhos técnicos',
    ),
    Tool(
      name: 'Photoshop',
      iconPath: 'assets/images/tools/photoshop.png',
      description: 'Edição de imagens e apresentações',
    ),   
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      decoration: BoxDecoration(
        color: AppColors.pastelPink.withOpacity(0.05),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Habilidades',
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: skills.map((skill) => SkillCard(skill: skill)).toList(),
          ),
          const SizedBox(height: 48),
          ToolsGrid(tools: tools),
        ],
      ),
    );
  }
}