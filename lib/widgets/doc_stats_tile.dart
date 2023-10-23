import 'dart:ffi';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DocStatsTile extends StatelessWidget {
  final IconData icon;
  final String stat;
  final String tileName;

  const DocStatsTile({
    super.key,
    required this.icon,
    required this.stat,
    required this.tileName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secBlue,
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: primeBlue,
            size: 30,
          ),
        ),
        Text(
          '$stat',
          style: TextStyle(
            color: primeBlue,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '$tileName',
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
