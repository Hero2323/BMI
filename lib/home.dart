import 'package:flutter/material.dart';
import 'custom_widgets/gender_card.dart';
import 'custom_widgets/height_card.dart';
import 'custom_widgets/age_weight_card.dart';
import 'utilities/sizing.dart';
import 'results.dart';
import 'utilities/notifications.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.age,
    required this.height,
    required this.male,
    required this.weight,
    required this.onFemaleSelected,
    required this.onHeightChanged,
    required this.onMaleSelected,
    required this.onWeightAddition,
    required this.onWeightSubtraction,
    required this.onAgeAddition,
    required this.onAgeSubtraction,
  }) : super(key: key);
  bool male;
  double height;
  int weight;
  int age;
  void Function()? onMaleSelected;
  void Function()? onFemaleSelected;
  void Function(double) onHeightChanged;
  void Function()? onWeightAddition;
  void Function()? onWeightSubtraction;
  void Function()? onAgeAddition;
  void Function()? onAgeSubtraction;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    Sizing.setDimensions(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          Switch(
            value: darkMode,
            onChanged: (value) {
              const DarkModeSwitch(true).dispatch(context);
              setState(() {
                darkMode = value;
              });
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenderCard(
                label: 'Male',
                color: widget.male
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).secondaryHeaderColor,
                icon: Icons.male,
                onTap: widget.onMaleSelected,
              ),
              GenderCard(
                label: 'Female',
                color: !widget.male
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).secondaryHeaderColor,
                icon: Icons.female,
                onTap: widget.onFemaleSelected,
              ),
            ],
          ),
          HeightCard(
            height: widget.height,
            onChanged: widget.onHeightChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AgeWeightCard(
                label: 'Weight',
                value: widget.weight,
                onAddition: widget.onWeightAddition,
                onSubtraction: widget.onWeightSubtraction,
              ),
              AgeWeightCard(
                label: 'Age',
                value: widget.age,
                onAddition: widget.onAgeAddition,
                onSubtraction: widget.onAgeSubtraction,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    result: widget.weight ~/
                        ((widget.height / 100) * (widget.height / 100)),
                    healthiness: ((widget.weight / widget.height) >= 18.5 &&
                            (widget.weight / widget.height) <= 24.9)
                        ? 'Normal'
                        : 'Unhealthy',
                    male: widget.male ? 'Male' : 'Female',
                    age: widget.age,
                  ),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              elevation: MaterialStateProperty.all(0.0),
              minimumSize: MaterialStateProperty.all(Size(
                Sizing.blockSize * 90,
                Sizing.blockSizeVertical * 6,
              )),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Sizing.blockSizeVertical * 1.5,
                  ),
                ),
              ),
            ),
            child: Text(
              'Calculate',
              style: TextStyle(
                  fontSize: Sizing.fontSize * 5,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
          ),
        ],
      ),
    );
  }
}
