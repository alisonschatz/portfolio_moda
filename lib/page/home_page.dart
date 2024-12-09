import 'package:flutter/material.dart';
import '../widgets/animated_header.dart';
import '../widgets/experience_section.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/education_section.dart';
import '../widgets/contact_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AnimatedHeader(),
            Experience(),
            Portfolio(),
            Education(),
            Contact(),
          ],
        ),
      ),
    );
  }
}