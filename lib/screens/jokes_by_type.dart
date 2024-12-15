import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:laboratories_mis2/models/joke.dart';
import 'package:laboratories_mis2/services/api_service.dart';
import 'package:laboratories_mis2/widgets/jokes_list.dart';


class JokesByTypeScreen extends StatefulWidget {

  final String type;
  const JokesByTypeScreen({super.key,required this.type});

  @override
  State<JokesByTypeScreen> createState() => _JokesByTypeScreenState();
}

class _JokesByTypeScreenState extends State<JokesByTypeScreen> {

  List<Joke> jokes=[];

  @override
  void initState() {
    super.initState();
    getJokesByTypeFromAPI();
  }
  void getJokesByTypeFromAPI() async {
    ApiService.getJokesByType(widget.type).then((response) {
      var data = jsonDecode(response.body);
      setState(() {
        jokes = List<Joke>.from(data.map((item) => Joke.fromJson(item)));
      });
    }).catchError((e) {
      print("Failed to load jokes of type: $e");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes', style: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: Colors.black)),
        backgroundColor: Colors.greenAccent,
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : JokesList(jokes: jokes),
    );
  }
}