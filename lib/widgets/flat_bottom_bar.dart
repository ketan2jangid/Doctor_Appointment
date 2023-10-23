import 'package:doc/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FlatBottomBar extends StatelessWidget {
  final String buttonName;
  final void Function()? action;
  FlatBottomBar({super.key, this.buttonName = 'Next', this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.4),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),),
      ),
      child: GestureDetector(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(
            color: primeBlue,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            '$buttonName',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
