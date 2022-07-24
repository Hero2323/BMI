import 'package:flutter/material.dart';
import 'home.dart';
import 'utilities/notifications.dart';
import 'utilities/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;
  bool male = true;
  double height = 100.0;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<DarkModeSwitch>(
      onNotification: (_) {
        setState(() {
          darkMode = !darkMode;
        });
        return true;
      },
      child: MaterialApp(
        title: 'Quiz App',
        home: HomePage(
          age: age,
          male: male,
          height: height,
          weight: weight,
          onMaleSelected: () => setState(() => male = true),
          onFemaleSelected: () => setState(() => male = false),
          onHeightChanged: ((newHeight) => setState(() => height = newHeight)),
          onWeightAddition: (() => setState(() {
                if (weight < 300) {
                  weight++;
                }
              })),
          onWeightSubtraction: (() => setState(() {
                if (weight > 20) {
                  weight--;
                }
              })),
          onAgeAddition: (() => setState(() => {
                if (age < 100) {age++}
              })),
          onAgeSubtraction: (() => setState(() => {
                if (age > 10) {age--}
              })),
        ),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
