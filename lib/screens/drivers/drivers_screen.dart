import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../taxi/driver_details_taxi.dart';

class DriverScreen extends StatelessWidget {
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
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: controller.controlMenu,
                      ),
                    if (!Responsive.isMobile(context))
                      Text(
                        "Drivers",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        fillColor: secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * 0.75),
                            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SvgPicture.asset("assets/icons/Search.svg"),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 200,
                          width: 450,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Stack(
                                  children: [
                                    PieChart(
                                      PieChartData(
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 70,
                                        startDegreeOffset: -90,
                                        sections: paiChartSelectionData,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: defaultPadding),
                                          Text(
                                            "1262",
                                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.5,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("of 1500")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "Drivers In work",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "1262",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "Driver in break",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "88",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "Driver on Vacation",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "50",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      squrWidget("Percentage of Drivers who are at work", "89%"),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 200,
                          width: 450,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Stack(
                                  children: [
                                    PieChart(
                                      PieChartData(
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 70,
                                        startDegreeOffset: -90,
                                        sections: sexChartSelectionData,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: defaultPadding),
                                          Text(
                                            "600",
                                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              height: 0.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Driver")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "Male",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "570",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              "Female",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "30",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      squrWidget("Total salary", "30k AED"),
                      squrWidget("Total Income", "70k AED"),
                      squrWidget("Total Trip", "450"),
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
                        "All Driver",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("Driver Name"),
                            ),
                            DataColumn(
                              label: Text("Number of Trip"),
                            ),
                            DataColumn(
                              label: Text("Total payments"),
                            ),
                            DataColumn(
                              label: Text("Income"),
                            ),
                            DataColumn(
                              label: Text("salary"),
                            ),
                            DataColumn(
                              label: Text("Details"),
                            ),
                          ],
                          rows: List.generate(
                            listWorkingDriver.length,
                            (index) => workingDriverDataRow(listWorkingDriver[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
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
      padding: const EdgeInsets.all(8),
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

  DataRow workingDriverDataRow(({String driverName, String a, String b, String sallery , String income}) record) {
    return DataRow(
      cells: [
        DataCell(
          Text(record.driverName),
        ),
        DataCell(Text(record.a)),
        DataCell(Text(record.b)),
        DataCell(Text(record.income)),
        DataCell(Text(record.sallery)),
        DataCell(ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.blue),
          ),
          onPressed: () {
            Get.to(()=>TaxiDriverScreen(record:(driverName: record.driverName,status: "a",a: record.a,b:record.b)));
          },
          child: Text("Details"),
        )),
      ],
    );
  }

  List<({String driverName, String a, String b, String sallery , String income})> listWorkingDriver = [
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "800 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "1000 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "4100 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "1240 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "510 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "700 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "1200 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "1000 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "2300 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "750 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "1200 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "510 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "3000 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "2300 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "750 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "890 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "3200 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "1750 AED",income: "3.5 AED",),
    (driverName: "Driver Name", a: "12", b: "3.5 AED", sallery: "1000 AED",income: "3.5 AED",),
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
      color: Colors.green.withOpacity(0.5),
      value: 188,
      showTitle: false,
      radius: 20,
    ),
  ];

  List<PieChartSectionData> sexChartSelectionData = [

    PieChartSectionData(
      color: Colors.cyan,
      value: 570,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.pink.withOpacity(0.5),
      value: 30,
      showTitle: false,
      radius: 20,
    ),
  ];
}
