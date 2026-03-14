// Trip Planner Screen
import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class TripPlannerScreen extends StatefulWidget {
  @override
  _TripPlannerScreenState createState() => _TripPlannerScreenState();
}

class _TripPlannerScreenState extends State<TripPlannerScreen> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  String travelType = 'solo';
  String? itinerary;

  void generatePlan() async {
    final aiService = AIService('YOUR_OPENAI_API_KEY');
    final plan = await aiService.generateTripPlan(
      locationController.text,
      int.tryParse(durationController.text) ?? 1,
      double.tryParse(budgetController.text) ?? 0,
      travelType,
    );
    setState(() {
      itinerary = plan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trip Planner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Starting Location'),
            ),
            TextField(
              controller: durationController,
              decoration: InputDecoration(labelText: 'Trip Duration (days)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: budgetController,
              decoration: InputDecoration(labelText: 'Budget'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: travelType,
              items: ['solo', 'friends', 'family']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  travelType = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generatePlan,
              child: Text('Generate Trip Plan'),
            ),
            if (itinerary != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(itinerary!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
