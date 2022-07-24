import 'package:flutter/material.dart';
import 'utilities/sizing.dart';

class Results extends StatelessWidget {
  String male;
  int result;
  int age;
  String healthiness;
  Results(
      {Key? key,
      required this.male,
      required this.age,
      required this.result,
      required this.healthiness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender: $male',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizing.fontSize * 5,
                  color: Colors.white),
            ),
            Text(
              'Result: $result',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizing.fontSize * 5,
                  color: Colors.white),
            ),
            Text(
              'Age: $age',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizing.fontSize * 5,
                  color: Colors.white),
            ),
            Text(
              'Healthiness: $healthiness',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizing.fontSize * 5,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
