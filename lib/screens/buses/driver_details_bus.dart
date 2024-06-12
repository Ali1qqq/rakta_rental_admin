import 'package:rakta_admin/models/RecentFile.dart' hide demoRecentFiles;
import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:rating_summary/rating_summary.dart';

class BusDriverScreen extends StatelessWidget {
  final ({String driverName, String a, String b, String status}) record;
  BusDriverScreen({super.key , required this.record});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: GetBuilder<HomeController>(builder: (controller) {
            return Column(
              children: [
                Row(
                  children: [
                    BackButton(color: Colors.white,),
                    if (!Responsive.isMobile(context))
                      Text(
                        "Driver Details",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black38),
                                  height: 400,
                                  width: 400,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset("assets/profile.jpg",width: 400,height: 400,fit: BoxFit.cover,)),

                                ),
                                Text("Profile Image",style: TextStyle(fontSize: 22),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black38),
                                  height: 400,
                                  width: 400,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset("assets/map.png",width: 400,height: 400,fit: BoxFit.cover,)),
                                
                                ),
                                Text("Live Location",style: TextStyle(fontSize: 22),),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black38),
                                  height: 400,
                                  width: 400,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset("assets/camera.jpg",width: 400,height: 400,fit: BoxFit.cover,)),

                                ),
                                Text("Live Camera",style: TextStyle(fontSize: 22),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: --------"),
                      Text("Age: --------"),
                      Text("Mobile Number: --------"),
                      Text("Email: --------"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Driver Rates",style: TextStyle(fontSize: 22),),
                      SizedBox(height: 10,),
                      RatingSummary(
                        counter: 13,
                        average: 3.846,
                        showAverage: true,
                        counterFiveStars: 5,
                        counterFourStars: 4,
                        counterThreeStars: 2,
                        counterTwoStars: 1,
                        counterOneStars: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent Trips",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("Trip type"),
                            ),
                            DataColumn(
                              label: Text("Date"),
                            ),
                            DataColumn(
                              label: Text("Distance"),
                            ),
                           /* DataColumn(
                              label: Text("Total Ticket"),
                            ),*/
                          ],
                          rows: List.generate(
                            listRecentTrip.length,
                            (index) => recentTripDataRow(listRecentTrip[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget squrWidget(title, body) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
            Text(
              body,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  DataRow recentTripDataRow(RecentFile fileInfo) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Image.asset(
                fileInfo.recId!,
                height: 30,
                width: 30,
                // color: fileInfo.title == "Taxi"
                //     ? primaryColor.withOpacity(0.5)
                //     : fileInfo.title == "Bus"
                //         ? Colors.cyan
                //         : Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(fileInfo.provider!),
              ),
            ],
          ),
        ),
        DataCell(Text(fileInfo.date!)),
        DataCell(Text(fileInfo.location!)),
        // DataCell(Text(fileInfo.totalTicket!)),
      ],
    );
  }

  List listRecentTrip = [
    RecentFile(
      recId: "assets/bus_icon.png",
      provider: "Rak -> Dubai",
      date: "27-02-2021",
      location: "19.0KM",
      // totalTicket: "30 Ticket",
    ),
    RecentFile(
      recId: "assets/bus_icon.png",
      provider: "Rak -> Oman",
      date: "25-02-2021",
      location: "3.5KM",
      // totalTicket: "30 Ticket",
    ),
    RecentFile(
      recId: "assets/bus_icon.png",
      provider: "Rak -> Dubai",
      date: "25-02-2021",
      location: "3.5KM",
      // totalTicket: "30 Ticket",
    ),
    RecentFile(
      recId: "assets/bus_icon.png",
      provider: "Rak -> AlAeen",
      date: "25-02-2021",
      location: "3.5KM",
      // totalTicket: "30 Ticket",
    ),
    RecentFile(
      recId: "assets/bus_icon.png",
      provider: "Rak -> Sharja",
      date: "25-02-2021",
      location: "3.5KM",
      // totalTicket: "30 Ticket",
    ),

  ];


  List<({String driverName, String a, String b, String status})> listWorkingDriver = [
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Stopped"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Working"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Working"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Stopped"),
    (driverName: "Driver Name", a: "12", b: "3.5KM", status: "Working"),
  ];

  List<PieChartSectionData> paiChartSelectionData = [
    PieChartSectionData(
      color: Colors.teal.withOpacity(0.5),
      value: 50,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.cyan,
      value: 1262,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.pink.withOpacity(0.5),
      value: 188,
      showTitle: false,
      radius: 20,
    ),
  ];
}
