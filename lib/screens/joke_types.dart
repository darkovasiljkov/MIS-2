import 'package:flutter/material.dart';
import 'package:laboratories_mis2/screens/random_joke.dart';
import 'dart:convert';
import 'package:laboratories_mis2/services/api_service.dart';
import 'package:laboratories_mis2/widgets/jokes_types_list.dart';



class JokeTypesScreen extends StatefulWidget {
  const JokeTypesScreen({super.key});

  @override
  State<JokeTypesScreen> createState() => _JokeTypesScreenState();
}

class _JokeTypesScreenState extends State<JokeTypesScreen> {

  List<String> jokeTypes = [];
  @override
  void initState() {
    super.initState();
    getJokeTypesFromAPI();
  }

  void getJokeTypesFromAPI() async {
    ApiService.getJokeTypes().then((response) {
      var data = jsonDecode(response.body);
      setState(() {
        jokeTypes = List<String>.from(data);
      });
    }).catchError((e) {
      print("Failed to load joke types: $e");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Joke Types',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.greenAccent, elevation: 6,
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_objects_outlined,size: 45,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RandomJokeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : JokeTypesList(jokeTypes: jokeTypes),
    );
  }
}