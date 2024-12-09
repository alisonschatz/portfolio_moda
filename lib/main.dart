import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jessica Schatz Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

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
      body: SingleChildScrollView(
        child: Column(
          children: const [
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

class AnimatedHeader extends StatefulWidget {
  const AnimatedHeader({super.key});

  @override
  State<AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
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
    return Container(
      height: 300,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.pink.shade50,
            Colors.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Icon(
                Icons.child_care,
                size: 40,
                color: Colors.pink.shade200,
              ),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 30,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Icon(
                Icons.favorite,
                size: 30,
                color: Colors.pink.shade300,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _slideAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Text(
                      'Jessica Schatz',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: [
                                  Colors.pink.shade400,
                                  Colors.purple.shade300,
                                ],
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              ),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'Children\'s Fashion Designer',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.pink.shade300,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    final logos = [
      'assets/logo_hug.png',
      'assets/logo_kyly.png',
      'assets/logo_milon.png',
      'assets/logo_nanai.png',
      'assets/rollu_logo.jpg',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Professional Experience',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.pink.shade400,
                ),
          ),
          const SizedBox(height: 32),
          CarouselSlider(
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.4,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: logos.map((logo) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Image.asset(logo, fit: BoxFit.contain),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: Colors.pink.shade50,
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.pink.shade400,
                ),
          ),
          const SizedBox(height: 32),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: List.generate(
              6,
              (index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/portfolio_${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
          EducationItem(
            institution: 'Fundação Armando Alvares Penteado',
            degree: 'Post-graduation in Fashion Business',
            year: '2023',
          ),
          const SizedBox(height: 16),
          EducationItem(
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