import 'package:flutter/material.dart';
import 'custom_widgets/gender_card.dart';
import 'custom_widgets/height_card.dart';
import 'custom_widgets/age_weight_card.dart';
import 'utilities/sizing.dart';
import 'results.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  bool male = true;
  double height = 100.0;
  int weight = 60;
  int age = 18;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Sizing.setDimensions(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenderCard(
                label: 'Male',
                color: (widget.male ? Colors.teal[600] : Colors.blueGrey[600])!,
                icon: Icons.male,
                onTap: () => setState(() => widget.male = true),
              ),
              GenderCard(
                label: 'Female',
                color:
                    (!widget.male ? Colors.teal[600] : Colors.blueGrey[600])!,
                icon: Icons.female,
                onTap: () => setState(() => widget.male = false),
              ),
            ],
          ),
          HeightCard(
            height: widget.height,
            onChanged: ((newHeight) =>
                setState(() => widget.height = newHeight)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AgeWeightCard(
                label: 'Weight',
                value: widget.weight,
                onAddition: (() => setState(() {
                      if (widget.weight < 300) {
                        widget.weight++;
                      }
                    })),
                onSubtraction: (() => setState(() {
                      if (widget.weight > 20) {
                        widget.weight--;
                      }
                    })),
              ),
              AgeWeightCard(
                label: 'Age',
                value: widget.age,
                onAddition: (() => setState(() => {
                      if (widget.age < 100) {widget.age++}
                    })),
                onSubtraction: (() => setState(() => {
                      if (widget.age > 10) {widget.age--}
                    })),
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
                    healthiness: ((widget.weight / widget.height) >= 18.5 ||
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
              backgroundColor: MaterialStateProperty.all(Colors.teal[600]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
