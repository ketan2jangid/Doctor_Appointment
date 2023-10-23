import 'package:doc/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SlotTile extends StatelessWidget {
  bool look;
  final String name;
  // Radio selection;

  SlotTile({super.key, this.look = false, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        border: Border.all(color: look ? primeBlue : Colors.grey),
        color: look ? primeBlue : Colors.white,
      ),
      alignment: Alignment.center,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16.0,
          color: look ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
