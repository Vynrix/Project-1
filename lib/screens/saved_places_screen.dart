import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/places_provider.dart';
import '../widgets/place_card.dart';

class SavedPlacesScreen extends StatelessWidget {
  const SavedPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text('Saved Places'),
        elevation: 0,
      ),
      body: Consumer<PlacesProvider>(
        builder: (context, placesProvider, _) {
          if (placesProvider.savedPlaces.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No saved places yet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bookmark places to view them later',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: placesProvider.savedPlaces.length,
            itemBuilder: (context, index) {
              final place = placesProvider.savedPlaces[index];
              return PlaceCard(
                place: place,
                isSaved: true,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/place-detail',
                    arguments: place,
                  );
                },
                onSave: () {
                  placesProvider.toggleSavePlace(place);
                },
              );
            },
          );
        },
      ),
    );
  }
}