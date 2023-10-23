import 'package:doc/network/api_calls.dart';
import 'package:doc/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

import '../utils/endpoints.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  APICalls apiCalls = APICalls();

  bool isLoading = true;
  dynamic bookings;

  @override
  void initState() {
    super.initState();

    getAppointments();
  }

  Future getAppointments() async {
    if(bookings == null) {
      dynamic temp = await apiCalls.getDataFromApi(urlLink: bookingDataLink);

      setState(() {
        bookings = temp;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey,
          )
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Container(
            height: 1,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                )
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'My Bookings',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                  )
              ),
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: isLoading ?
        Center(child: CircularProgressIndicator(),) :
        ListView.builder(
          shrinkWrap: true,
          itemCount: bookings.length,
          itemBuilder: (context, index) => AppointmentCard(
            bookingId: bookings[index]['booking_id']!,
            drName: bookings[index]['doctor_name']!,
            location: bookings[index]['location']!,
            date: bookings[index]['appointment_date']!,
            time: bookings[index]['appointment_time']!,
          ),
        ),
      ),
    );
  }
}
