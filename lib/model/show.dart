
// lib/models/show.dart
class Show {
  final int id;
  final String name;
  final String? imageUrl;
  final String? summary;
  final List<String> genres;
  final double? rating;

  Show({
    required this.id,
    required this.name,
    this.imageUrl,
    this.summary,
    required this.genres,
    this.rating,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image']?['medium'],
      summary: json['summary'] != null
          ? json['summary'].replaceAll(RegExp(r'<[^>]*>'), '')
          : null,
      genres: List<String>.from(json['genres'] ?? []),
      rating: json['rating']?['average']?.toDouble(),
    );
  }
}