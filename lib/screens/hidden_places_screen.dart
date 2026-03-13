import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hidden_spots_provider.dart';
import '../models/hidden_spot_model.dart';

class HiddenPlacesScreen extends StatefulWidget {
  const HiddenPlacesScreen({Key? key}) : super(key: key);

  @override
  State<HiddenPlacesScreen> createState() => _HiddenPlacesScreenState();
}

class _HiddenPlacesScreenState extends State<HiddenPlacesScreen> {
  String _selectedDifficulty = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HiddenSpotsProvider>(context, listen: false)
          .loadHiddenSpots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: const Text('Hidden Kerala Gems'),
        elevation: 0,
      ),
      body: Consumer<HiddenSpotsProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Filter Section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Filter by Difficulty',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _DifficultyChip(
                              label: 'All',
                              isSelected: _selectedDifficulty.isEmpty,
                              onTap: () {
                                setState(() {
                                  _selectedDifficulty = '';
                                });
                                provider.filterByDifficulty('');
                              },
                            ),
                            ...['Easy', 'Moderate', 'Hard'].map((difficulty) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: _DifficultyChip(
                                  label: difficulty,
                                  isSelected:
                                      _selectedDifficulty == difficulty,
                                  onTap: () {
                                    setState(() {
                                      _selectedDifficulty = difficulty;
                                    });
                                    provider.filterByDifficulty(difficulty);
                                  },
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Hidden Spots List
                if (provider.filteredSpots.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.explore_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No hidden gems found',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.filteredSpots.length,
                    itemBuilder: (context, index) {
                      final spot = provider.filteredSpots[index];
                      return _HiddenSpotCard(spot: spot);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DifficultyChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (!isSelected) return Colors.grey[200]!;
      switch (label) {
        case 'Easy':
          return Colors.green;
        case 'Moderate':
          return Colors.orange;
        case 'Hard':
          return Colors.red;
        default:
          return Colors.purple;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: getColor().withOpacity(isSelected ? 1 : 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: getColor(),
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : getColor(),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _HiddenSpotCard extends StatelessWidget {
  final HiddenSpot spot;

  const _HiddenSpotCard({required this.spot});

  @override
  Widget build(BuildContext context) {
    Color getDifficultyColor() {
      switch (spot.difficulty) {
        case 'Easy':
          return Colors.green;
        case 'Moderate':
          return Colors.orange;
        case 'Hard':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        spot.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        spot.type,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: getDifficultyColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    spot.difficulty,
                    style: TextStyle(
                      color: getDifficultyColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  spot.district,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '${spot.rating}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}