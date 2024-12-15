import 'package:flutter/material.dart';
import 'package:laboratories_mis2/models/joke.dart';
import 'package:laboratories_mis2/services/api_service.dart';
import 'dart:convert';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  Joke? randomJoke;

  @override
  void initState() {
    super.initState();
    getRandomJokeFromAPI();
  }
  void getRandomJokeFromAPI() async {
    ApiService.getRandomJoke().then((response) {
      var data = jsonDecode(response.body);
      setState(() {
        randomJoke = Joke.fromJson(data);
      });
    }).catchError((e) {
      print("Failed to load random joke: $e");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Joke Of The Day',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.greenAccent, elevation: 6
      ),
      body: randomJoke == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            title: Text(randomJoke!.setup, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(randomJoke!.punchline),
          ),
        ),
      ),
    );
  }
}