import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Quiz quiz;
  List<Results> results;

  Future<void> _fetchQuestions() async {
    const url = "https://opentdb.com/api.php?amount=20";
    try {
      var res = await http.get(url);
      var parsedRes = jsonDecode(res.body);
      quiz = Quiz.fromJson(parsedRes);
      results = quiz.results;
    } on Exception catch (err) {
      print(err);
    }
  }

  ListView _buildQuestionList() {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          var curResult = results[index];
          var avatarChar = curResult.type.startsWith("m") ? "M" : "B";
          return Card(
            color: Colors.white,
            elevation: 0.0,
            child: ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      HtmlUnescape().convert(curResult.question),
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FilterChip(
                            label: Text(
                              curResult.category,
                            ),
                            backgroundColor: Colors.grey[100],
                            onSelected: null,
                          ),
                          SizedBox(width: 10.0),
                          FilterChip(
                            label: Text(
                              curResult.difficulty,
                            ),
                            backgroundColor: Colors.grey[100],
                            onSelected: null,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Text(avatarChar),
              ),
              children: curResult.allAnswers
                  .map((answer) => Answer(answer: answer, results: curResult))
                  .toList(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _fetchQuestions,
        child: FutureBuilder(
            future: _fetchQuestions(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text('press here to start.'));

                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());

                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Container();
                  }
                  return _buildQuestionList();
              }
              return Container();
            }),
      ),
    );
  }
}

class Answer extends StatefulWidget {
  final String answer;
  final Results results;

  Answer({Key key, this.answer, this.results}) : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  Color color;

  void _judge() {
    final nextColor = widget.answer == widget.results.correctAnswer
        ? Colors.green
        : Colors.red;
    if (nextColor != color) {
      setState(() {
        color = nextColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _judge,
      title: Text(
        widget.answer,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
