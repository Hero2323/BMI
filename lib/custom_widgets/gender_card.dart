import 'package:flutter/material.dart';
import '../utilities/sizing.dart';

class GenderCard extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Color color;
  final IconData icon;
  const GenderCard({
    Key? key,
    required this.label,
    required this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizing.blockSize * 42,
      height: Sizing.blockSizeVertical * 22.5,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(Sizing.blockSizeVertical * 1.5),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Sizing.blockSizeVertical * 1.5)),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: Sizing.blockSizeVertical * 15,
              ),
              Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizing.fontSize * 5,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
