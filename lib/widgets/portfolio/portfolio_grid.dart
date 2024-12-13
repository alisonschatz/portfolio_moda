import 'package:flutter/material.dart';
import 'package:portfolio_jessica/models/portfolio_item.dart';
import 'package:portfolio_jessica/widgets/portfolio/portfolio_item_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PortfolioGrid extends StatelessWidget {
  final List<PortfolioItem> items;

  const PortfolioGrid({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return MasonryGridView.count(
      crossAxisCount: isMobile ? 1 : 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PortfolioItemCard(item: items[index]);
      },
    );
  }
}