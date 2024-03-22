import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 27),
        ),
      ),
      body: Container(
        color: Colors.deepPurple.shade100,
        child: Center(
          child: Align(
            alignment: const Alignment(0, -1),
            child: SizedBox(
              width: 330,
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    const Text(
                      'BMI',
                      style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w700),
                      ),
                    const SizedBox(height: 21,),
                    TextField(
                      controller: wtController,
                      decoration: const InputDecoration(
                        label: Text('Enter your Weight (kgs)'),
                        prefixIcon: Icon(Icons.line_weight),
                        ),
                      keyboardType: TextInputType.number,
                      ),
                    const SizedBox(height: 11,),
                    TextField(
                      controller: ftController,
                      decoration: const InputDecoration(
                        label: Text('Enter your Height (feets)'),
                        prefixIcon: Icon(Icons.height),
                        ),
                      keyboardType: TextInputType.number,
                      ),
                    const SizedBox(height: 11,),
                    TextField(
                      controller: inController,
                      decoration: const InputDecoration(
                        label: Text('Enter your Height (inches)'),
                        prefixIcon: Icon(Icons.height),
                        ),
                      keyboardType: TextInputType.number,
                      ),
                    const SizedBox(height: 16,),
                    ElevatedButton(
                      onPressed: () {
                        var weight = wtController.text.toString();
                        var feet = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (weight != '' && feet != '' && inch != '') {
                          var dWeight = double.parse(weight);
                          var dFeet = double.parse(feet);
                          var dInch = double.parse(inch);

                          var meter = (dInch + (dFeet * 12)) * 0.0254;

                          var bmi = dWeight / (meter * meter);

                          var msg = '';

                          if (bmi > 25) {
                            msg = 'You are over weight!';
                            bgColor = Colors.amber.shade400;
                          } else if (bmi < 18) {
                            msg = 'You are under weight!';
                            bgColor = Colors.red.shade400;
                          } else {
                            msg = 'You are healthy!';
                            bgColor = Colors.green.shade900;
                          }

                          setState(() {
                            result = '$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}';
                            });
                          } else {
                            setState(() {
                              result =  'Please fill all the required blanks!';
                              });
                          }
                        },
                        child: const Text('Calculate')),
                    const SizedBox(height: 16,),
                    Text(
                          result,
                          style: TextStyle(fontSize: 16, color: bgColor),
                          ),
                    ],
                  ),
                ),
              ),
          ),
        )
        ),
    );
  }
}
