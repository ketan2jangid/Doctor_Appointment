import 'package:doc/network/api_calls.dart';
import 'package:doc/screens/doc_details.dart';
import 'package:doc/screens/my_bookings_screen.dart';
import 'package:doc/utils/endpoints.dart';
import 'package:doc/widgets/flat_app_bar.dart';
import 'package:doc/widgets/flat_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  APICalls apiCalls = APICalls();

  dynamic confirmationData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getConfirmationData();
  }

  Future getConfirmationData() async{
    dynamic data = await apiCalls.getDataFromApi(urlLink: confirmationDataLink);

    setState(() {
      confirmationData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar(
        header: 'Confirmation',
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 130,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBookingsScreen()),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: primeBlue,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text(
                  'View Appointments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DocDetails()),
              ),
              child: Text(
                'Book Another',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: primeBlue,
                ),
              ),
            )
          ],
        ),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(),) :
      Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primeBlue,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Appointment confirmed!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'You have successfully booked appointment with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                confirmationData['doctor_name'],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Divider(),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: primeBlue,
                      size: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        'Esther Howard',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: primeBlue,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Text(
                                confirmationData['appointment_date'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: primeBlue,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Text(
                                (confirmationData['appointment_time'] as String).substring(0,8),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
