import 'package:flutter/material.dart';
import 'package:laboratories_mis2/models/joke.dart';

class JokesList extends StatelessWidget {
  final List<Joke> jokes;

  const JokesList({super.key, required this.jokes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        final joke = jokes[index];
        return Card(
          elevation: 5.0,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
            title: Text(joke.setup, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(joke.punchline),
          ),
        );
      },
    );
  }
}