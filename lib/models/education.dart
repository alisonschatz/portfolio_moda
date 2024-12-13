class Education {
  final String institution;
  final String degree;
  final String period;
  final String description;
  final String? location;

  const Education({
    required this.institution,
    required this.degree,
    required this.period,
    required this.description,
    this.location,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institution: json['institution'] as String,
      degree: json['degree'] as String,
      period: json['period'] as String,
      description: json['description'] as String,
      location: json['location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'institution': institution,
      'degree': degree,
      'period': period,
      'description': description,
      'location': location,
    };
  }
}