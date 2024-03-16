import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ).copyWith(secondary: Colors.deepOrange),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your BMI"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(children: [
            const Text(
              'BMI',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: wtController,
              decoration: const InputDecoration(
                  labelText: "Enter your weight (in kg)",
                  prefixIcon: Icon(Icons.line_weight)),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: ftController,
              decoration: const InputDecoration(
                  labelText: "Enter your height(in feet)",
                  prefixIcon: Icon(Icons.height)),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: inController,
              decoration: const InputDecoration(
                  labelText: "Enter your height(in inch)",
                  prefixIcon: Icon(Icons.height)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 11,
            ),
            ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                    // Calculation
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (ift * 12) + iInch;
                    var tCm = tInch * 2.54;
                    var tM = tCm / 100;
                    var bmi = iwt / (tM * tM);

                    setState(() {
                      result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required details!!";
                    });
                  }
                },
                child: Text("Calculate")),
            Text(
              result,
              style: TextStyle(fontSize: 21),
            )
          ]),
        ),
      ),
    );
  }
}
