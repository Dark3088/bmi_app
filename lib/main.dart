import 'package:flutter/material.dart';
import 'package:imc_app/health_rules.dart';
import 'package:imc_app/input_exception.dart';
import 'package:imc_app/person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Body Mass Index'),
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
  var imcResult = TextEditingController();

  submitAndUpdate() {
    setState(() {
      imcResult.text = submitInformation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    onChanged: (name) => nameController.text = name,
                    decoration: const InputDecoration(
                      labelText: 'Your name',
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (height) => heightController.text = height,
                  decoration: const InputDecoration(labelText: "Your height"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (weight) => weightController.text = weight,
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
                          enableFeedback: true,
                          elevation: MaterialStatePropertyAll(8),
                        ),
                        onPressed: () => submitAndUpdate(),
                        child: const Text('SUBMIT INFO'),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                      imcResult.text.isEmpty
                          ? "Please fill in with your Info"
                          : imcResult.text,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),
            ],
          ),
        ));
  }

  String submitInformation() {
    if (nameController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty) {
      return "Ops.. Looks like you forgot something";
    } else {
      var height = tryAndParse(heightController.text);
      var weight = tryAndParse(weightController.text);

      var newPerson = Person(nameController.text, height, weight);
      return validateHealthRulesFor(newPerson);
    }
  }
}

double tryAndParse(String value) {
  double newValue = 0.0;
  try {
    newValue = double.parse(value);
  } catch (e) {
    throw InputException("Wrong data type");
  } finally {
    newValue = 0.0;
  }
  return newValue;
}
