import 'package:flutter/material.dart';
import 'package:Apps/apps/quiz/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';

Future<List<Results>> fetchQuestions() async {
  const url = "https://opentdb.com/api.php?amount=20";
  var res = await http.get(url);
  var parsedRes = jsonDecode(res.body);
  var quiz = Quiz.fromJson(parsedRes);
  return quiz.results;
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Center errPage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Error: Network Error'),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Try Again'),
              onPressed: () {
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Results>>(
          future: fetchQuestions(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Results>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text('press here to start.'));

              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                if (snapshot.hasError) {
                  return errPage();
                }
                return QuestionListBuilder(results: snapshot.data);
            }
            return null;
          }),
    );
  }
}

class QuestionListBuilder extends StatefulWidget {
  QuestionListBuilder({Key key, this.results}) : super(key: key);

  final results;

  @override
  _QuestionListBuilderState createState() => _QuestionListBuilderState();
}

class _QuestionListBuilderState extends State<QuestionListBuilder> {
  List<Results> results;

  @override
  void initState() {
    super.initState();
    results = widget.results;
    print('initState');
  }

  @override
  void didUpdateWidget(QuestionListBuilder oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  Future<void> _refresh() async {
    final _results = await fetchQuestions();
    setState(() {
      results = _results;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
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
          }),
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
