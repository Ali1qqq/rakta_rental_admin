import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../constants.dart';
import '../../controller/home_controller.dart';
import '../../responsive.dart';
import '../dashboard/components/date_table.dart';

class ProviderMoney extends StatefulWidget {
  const ProviderMoney({super.key});

  @override
  State<ProviderMoney> createState() => _ProviderMoneyState();
}

class _ProviderMoneyState extends State<ProviderMoney> {
  int indexs = 0;

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
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 25,
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
                                            "50800.0",
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
                                          Text("AED")
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
                                              "Provider commission",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "35400.0",
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
                                              "Admin Commission",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "15400.0",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
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
                      squrWidget("Total Money Transferred", "95%"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                        width: 250,
                        child: DropdownButtonFormField(
                          items: listProviders
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.providerName),
                                  ))
                              .toList(),
                          onChanged: (v) {},
                          borderRadius: BorderRadius.circular(10),
                          decoration:  InputDecoration(
                            labelText: "Provider",
                            labelStyle: TextStyle(color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor,width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBorder:UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor,width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),
                        )),
                    SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                        width: 250,
                        child: DropdownButtonFormField(
                          items: listProviders
                              .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.providerName,overflow: TextOverflow.ellipsis,),
                          ))
                              .toList(),
                          onChanged: (v) {},
                          borderRadius: BorderRadius.circular(10),
                          decoration:  InputDecoration(
                            labelText: "Date",
                            labelStyle: TextStyle(color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor,width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBorder:UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor,width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),
                        )),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        indexs = 0;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: Durations.long1,
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25)),
                            color: indexs == 0
                                ? Colors.grey
                                : Colors.grey.withOpacity(0.3)),
                        child: Center(
                          child: Text(
                            "Dues",
                            style: TextStyle(
                                color: indexs == 0
                                    ? Colors.black
                                    : Colors.grey.withOpacity(0.3)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        indexs = 1;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: Durations.long1,
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(25)),
                            color: indexs == 1
                                ? Colors.grey
                                : Colors.grey.withOpacity(0.3)),
                        child: Center(
                          child: Text(
                            "Payments",
                            style: TextStyle(
                                color: indexs == 1
                                    ? Colors.black
                                    : Colors.grey.withOpacity(0.3)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                ListView.separated(
                    itemCount: 15,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, indexF) {
                      int index = indexs == 0 ? indexF + 1 : indexF + 1 + 14;
                      int index2 = indexs == 0 ? indexF + 1 : indexF + 1 + 14;
                      int index3 = indexs == 0 ? indexF + 2 : indexF + 2 + 14;
                      int index4 = indexs == 0 ? indexF + 3 : indexF + 3 + 14;
                      return Row(
                        children: [
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(25),
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: secondaryColor),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      listProviders[index].amount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    indexs == 1
                                        ? Text(
                                            "Completed",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.green),
                                          )
                                        : Text(
                                            listProviders[index].date,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          )
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text("Provider",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index].providerName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Payments",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index].providerPay,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Refunds",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index].providerRefund,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(25),
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: secondaryColor),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      listProviders[index2].amount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    indexs == 1
                                        ? Text(
                                            "Completed",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.green),
                                          )
                                        : Text(
                                            listProviders[index2].date,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          )
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text("Provider",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index2].providerName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Payments",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index2].providerPay,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Refunds",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index2].providerRefund,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(25),
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: secondaryColor),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      listProviders[index3].amount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    indexs == 1
                                        ? Text(
                                            "Completed",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.green),
                                          )
                                        : Text(
                                            listProviders[index3].date,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          )
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text("Provider",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index3].providerName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Payments",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index3].providerPay,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Refunds",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index3].providerRefund,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(25),
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: secondaryColor),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      listProviders[index4].amount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    indexs == 1
                                        ? Text(
                                            "Completed",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.green),
                                          )
                                        : Text(
                                            listProviders[index4].date,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          )
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text("Provider",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index4].providerName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Payments",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index4].providerPay,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text("Refunds",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Spacer(),
                                    Text(listProviders[index4].providerRefund,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      );
                    })
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

  Widget squrWidget2(title, body) {
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

  List<
      ({
        String providerName,
        String providerPay,
        String date,
        String providerRefund,
        String amount
      })> listProviders = [
    (
      providerName: "Green Car",
      providerPay: "5400",
      providerRefund: "0",
      amount: "5000",
      date: "30 Jun, 2024"
    ),
    (
      providerName: "Speedy Rentals",
      providerPay: "6800",
      providerRefund: "200",
      amount: "6600",
      date: "01 Jul, 2024"
    ),
    (
      providerName: "Luxury Rides",
      providerPay: "7500",
      providerRefund: "500",
      amount: "7000",
      date: "02 Jul, 2024"
    ),
    (
      providerName: "Fast Wheels",
      providerPay: "6200",
      providerRefund: "0",
      amount: "6200",
      date: "03 Jul, 2024"
    ),
    (
      providerName: "City Car Rentals",
      providerPay: "5800",
      providerRefund: "100",
      amount: "5700",
      date: "04 Jul, 2024"
    ),
    (
      providerName: "Sunshine Motors",
      providerPay: "6000",
      providerRefund: "0",
      amount: "6000",
      date: "05 Jul, 2024"
    ),
    (
      providerName: "Urban Drive",
      providerPay: "7200",
      providerRefund: "300",
      amount: "6900",
      date: "06 Jul, 2024"
    ),
    (
      providerName: "Elite Cars",
      providerPay: "8100",
      providerRefund: "400",
      amount: "7700",
      date: "07 Jul, 2024"
    ),
    (
      providerName: "Prime Rentals",
      providerPay: "7000",
      providerRefund: "200",
      amount: "6800",
      date: "08 Jul, 2024"
    ),
    (
      providerName: "Desert Drive",
      providerPay: "6600",
      providerRefund: "0",
      amount: "6600",
      date: "09 Jul, 2024"
    ),
    (
      providerName: "Oasis Cars",
      providerPay: "7300",
      providerRefund: "100",
      amount: "7200",
      date: "10 Jul, 2024"
    ),
    (
      providerName: "Royal Rides",
      providerPay: "6800",
      providerRefund: "0",
      amount: "6800",
      date: "11 Jul, 2024"
    ),
    (
      providerName: "Dubai Auto",
      providerPay: "7500",
      providerRefund: "200",
      amount: "7300",
      date: "12 Jul, 2024"
    ),
    (
      providerName: "Skyline Rentals",
      providerPay: "7800",
      providerRefund: "300",
      amount: "7500",
      date: "13 Jul, 2024"
    ),
    (
      providerName: "Metro Cars",
      providerPay: "8200",
      providerRefund: "100",
      amount: "8100",
      date: "14 Jul, 2024"
    ),
    (
      providerName: "Vista Wheels",
      providerPay: "6600",
      providerRefund: "0",
      amount: "6600",
      date: "15 Jul, 2024"
    ),
    (
      providerName: "Golden Rentals",
      providerPay: "7100",
      providerRefund: "200",
      amount: "6900",
      date: "16 Jul, 2024"
    ),
    (
      providerName: "Crystal Car Hire",
      providerPay: "6700",
      providerRefund: "0",
      amount: "6700",
      date: "17 Jul, 2024"
    ),
    (
      providerName: "Blue Lagoon Rentals",
      providerPay: "7300",
      providerRefund: "300",
      amount: "7000",
      date: "18 Jul, 2024"
    ),
    (
      providerName: "Pearl Motors",
      providerPay: "8000",
      providerRefund: "400",
      amount: "7600",
      date: "19 Jul, 2024"
    ),
    (
      providerName: "Sunset Cars",
      providerPay: "7500",
      providerRefund: "200",
      amount: "7300",
      date: "20 Jul, 2024"
    ),
    (
      providerName: "Rainbow Rentals",
      providerPay: "7900",
      providerRefund: "100",
      amount: "7800",
      date: "21 Jul, 2024"
    ),
    (
      providerName: "Diamond Drives",
      providerPay: "8100",
      providerRefund: "0",
      amount: "8100",
      date: "22 Jul, 2024"
    ),
    (
      providerName: "Emerald Rides",
      providerPay: "6400",
      providerRefund: "300",
      amount: "6100",
      date: "23 Jul, 2024"
    ),
    (
      providerName: "Top Gear",
      providerPay: "7200",
      providerRefund: "200",
      amount: "7000",
      date: "24 Jul, 2024"
    ),
    (
      providerName: "Zoom Cars",
      providerPay: "6800",
      providerRefund: "0",
      amount: "6800",
      date: "25 Jul, 2024"
    ),
    (
      providerName: "Swift Rentals",
      providerPay: "7000",
      providerRefund: "100",
      amount: "6900",
      date: "26 Jul, 2024"
    ),
    (
      providerName: "Grand Auto",
      providerPay: "7800",
      providerRefund: "200",
      amount: "7600",
      date: "27 Jul, 2024"
    ),
    (
      providerName: "Ocean Drive",
      providerPay: "7700",
      providerRefund: "300",
      amount: "7400",
      date: "28 Jul, 2024"
    ),
    (
      providerName: "Coral Cars",
      providerPay: "7500",
      providerRefund: "0",
      amount: "7500",
      date: "29 Jul, 2024"
    ),
    (
      providerName: "Urban Motors",
      providerPay: "8100",
      providerRefund: "100",
      amount: "8000",
      date: "30 Jul, 2024"
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
