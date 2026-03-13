import 'package:flutter/foundation.dart';

class TouristPlace {
  final int id;
  final String name;
  final String category;
  final String district;
  final double rating;
  final String? description;
  final String? imageUrl;
  final double? latitude;
  final double? longitude;
  bool isSaved;

  TouristPlace({
    required this.id,
    required this.name,
    required this.category,
    required this.district,
    required this.rating,
    this.description,
    this.imageUrl,
    this.latitude,
    this.longitude,
    this.isSaved = false,
  });

  factory TouristPlace.fromJson(Map<String, dynamic> json) {
    return TouristPlace(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      category: json['category'] ?? 'Other',
      district: json['district'] ?? 'Unknown',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      description: json['description'],
      imageUrl: json['imageUrl'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'district': district,
      'rating': rating,
      'description': description,
      'imageUrl': imageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'isSaved': isSaved,
    };
  }

  TouristPlace copyWith({
    int? id,
    String? name,
    String? category,
    String? district,
    double? rating,
    String? description,
    String? imageUrl,
    double? latitude,
    double? longitude,
    bool? isSaved,
  }) {
    return TouristPlace(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      district: district ?? this.district,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}