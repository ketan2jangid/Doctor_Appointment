import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DocCard extends StatelessWidget {
  final String imageLink;
  final String name;
  final String speciality;
  final String location;

  const DocCard({
    super.key,
    required this.imageLink,
    required this.name,
    required this.speciality,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                imageLink,
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Icon(
                Icons.verified,
                color: primeBlue,
              ),
            )
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$speciality',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: primeBlue, size: 18,),
                  Text(
                    '$location ',
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Icon(Icons.map, color: primeBlue, size: 18,),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
