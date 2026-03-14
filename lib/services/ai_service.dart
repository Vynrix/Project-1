// OpenAI AI Travel Assistant Service
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIService {
  final String openAIKey;
  AIService(this.openAIKey);

  Future<String> chatAssistant(String prompt) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $openAIKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'user', 'content': prompt}
        ],
        'max_tokens': 500,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to get AI response');
    }
  }

  Future<String> generateTripPlan(String location, int duration, double budget, String travelType) async {
    String prompt = 'Plan a $duration day trip in Kerala starting from $location for $travelType with a budget of $budget.';
    return await chatAssistant(prompt);
  }

  Future<String> suggestNearbyPlaces(String location) async {
    String prompt = 'Suggest best places near $location in Kerala.';
    return await chatAssistant(prompt);
  }

  Future<String> budgetTripPlanner(double budget) async {
    String prompt = 'Plan a Kerala trip for a budget of $budget.';
    return await chatAssistant(prompt);
  }
}
