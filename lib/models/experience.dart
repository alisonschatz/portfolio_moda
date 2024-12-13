class Experience {
  final String company;
  final String role;
  final String period;
  final String description;
  final String logoUrl;
  final List<String> achievements;

  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.logoUrl,
    required this.achievements,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'] as String,
      role: json['role'] as String,
      period: json['period'] as String,
      description: json['description'] as String,
      logoUrl: json['logoUrl'] as String,
      achievements: (json['achievements'] as List).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'role': role,
      'period': period,
      'description': description,
      'logoUrl': logoUrl,
      'achievements': achievements,
    };
  }
}