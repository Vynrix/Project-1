class Restaurant {
  final int id;
  final String name;
  final String cuisine;
  final String district;
  final double rating;
  final double? latitude;
  final double? longitude;
  final String? description;
  final String? imageUrl;
  final String? phone;
  final String? website;
  final String? address;

  Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.district,
    required this.rating,
    this.latitude,
    this.longitude,
    this.description,
    this.imageUrl,
    this.phone,
    this.website,
    this.address,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      cuisine: json['cuisine'] ?? 'Multi-cuisine',
      district: json['district'] ?? 'Unknown',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
      phone: json['phone'],
      website: json['website'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cuisine': cuisine,
      'district': district,
      'rating': rating,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'imageUrl': imageUrl,
      'phone': phone,
      'website': website,
      'address': address,
    };
  }
}