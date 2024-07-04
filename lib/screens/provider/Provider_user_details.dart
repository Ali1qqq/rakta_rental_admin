import 'dart:math';

import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';

class ProviderUserDetailsScreen extends StatelessWidget {
  final ({
    String providerId,
    String providerName,
    String cars,
    String NumberOfRequest,
    String totalAmount,
    String Location
  }) record;

  ProviderUserDetailsScreen({super.key, required this.record});

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
                    BackButton(
                      color: Colors.white,
                    ),
                    if (!Responsive.isMobile(context))
                      Text(
                        "Provider",
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  foregroundDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black38),
                                  height: 400,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: secondaryColor),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/profile.jpg",
                                        width: 400,
                                        height: 400,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Text(
                                  "Profile Image",
                                  style: TextStyle(fontSize: 22),
                                ),
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
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cars",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("Car Id"),
                            ),
                            DataColumn(
                              label: Text("Car name"),
                            ),
                            DataColumn(
                              label: Text("Estimated price"),
                            ),
                            DataColumn(
                              label: Text("Revenues"),
                            ),
                            DataColumn(
                              label: Text("Stats"),
                            ),
                          ],
                          rows: List.generate(
                            demoRecentFiles.length,
                            (index) =>
                                recentFileDataRow(demoRecentFiles[index]),
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

  DataRow recentFileDataRow(RecentProvider fileInfo) {
    return DataRow(
      cells: [
        DataCell(
          Text(fileInfo.carId!),
        ),

        DataCell(Text(fileInfo.carName!)),
        DataCell(Text(fileInfo.estimated!)),
        DataCell(Text(fileInfo.revenues!)),
        DataCell(Text(fileInfo.state!,style: TextStyle(color:fileInfo.state=="Rent"?primaryColor:fileInfo.state=="Maintenance"?Colors.redAccent:Colors.green ),)),
      ],
    );
  }

  List demoRecentFiles = [
    RecentProvider(
      carId: "CAR${Random().nextInt(999999999)}",
      carName: "BMW X5",
      estimated: "${Random().nextInt(9999999)} AED",
      revenues: "${Random().nextInt(9999)} AED",
      state: "Rent",
    ),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Mercedes-Benz E-Class",
        estimated: "2536498 AED",
        revenues: "5921 AED",
        state: "Rent"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Audi Q7",
        estimated: "7483094 AED",
        revenues: "1123 AED",
        state: "Maintenance"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Lexus RX",
        estimated: "9201743 AED",
        revenues: "8244 AED",
        state: "Maintenance"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Range Rover Evoque",
        estimated: "326749 AED",
        revenues: "2753 AED",
        state: "Available"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Toyota Land Cruiser",
        estimated: "8429385 AED",
        revenues: "4321 AED",
        state: "Available"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Volvo XC90",
        estimated: "1948376 AED",
        revenues: "6218 AED",
        state: "Available"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Jeep Grand Cherokee",
        estimated: "389372 AED",
        revenues: "3158 AED",
        state: "Available"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Ford Explorer",
        estimated: "9427463 AED",
        revenues: "1967 AED",
        state: "Rent"),
    RecentProvider(
        carId: "CAR${Random().nextInt(999999999)}",
        carName: "Honda CR-V",
        estimated: "3719648 AED",
        revenues: "8743 AED",
        state: "Rent"),
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

class RecentProvider {
  final String? carId, carName, estimated, revenues, state;

  RecentProvider(
      {this.carId, this.carName, this.estimated, this.revenues, this.state});
}
