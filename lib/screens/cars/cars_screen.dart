import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: GetBuilder<HomeController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Cars",
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


                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.start,

                    children: [
                      squrWidget2(),
                      Container(
                        margin:const EdgeInsets.only(top: 8.0) ,
                        height: 300,
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
                                            "Working Car",
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
                                            "Stopped Car",
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
                                            "maintenance Car",
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
                      squrWidget("Order waiting provider confirm", "5"),
                      squrWidget("Estimate price", "10,540,050 AED"),
                      squrWidget("Available car working", "500"),
                      squrWidget("Stopped Car in maintenance crag", "300"),
                      squrWidget("Total fuel consumption", "500L"),
                      squrWidget("Average fuel consumption", "30L"),
                    ],
                  ),
                ),
                SizedBox(height: defaultPadding),

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
                        "All Cars",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [

                            DataColumn(
                              label: Text("Car Type"),
                            ),
                            DataColumn(
                              label: Text("Provider Name"),
                            ),
                            DataColumn(
                              label: Text("Number of Reverse"),
                            ),
                            DataColumn(
                              label: Text("Total Income"),
                            ),

                            DataColumn(
                              label: Text("Status"),
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
              textAlign: TextAlign.center,

            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
  Widget squrWidget2() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 300,
        width: 600,
padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Car Rent in day",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor,)
                  ),
               
                  child: BarChartSample3()),
            ),
          ],
        ),
      ),
    );
  }

  DataRow workingDriverDataRow(({String carType,String fullCarName,String driverName, String numberOfTrip, String totalIncome, String Status}) record) {
    return DataRow(
      cells: [

        DataCell(
          SizedBox(
            width: 200,
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 60,
                  child: Image.asset(
                      record.carType == "Tesla"
                          ?"assets/Tesla.png":record.carType == "Toyota"?"assets/Toyota.png":"assets/higer.png"),
                ),
                SizedBox(width: 5,),
                Text(record.fullCarName),
              ],
            ),
          ),
        ),
        DataCell(Text(record.driverName)),
        DataCell(Text(record.numberOfTrip)),
        DataCell(Text(
          record.totalIncome,
        )),
        DataCell(Text(
          record.Status,
          style: TextStyle(color: record.Status == "Working" ? Colors.green : Colors.red),
        )),
      ],
    );
  }

  List<({String carType,String fullCarName,String driverName, String numberOfTrip, String totalIncome, String Status})> listWorkingDriver = [
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "4532.00 AED", Status: "Working"),
    (carType:"Higer",driverName:"Provider Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "1,375.00 AED", Status: "in carriage"),
    (carType:"Toyota",driverName:"Provider Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "753.00 AED", Status: "In maintenance"),
    (carType:"Higer",driverName:"Provider Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "1,024.00 AED", Status: "in carriage"),
    (carType:"Higer",driverName:"Provider Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "712.00 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "2,435.00 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Provider Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "4,572.00 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "764.00 AED", Status: "in carriage"),
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "350.00 AED", Status: "Working"),
    (carType:"Higer",driverName:"Provider Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "380.00 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "1,347.00 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Provider Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "2,457.00 AED", Status: "In maintenance"),
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "1,430.00 AED", Status: "in carriage"),
    (carType:"Higer",driverName:"Provider Name",fullCarName: "Higer 2020", numberOfTrip: "12", totalIncome: "1,240.00 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Provider Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "753.00 AED", Status: "Working"),
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "954.00 AED", Status: "In maintenance"),
    (carType:"Toyota",driverName:"Provider Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "500.00 AED", Status: "Working"),
    (carType:"Toyota",driverName:"Provider Name",fullCarName: "Toyota 2022", numberOfTrip: "12", totalIncome: "3,552.00 AED", Status: "in carriage"),
    (carType:"Tesla",driverName:"Provider Name",fullCarName: "Tesla Model X", numberOfTrip: "12", totalIncome: "605.00 AED", Status: "In maintenance"),
  ];

  List<PieChartSectionData> paiChartSelectionData = [
    PieChartSectionData(
      color: Colors.teal.withOpacity(0.5),
      value: 50,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: primaryColor,
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

  List<PieChartSectionData> StatusChartSelectionData = [

    PieChartSectionData(
      color: Colors.cyan,
      value: 45,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: Colors.pink.withOpacity(0.5),
      value: 55,
      showTitle: false,
      radius: 20,
    ),
  ];
}



class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: true),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mn';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  LinearGradient get _barsGradient => LinearGradient(
    colors: [
     primaryColor,
     primaryColor
      // AppColors.contentColorCyan,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 8,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: 14,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: 15,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: 13,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
  ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return _BarChart();
  }
}