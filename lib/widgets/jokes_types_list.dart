import 'package:flutter/material.dart';
import 'package:laboratories_mis2/screens/jokes_by_type.dart';

class JokeTypesList extends StatelessWidget {
  final List<String> jokeTypes;

  const JokeTypesList({super.key, required this.jokeTypes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokeTypes.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SizedBox(
            height: 100,
            child: ListTile(
              title: Center(child: Text(jokeTypes[index].toUpperCase(),
                style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),textAlign: TextAlign.center,)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JokesByTypeScreen(type: jokeTypes[index]),
                  ),
                );
              },
            ),),
        );
      },
    );
  }
}