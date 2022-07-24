import 'package:flutter/material.dart';
import '../utilities/sizing.dart';

class AgeWeightCard extends StatelessWidget {
  final String label;
  final void Function()? onAddition;
  final void Function()? onSubtraction;
  final int value;
  const AgeWeightCard({
    Key? key,
    required this.label,
    required this.value,
    required this.onAddition,
    required this.onSubtraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing.blockSize * 42,
      height: Sizing.blockSizeVertical * 22.5,
      child: Material(
        color: Colors.blueGrey[600],
        borderRadius: BorderRadius.circular(Sizing.blockSizeVertical * 1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizing.fontSize * 5,
                  color: Colors.white),
            ),
            Text(
              '$value',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizing.fontSize * 9,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onSubtraction,
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onAddition,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
