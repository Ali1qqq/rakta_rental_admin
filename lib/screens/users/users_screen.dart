import 'dart:math';

import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dashboard/components/date_table.dart';
import 'user_details.dart';

class UsersScreen extends StatelessWidget {
   UsersScreen({super.key});
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
                        "Users",
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
                  alignment: Alignment.center,
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
                                          Text("User")
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
                                          "270",
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
                                          "330",
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
                      squrWidget("Total Request", "15000"),
                      squrWidget("Customer Happiness Rate", "95%"),
                      SizedBox(

                          width:900,child: DateTables()),


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
                        "All Users",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("User Name"),
                            ),
                            DataColumn(
                              label: Text("Number of Revers"),
                            ),
                            DataColumn(
                              label: Text("Total payments"),
                            ),
                            DataColumn(
                              label: Text("Status"),
                            ),
                            DataColumn(
                              label: Text("Gender"),
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
  Widget squrWidget2(title, body) {
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

  DataRow workingDriverDataRow(({String driverName, String a, String b, String status, String sex}) record) {
    return DataRow(
      cells: [
        DataCell(
          Text(record.driverName),
        ),
        DataCell(Text(record.a)),
        DataCell(Text(record.b)),
        DataCell(Text(
          record.status,
          style: TextStyle(color: record.status == "Don't Use App" ? Colors.red : Colors.green),
        )),
        DataCell(Text(
          record.sex,
          style: TextStyle(color: record.sex == "Boy" ? Colors.blue : Colors.pink),
        )),
        DataCell(Row(
          children: [
            IconButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(primaryColor),
              ),
              onPressed: () {
                Get.to(()=>UserDetailsScreen(record:record));
              },
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
            IconButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(primaryColor),
              ),
              onPressed: () {
                Get.to(()=>UserDetailsScreen(record:record));
              },
              icon: Icon(Icons.mode_edit_outlined),
            ),
            IconButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(primaryColor),
              ),
              onPressed: () {

              },
              icon: Icon(Icons.delete_outline_outlined),
            ),
          ],
        )),

      ],
    );
  }

  List<({String driverName, String a, String b, String status, String sex})> listWorkingDriver = [
    (driverName: "User Name", a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Boy"),
    (driverName: "User Name", a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Boy"),
    (driverName: "User Name", a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name", a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Boy"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Boy"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name", a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Boy"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Girl"),
    (driverName: "User Name",  a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
    (driverName: "User Name", a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Don't Use App", sex: "Girl"),
    (driverName: "User Name", a: "${Random().nextInt(20)}", b: "${Random().nextInt(9999)} AED", status: "Use App", sex: "Girl"),
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
      color: primaryColor,
      value: 330,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.pink.withOpacity(0.5),
      value: 270,
      showTitle: false,
      radius: 20,
    ),
  ];
}
