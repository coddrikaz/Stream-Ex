import 'dart:async';

import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  void _incrementCounter() {
    counterStream.sink.add(20);
  }

  StreamController<int> counterStream = StreamController<int>();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Stream Counter App"),
      ),
      body: Center(
          child: StreamBuilder(
        stream: counterStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 120),
            );
          } else {
            return Text("error",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 120));
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.amber,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
