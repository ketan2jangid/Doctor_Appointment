import 'package:doc/network/api_calls.dart';
import 'package:doc/screens/package_selection_screen.dart';
import 'package:doc/utils/endpoints.dart';
import 'package:doc/widgets/doc_stats.dart';
import 'package:doc/widgets/flat_app_bar.dart';
import 'package:doc/widgets/flat_bottom_bar.dart';
import 'package:doc/widgets/slot_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/doc_card.dart';

class DocDetails extends StatefulWidget {
  const DocDetails({super.key});

  @override
  State<DocDetails> createState() => _DocDetailsState();
}

class _DocDetailsState extends State<DocDetails> {
  APICalls apiCalls = APICalls();

  dynamic pageDetails;
  bool isLoading = true;
  String daySelected = '';
  String slotSelected = '';
  List? days;
  List? timeSlots;

  @override
  void initState() {
    super.initState();

    getPageContents();
  }

  Future getPageContents() async {
    dynamic data = await apiCalls.getDataFromApi(urlLink: drDataLink);

    setState(() {
      pageDetails = data[0];
      isLoading = false;

      days = (pageDetails['availability']).keys.toList();
      daySelected = days![0];

      timeSlots = pageDetails['availability'][daySelected];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FlatAppBar(
        header: 'Book Appointment',
      ),
      bottomNavigationBar: FlatBottomBar(
          buttonName: 'Make Appointment',
          action: () {
            if(slotSelected.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PackageSelectionScreen(aptDay: daySelected, aptTime: slotSelected)),
              );
            }
          },
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DocCard(
                      imageLink: pageDetails['image'],
                      name: pageDetails['doctor_name'],
                      speciality: pageDetails['speciality'],
                      location: pageDetails['location'],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                    DocStats(
                      patients: pageDetails['patients_served'] as int,
                      experience: pageDetails['years_of_experience'] as int,
                      rating: pageDetails['rating'] as double,
                      reviews: pageDetails['number_of_reviews'] as int,
                    ),
                    const Text(
                      'BOOK APPOINTMENT',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 16.0),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Day',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: days!.length,
                        itemBuilder: (context, ind) => InkWell(
                          onTap: () {
                            setState(() {
                              daySelected = days![ind];
                              timeSlots =
                                  pageDetails['availability'][daySelected];
                            });
                          },
                          child: SlotTile(
                            name: days![ind],
                            look: daySelected == days![ind],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSlots!.length,
                        itemBuilder: (context, ind) => InkWell(
                          onTap: () {
                            setState(() {
                              slotSelected = timeSlots![ind];
                            });
                          },
                          child: SlotTile(
                            name: timeSlots![ind],
                            look: slotSelected == timeSlots![ind],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
