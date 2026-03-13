class HiddenSpot {
  final int id;
  final String name;
  final String type; // Local Trek, Secret Waterfall, Hidden Viewpoint, Village Lake, Forest Trail
  final String district;
  final String difficulty; // Easy, Moderate, Hard
  final double rating;
  final double? latitude;
  final double? longitude;
  final String? description;
  final String? imageUrl;
  final String? tips;

  HiddenSpot({
    required this.id,
    required this.name,
    required this.type,
    required this.district,
    required this.difficulty,
    required this.rating,
    this.latitude,
    this.longitude,
    this.description,
    this.imageUrl,
    this.tips,
  });

  factory HiddenSpot.fromJson(Map<String, dynamic> json) {
    return HiddenSpot(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      type: json['type'] ?? 'Local Trek',
      district: json['district'] ?? 'Unknown',
      difficulty: json['difficulty'] ?? 'Moderate',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
      tips: json['tips'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'district': district,
      'difficulty': difficulty,
      'rating': rating,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'imageUrl': imageUrl,
      'tips': tips,
    };
  }
}