
import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dashboard/components/date_table.dart';
import 'Provider_user_details.dart';

class ProviderUsersScreen extends StatelessWidget {
  ProviderUsersScreen({super.key});

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
                        "Provider",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    if (!Responsive.isMobile(context))
                      Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        fillColor: secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * 0.75),
                            margin: EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: secondaryColor),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: defaultPadding),
                                          Text(
                                            "200",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.5,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Providers")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          "170",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                          width: 600,

                          child: DateTables()),
                      /*                 squrWidget("Total Request", "15000"),
                      squrWidget("Customer Happiness Rate", "95%"),*/
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
                              label: Text("Provider Id"),
                            ),
                            DataColumn(
                              label: Text("Provider Name"),
                            ),
                            DataColumn(
                              label: Text("Number of request"),
                            ),
                            DataColumn(
                              label: Text("Revenues"),
                            ),
                            DataColumn(
                              label: Text("Total cars"),
                            ),

                            DataColumn(
                              label: Text("Location"),
                            ),
                            DataColumn(
                              label: Text("Details"),
                            ),
                          ],
                          rows: List.generate(
                            listWorkingDriver.length,
                            (index) =>
                                workingDriverDataRow(listWorkingDriver[index]),
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: secondaryColor),
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

  DataRow workingDriverDataRow(
      ({
        String providerId,
        String providerName,
        String cars,
        String NumberOfRequest,
        String totalAmount,
        String Location
      }) record) {
    return DataRow(
      cells: [
        DataCell(
          Text(record.providerId),
        ),
        DataCell(Text(record.providerName)),
        DataCell(Text(record.NumberOfRequest)),
        DataCell(Text("${record.totalAmount} AED")),
        DataCell(Text(record.cars)),
        DataCell(Text(record.Location)),
        DataCell(Row(
          children: [
            IconButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(primaryColor),
              ),
              onPressed: () {
                Get.to(()=>ProviderUserDetailsScreen(record:record));
              },
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
            IconButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(primaryColor),
              ),
              onPressed: () {
                Get.to(()=>ProviderUserDetailsScreen(record:record));
              },
              icon: Icon(Icons.mode_edit_outlined),
            ),
            IconButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(primaryColor),
              ),
              onPressed: () {
                Get.to(()=>ProviderUserDetailsScreen(record:record));
              },
              icon: Icon(Icons.delete_outline_outlined),
            ),
          ],
        )),

      ],
    );
  }

  List<
      ({
        String providerId,
        String providerName,
        String cars,
        String NumberOfRequest,
        String totalAmount,
        String Location
      })> listWorkingDriver = [
    (providerId: "PROV47382910", providerName: "Green Motion", cars: "18", NumberOfRequest: "154", totalAmount: "97", Location: "Seih Al Harf - Ras Al Khaimah"),
      (providerId: "PROV29837210", providerName: "Budget Rent A Car", cars: "5", NumberOfRequest: "83", totalAmount: "145", Location: "Al Nakheel - Ras Al Khaimah"),
      (providerId: "PROV83749201", providerName: "Hertz", cars: "9", NumberOfRequest: "120", totalAmount: "56", Location: "Downtown Dubai - Dubai"),
      (providerId: "PROV12938475", providerName: "Europcar", cars: "15", NumberOfRequest: "172", totalAmount: "34", Location: "Jumeirah - Dubai"),
      (providerId: "PROV98327401", providerName: "Sixt", cars: "22", NumberOfRequest: "44", totalAmount: "78", Location: "Al Majaz - Sharjah"),
      (providerId: "PROV47291034", providerName: "Avis", cars: "12", NumberOfRequest: "88", totalAmount: "112", Location: "Al Nahda - Sharjah"),
      (providerId: "PROV09281734", providerName: "Thrifty Car Rental", cars: "3", NumberOfRequest: "156", totalAmount: "63", Location: "Al Rashidiya - Ajman"),
      (providerId: "PROV34982710", providerName: "Dollar Rent A Car", cars: "7", NumberOfRequest: "33", totalAmount: "129", Location: "Al Mowaihat - Ajman"),
      (providerId: "PROV12093847", providerName: "Enterprise", cars: "20", NumberOfRequest: "99", totalAmount: "82", Location: "Al Salamah - Umm Al Quwain"),
      (providerId: "PROV98473102", providerName: "National Car Rental", cars: "11", NumberOfRequest: "71", totalAmount: "143", Location: "Yas Island - Abu Dhabi"),
      (providerId: "PROV12749275", providerName: "Alamo", cars: "13", NumberOfRequest: "84", totalAmount: "77", Location: "Al Bateen - Abu Dhabi"),
      (providerId: "PROV29871234", providerName: "Payless Car Rental", cars: "16", NumberOfRequest: "92", totalAmount: "88", Location: "Corniche - Abu Dhabi"),
      (providerId: "PROV93821745", providerName: "Fox Rent A Car", cars: "10", NumberOfRequest: "112", totalAmount: "99", Location: "Al Qusaidat - Ras Al Khaimah"),
      (providerId: "PROV34782918", providerName: "E-Z Rent-A-Car", cars: "19", NumberOfRequest: "154", totalAmount: "56", Location: "Khuzam - Ras Al Khaimah"),
      (providerId: "PROV47293810", providerName: "Advantage Rent A Car", cars: "14", NumberOfRequest: "98", totalAmount: "120", Location: "Al Hamra Village - Ras Al Khaimah"),
      (providerId: "PROV93748102", providerName: "U-Save Car & Truck Rental", cars: "21", NumberOfRequest: "63", totalAmount: "77", Location: "Al Maqta - Abu Dhabi"),
      (providerId: "PROV48273194", providerName: "ACE Rent a Car", cars: "8", NumberOfRequest: "176", totalAmount: "89", Location: "Al Kharran - Ras Al Khaimah"),
      (providerId: "PROV23194857", providerName: "Zoom Rent A Car", cars: "4", NumberOfRequest: "154", totalAmount: "112", Location: "Business Bay - Dubai"),
      (providerId: "PROV39182745", providerName: "Rent-A-Wreck", cars: "11", NumberOfRequest: "72", totalAmount: "143", Location: "Shamal - Ras Al Khaimah"),
      (providerId: "PROV91728345", providerName: "Economy Rent a Car", cars: "17", NumberOfRequest: "61", totalAmount: "98", Location: "Al Khan - Sharjah"),

  ];

  // List<PieChartSectionData> paiChartSelectionData = [
  //   PieChartSectionData(
  //     color: Colors.teal.withOpacity(0.5),
  //     value: 50,
  //     showTitle: false,
  //     radius: 20,
  //   ),
  //   PieChartSectionData(
  //     color: Colors.cyan,
  //     value: 1262,
  //     showTitle: false,
  //     radius: 20,
  //   ),
  //   PieChartSectionData(
  //     color: Colors.green.withOpacity(0.5),
  //     value: 188,
  //     showTitle: false,
  //     radius: 20,
  //   ),
  // ];

  List<PieChartSectionData> sexChartSelectionData = [
    PieChartSectionData(
      color: primaryColor,
      value: 170,
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
