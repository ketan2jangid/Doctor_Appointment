import 'package:doc/network/api_calls.dart';
import 'package:doc/screens/summary_screen.dart';
import 'package:doc/utils/app_colors.dart';
import 'package:doc/utils/endpoints.dart';
import 'package:doc/widgets/flat_app_bar.dart';
import 'package:doc/widgets/flat_bottom_bar.dart';
import 'package:doc/widgets/package_tile.dart';
import 'package:flutter/material.dart';

class PackageSelectionScreen extends StatefulWidget {
  final String aptDay;
  final String aptTime;

  PackageSelectionScreen({super.key, required this.aptDay, required this.aptTime});

  @override
  State<PackageSelectionScreen> createState() => _PackageSelectionScreenState();
}

class _PackageSelectionScreenState extends State<PackageSelectionScreen> {
  APICalls apiCalls = APICalls();

  dynamic packagesDetail;
  bool isLoading = true;

  late String selectedPack;
  late String selectedDuration;
  List<DropdownMenuEntry> dropdownItems = [];

  @override
  void initState() {
    super.initState();

    getPackagesDetails();
  }

  Future getPackagesDetails() async{
    dynamic data = await apiCalls.getDataFromApi(urlLink: packageDataLink);

    setState(() {
      packagesDetail = data;
      isLoading = false;

      selectedPack = packagesDetail['package'][0];
      selectedDuration = packagesDetail['duration'][0];
    });

    for (String slot in packagesDetail['duration']) {
      dropdownItems.add(DropdownMenuEntry(
        value: slot,
        label: slot,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar(
        header: 'Select Package',
      ),
      bottomNavigationBar: FlatBottomBar(
        action: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SummaryScreen(package: selectedPack, duration: selectedDuration, day: widget.aptDay, time: widget.aptTime,)),
        ),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(),) :
      Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Duration',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Dropdown
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: DropdownMenu(
                onSelected: (value) {
                  setState(() {
                    selectedDuration = value;
                  });
                },
                width: (MediaQuery.of(context).size.width - 40),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                leadingIcon: Icon(
                  Icons.schedule_rounded,
                  color: primeBlue,
                  size: 30,
                ),
                trailingIcon: Icon(
                  Icons.expand_more_rounded,
                  color: primeBlue,
                  size: 30,
                ),
                initialSelection: selectedDuration,
                dropdownMenuEntries: dropdownItems,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'Select Package',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Packages list
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: packagesDetail['package'].length,
                itemBuilder: (context, ind) => PackageTile(
                  title: packagesDetail['package'][ind],
                  selection: Radio(
                    value: packagesDetail['package'][ind],
                    groupValue: selectedPack,
                    activeColor: primeBlue,
                    onChanged: (value) {
                      setState(() {
                        selectedPack = value as String;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
