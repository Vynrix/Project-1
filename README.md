# Nadodi - Kerala Tourism Explorer

A modern, production-ready Flutter application for discovering tourist places, hotels, restaurants, and hidden gems across Kerala.

## Features

✨ **Key Features**
- 🗺️ Explore tourist places across Kerala districts
- 🏨 Discover hotels, homestays, and resorts
- 🍽️ Find restaurants and dining options
- 🔍 Hidden Kerala gems - Secret waterfalls, viewpoints, and trekking trails
- 💾 Bookmark your favorite places
- 📍 Location-based recommendations
- 🎨 Modern, intuitive UI with smooth animations

## Project Structure

```
lib/
├── models/
│   ├── place_model.dart
│   ├── hotel_model.dart
│   ├── restaurant_model.dart
│   └── hidden_spot_model.dart
├── screens/
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── place_detail_screen.dart
│   ├── hidden_places_screen.dart
│   ├── saved_places_screen.dart
│   └── profile_screen.dart
├── providers/
│   ├── places_provider.dart
│   ├── hotels_provider.dart
│   └── hidden_spots_provider.dart
├── services/
│   ├── dataset_service.dart
│   └── location_service.dart
├── widgets/
│   ├── place_card.dart
│   ├── category_chip.dart
│   └── rating_widget.dart
├── main.dart
├── app.dart
└── routes.dart

assets/
├── data/
│   ├── places.json
│   ├── hotels.json
│   ├── restaurants.json
│   └── hidden_spots.json
├── images/
└── fonts/
```

## Technology Stack

- **Framework**: Flutter 3.0+
- **Language**: Dart
- **State Management**: Provider
- **Maps**: Google Maps Flutter
- **Location**: Geolocator
- **Backend Ready**: Firebase integration structure
- **Database Ready**: JSON and Firestore support

## Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart 3.0 or higher
- Android Studio / Xcode for emulation
- Google Maps API key (for maps functionality)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/nadodi-kerala.git
   cd nadodi-kerala
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Keys**
   - Add Google Maps API key to `android/app/src/main/AndroidManifest.xml`
   - Add Google Maps API key to `ios/Runner/Info.plist`

4. **Run the app**
   ```bash
   flutter run
   ```

## App Screens

### 1. Splash Screen
- Beautiful Kerala-themed splash with animated logo
- Auto-navigation to home after 3 seconds

### 2. Home Screen
- Search functionality
- Category filtering (Beach, Hill Station, Waterfall, etc.)
- Popular places listing
- Save places feature

### 3. Place Detail Screen
- Large place images
- Detailed description
- Rating and reviews
- Nearby hotels and restaurants
- Navigation directions
- Share functionality

### 4. Hidden Places Screen
- Discover secret waterfalls
- Local trekking trails
- Hidden viewpoints
- Filter by difficulty level (Easy, Moderate, Hard)

### 5. Saved Places Screen
- View all bookmarked places
- Quick access to favorite locations

### 6. Profile Screen
- User statistics
- Settings and preferences
- Help and support

## Dataset

The app includes sample datasets for:
- **1050+ Tourist Places** across Kerala districts
- **600+ Hotels & Homestays** with pricing and ratings
- **700+ Restaurants** by cuisine type
- **150+ Hidden Spots** with difficulty levels

### Sample Data Structure

**Tourist Place:**
```json
{
  "id": 1,
  "name": "Munnar",
  "category": "Hill Station",
  "district": "Idukki",
  "rating": 4.8,
  "description": "Beautiful hill station..."
}
```

**Hotel:**
```json
{
  "id": 1,
  "name": "Grand Resort",
  "type": "Resort",
  "district": "Idukki",
  "price_range": "₹6000+",
  "rating": 4.7
}
```

## State Management

Using **Provider** for efficient state management:

- `PlacesProvider`: Manages tourist places, filtering, and bookmarks
- `HotelsProvider`: Manages hotels and accommodations
- `HiddenSpotsProvider`: Manages hidden gems discovery

## Services

### DatasetService
Handles loading and managing JSON datasets for:
- Tourist places
- Hotels and homestays
- Restaurants
- Hidden spots

### LocationService
Manages:
- Permission requests
- Current location detection
- Distance calculations
- Location-based filtering

## Customization

### Add Custom Dataset
1. Create JSON file in `assets/data/`
2. Update `DatasetService` to load new data
3. Create corresponding provider if needed

### Change Color Scheme
Update colors in `app.dart`:
```dart
ColorScheme.fromSeed(
  seedColor: Colors.yourColor,
)
```

### Add New Screens
1. Create screen file in `screens/`
2. Add route in `routes.dart`
3. Update bottom navigation if needed

## Firebase Integration (Future)

The app structure supports Firebase integration:
- User authentication
- Cloud Firestore for real-time data
- Firebase Storage for images
- Cloud Functions for recommendations

## Dependencies

- `provider: ^6.1.0` - State management
- `google_maps_flutter: ^2.6.0` - Maps
- `geolocator: ^9.0.2` - Location
- `http: ^1.1.0` - API calls
- `cached_network_image: ^3.3.1` - Image caching
- `firebase_core: ^2.24.0` - Firebase
- `flutter_rating_bar: ^4.0.1` - Rating widget

## Future Enhancements

- [ ] Google Maps integration with live tracking
- [ ] User authentication and profiles
- [ ] Real-time ratings and reviews
- [ ] Trip planning and itineraries
- [ ] Offline mode support
- [ ] Push notifications
- [ ] Social sharing integration
- [ ] AR features for navigation
- [ ] Multi-language support
- [ ] Dark mode

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see LICENSE.md file for details.

## Authors

- **Your Name** - Initial work - [GitHub Profile](https://github.com/yourusername)

## Acknowledgments

- Kerala Tourism Board for inspiration
- Flutter community for amazing packages
- Contributors and testers

## Support

For support, email support@nadodi.com or open an issue on GitHub.

## Demo

Screenshots and demo videos coming soon!

---

**Made with ❤️ for Kerala Tourism**