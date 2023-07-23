import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'ความรักมันออกแบบไม่ ถ้าออกแบบได้คงไม่ออกมาเป็นแบบนี้',
    'ความรักก็เหมือนเบีย คนที่เทคือคนที่ยกขวด คนที่เจ็บปวดคือคนยกแก้ว',
    'แพ้บ้างดิ',
    'ความรักก็เหมือนก๋วยเตี๋ยว',
    'ความรักก็เหมือนไข่เจียว',
  ];
  var quote = quoteList[0]; // state variable
  Color currentColor = Colors.pink; // state variable for the current color

  void handleClickGo() {
    setState(() {
      var rand = Random();
      // Randomize quote
      var randomQuoteIndex = rand.nextInt(quoteList.length);
      while (quoteList[randomQuoteIndex] == quote) {
        randomQuoteIndex = rand.nextInt(quoteList.length);
      }
      quote = quoteList[randomQuoteIndex];

      // Randomize color
      List<Color> availableColors = [
        Colors.pink,
        Colors.orange,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.purple,
        Colors.red,
        Colors.teal,
        Colors.indigo,
        Colors.amber,
      ];
      availableColors.remove(currentColor);
      var randomColorIndex = rand.nextInt(availableColors.length);
      currentColor = availableColors[randomColorIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคม')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style: TextStyle(
              color: currentColor,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
