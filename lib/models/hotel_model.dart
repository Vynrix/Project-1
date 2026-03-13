class Hotel {
  final int id;
  final String name;
  final String type; // Hotel, Homestay, Resort, Eco Lodge, etc.
  final String district;
  final String priceRange;
  final double rating;
  final double? latitude;
  final double? longitude;
  final String? description;
  final String? imageUrl;
  final String? phone;
  final String? website;

  Hotel({
    required this.id,
    required this.name,
    required this.type,
    required this.district,
    required this.priceRange,
    required this.rating,
    this.latitude,
    this.longitude,
    this.description,
    this.imageUrl,
    this.phone,
    this.website,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      type: json['type'] ?? 'Hotel',
      district: json['district'] ?? 'Unknown',
      priceRange: json['price_range'] ?? 'Unknown',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
      phone: json['phone'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'district': district,
      'price_range': priceRange,
      'rating': rating,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'imageUrl': imageUrl,
      'phone': phone,
      'website': website,
    };
  }
}