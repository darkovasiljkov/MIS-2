import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<http.Response> getJokeTypes() async {
    try {
      final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/types'));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load joke types: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching joke types: $e');
    }
  }

  static Future<http.Response> getJokesByType(String type) async {
    try {
      final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/jokes/$type/ten'));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load jokes by type: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching jokes by type: $e');
    }
  }

  static Future<http.Response> getRandomJoke() async {
    try {
      final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load random joke: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching random joke: $e');
    }
  }
}