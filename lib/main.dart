import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'IMC App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                  controller: nameController,
                  onChanged: (v) => nameController.text = v,
                  decoration: const InputDecoration(
                    labelText: 'Your name',
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                controller: heightController,
                onChanged: (v) => heightController.text = v,
                decoration: const InputDecoration(labelText: "Your height"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                controller: weightController,
                onChanged: (v) => weightController.text = v,
                decoration: const InputDecoration(labelText: "Your weight"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
              child: Builder(
                builder: (context) {
                  return SizedBox(
                    height: 48.0,
                    width: double.infinity,
                    child: FilledButton(
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(8),
                      ),
                      onPressed: () => print('PRESSED'),
                      child: Text('Submit Pup'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
