import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/place_model.dart';
import '../models/hotel_model.dart';
import '../models/restaurant_model.dart';
import '../models/hidden_spot_model.dart';

class DatasetService {
  static final DatasetService _instance = DatasetService._internal();

  factory DatasetService() {
    return _instance;
  }

  DatasetService._internal();

  List<TouristPlace> _places = [];
  List<Hotel> _hotels = [];
  List<Restaurant> _restaurants = [];
  List<HiddenSpot> _hiddenSpots = [];

  List<TouristPlace> get places => _places;
  List<Hotel> get hotels => _hotels;
  List<Restaurant> get restaurants => _restaurants;
  List<HiddenSpot> get hiddenSpots => _hiddenSpots;

  Future<void> loadDatasets() async {
    try {
      await _loadPlaces();
      await _loadHotels();
      await _loadRestaurants();
      await _loadHiddenSpots();
    } catch (e) {
      print('Error loading datasets: $e');
    }
  }

  Future<void> _loadPlaces() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/places.json');
      final jsonData = jsonDecode(jsonString) as List;
      _places = jsonData.map((place) => TouristPlace.fromJson(place)).toList();
    } catch (e) {
      print('Error loading places: $e');
      _places = _getDefaultPlaces();
    }
  }

  Future<void> _loadHotels() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/hotels.json');
      final jsonData = jsonDecode(jsonString) as List;
      _hotels = jsonData.map((hotel) => Hotel.fromJson(hotel)).toList();
    } catch (e) {
      print('Error loading hotels: $e');
      _hotels = _getDefaultHotels();
    }
  }

  Future<void> _loadRestaurants() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/restaurants.json');
      final jsonData = jsonDecode(jsonString) as List;
      _restaurants =
          jsonData.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
    } catch (e) {
      print('Error loading restaurants: $e');
      _restaurants = _getDefaultRestaurants();
    }
  }

  Future<void> _loadHiddenSpots() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/hidden_spots.json');
      final jsonData = jsonDecode(jsonString) as List;
      _hiddenSpots =
          jsonData.map((spot) => HiddenSpot.fromJson(spot)).toList();
    } catch (e) {
      print('Error loading hidden spots: $e');
      _hiddenSpots = _getDefaultHiddenSpots();
    }
  }

  List<TouristPlace> getPlacesByDistrict(String district) {
    return _places.where((p) => p.district == district).toList();
  }

  List<TouristPlace> getPlacesByCategory(String category) {
    return _places.where((p) => p.category == category).toList();
  }

  List<Hotel> getHotelsByDistrict(String district) {
    return _hotels.where((h) => h.district == district).toList();
  }

  List<Restaurant> getRestaurantsByDistrict(String district) {
    return _restaurants.where((r) => r.district == district).toList();
  }

  List<HiddenSpot> getHiddenSpotsByDistrict(String district) {
    return _hiddenSpots.where((s) => s.district == district).toList();
  }

  List<TouristPlace> searchPlaces(String query) {
    return _places
        .where((p) =>
            p.name.toLowerCase().contains(query.toLowerCase()) ||
            p.district.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<String> getDistinctDistricts() {
    final districts = <String>{};
    districts.addAll(_places.map((p) => p.district));
    return districts.toList()..sort();
  }

  List<String> getDistinctCategories() {
    final categories = <String>{};
    categories.addAll(_places.map((p) => p.category));
    return categories.toList()..sort();
  }

  // Default data fallback
  List<TouristPlace> _getDefaultPlaces() {
    return [
      TouristPlace(
        id: 1,
        name: 'Munnar',
        category: 'Hill Station',
        district: 'Idukki',
        rating: 4.8,
        description: 'Beautiful hill station with tea gardens',
      ),
      TouristPlace(
        id: 2,
        name: 'Alleppey Backwaters',
        category: 'Backwaters',
        district: 'Alappuzha',
        rating: 4.7,
        description: 'Serene backwaters perfect for houseboat rides',
      ),
      TouristPlace(
        id: 3,
        name: 'Fort Kochi',
        category: 'Historical',
        district: 'Ernakulam',
        rating: 4.6,
        description: 'Historic fort with cultural heritage',
      ),
    ];
  }

  List<Hotel> _getDefaultHotels() {
    return [
      Hotel(
        id: 1,
        name: 'Grand Resort Munnar',
        type: 'Resort',
        district: 'Idukki',
        priceRange: '₹6000+',
        rating: 4.7,
      ),
      Hotel(
        id: 2,
        name: 'Backwater Homestay',
        type: 'Homestay',
        district: 'Alappuzha',
        priceRange: '₹1500-3000',
        rating: 4.5,
      ),
    ];
  }

  List<Restaurant> _getDefaultRestaurants() {
    return [
      Restaurant(
        id: 1,
        name: 'Spice Kitchen',
        cuisine: 'Kerala',
        district: 'Ernakulam',
        rating: 4.6,
      ),
      Restaurant(
        id: 2,
        name: 'Seafood Paradise',
        cuisine: 'Seafood',
        district: 'Alappuzha',
        rating: 4.5,
      ),
    ];
  }

  List<HiddenSpot> _getDefaultHiddenSpots() {
    return [
      HiddenSpot(
        id: 1,
        name: 'Secret Waterfall Trail',
        type: 'Secret Waterfall',
        district: 'Wayanad',
        difficulty: 'Moderate',
        rating: 4.7,
      ),
      HiddenSpot(
        id: 2,
        name: 'Forest Trek Adventure',
        type: 'Local Trek',
        district: 'Palakkad',
        difficulty: 'Hard',
        rating: 4.6,
      ),
    ];
  }
}