class Skill {
  final String name;
  final double percentage;
  final String? description;
  final String category;

  const Skill({
    required this.name,
    required this.percentage,
    this.description,
    required this.category,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'] as String,
      percentage: json['percentage'] as double,
      description: json['description'] as String?,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'percentage': percentage,
      'description': description,
      'category': category,
    };
  }
}

class Tool {
  final String name;
  final String iconPath;
  final String? description;

  const Tool({
    required this.name,
    required this.iconPath,
    this.description,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iconPath': iconPath,
      'description': description,
    };
  }
}