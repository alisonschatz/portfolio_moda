import 'package:flutter/material.dart';
import 'package:portfolio_jessica/widgets/common/section_title.dart';
import 'package:portfolio_jessica/widgets/portfolio/portfolio_grid.dart';
import 'package:portfolio_jessica/widgets/portfolio/category_filter.dart';
import 'package:portfolio_jessica/models/portfolio_item.dart';


class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  String selectedCategory = 'Todas';

  final List<String> categories = [
    'Todas',
    'Verão',
    'Inverno',
    'Casual',
    'Festa',
  ];

  final List<PortfolioItem> portfolioItems = [
    const PortfolioItem(
      id: '1',
      title: 'Coleção Verão 2024',
      description: 'Linha infantil com tecidos leves e cores vibrantes',
      imageUrl: 'assets/images/portfolio/portfolio_1.jpg',
      category: 'Verão',
      year: '2024',
    ),
    // Adicione mais itens conforme necessário
  ];

  List<PortfolioItem> get filteredItems {
    if (selectedCategory == 'Todas') {
      return portfolioItems;
    }
    return portfolioItems
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      color: Colors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Portfolio',
            color: Colors.black87,
          ),
          const SizedBox(height: 32),
          CategoryFilter(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: 32),
          PortfolioGrid(items: filteredItems),
        ],
      ),
    );
  }
}