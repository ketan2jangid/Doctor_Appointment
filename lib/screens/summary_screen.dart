import 'package:doc/screens/confirmation_screen.dart';
import 'package:doc/widgets/doc_card.dart';
import 'package:doc/widgets/flat_app_bar.dart';
import 'package:doc/widgets/flat_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../utils/dummy.dart';

class SummaryScreen extends StatelessWidget {
  final String package;
  final String duration;
  final String day;
  final String time;

  const SummaryScreen({super.key, required this.package, required this.duration, required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FlatAppBar(
        header: 'Review Summary',
      ),
      bottomNavigationBar: FlatBottomBar(
        buttonName: 'Confirm',
        action: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ConfirmationScreen()),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DocCard(
              imageLink: doctors['image'] as String,
              name: doctors['doctor_name'] as String,
              speciality: doctors['speciality'] as String,
              location: doctors['location'] as String,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                thickness: 1.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date & Hour',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    day + ' | ' + time.substring(0, 8),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Package',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    package,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking for',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Self',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
