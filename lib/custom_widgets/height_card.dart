import 'package:flutter/material.dart';
import '../utilities/sizing.dart';

class HeightCard extends StatelessWidget {
  double height;
  final void Function(double) onChanged;
  HeightCard({
    Key? key,
    required this.height,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizing.blockSize * 90,
      height: Sizing.blockSizeVertical * 22.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizing.blockSize * 3),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Height',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizing.fontSize * 5,
                color: Theme.of(context).textTheme.bodyText2!.color),
          ),
          Text('${height.toStringAsFixed(2)} CM',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizing.fontSize * 9,
                color: Theme.of(context).textTheme.bodyText2!.color,
              )),
          Slider(
            value: height.toDouble(),
            onChanged: onChanged,
            min: 80.0,
            max: 250.0,
            divisions: (250.0 - 80.0) ~/ 1,
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
