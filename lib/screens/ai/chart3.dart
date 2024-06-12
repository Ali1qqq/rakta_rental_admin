import 'package:flutter/material.dart';

class Chart3 extends StatefulWidget {
  const Chart3({super.key});

  @override
  State<Chart3> createState() => _Chart3State();
}

class _Chart3State extends State<Chart3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,
        child: DataTable(
          columnSpacing: 16.0,
          columns: [
            DataColumn(
              label: Text("Provider Name"),
            ),
            DataColumn(
              label: Text("Number of Revers"),
            ),
            DataColumn(
              label: Text("Total Income"),
            ),
            DataColumn(
              label: Text("Operating Costs"),
            ),
            DataColumn(
              label: Text("Percentage Last Month"),
            ),
            DataColumn(
              label: Text("Efficiency Ratio"),
            ),
          ],
          rows: List.generate(
            listWorkingDriver.length, (index) => workingDriverDataRow(listWorkingDriver[index]),
          ),
        ),
      ),
    );
  }

  DataRow workingDriverDataRow(({String providerName, String NumberOfTrip, String TotalIncome, String OperatingCosts, String percentageLastMonth,String percentageLastMonthType, String EfficiencyRatio}) record) {
    return DataRow(
      cells: [
        DataCell(Text(record.providerName),),
        DataCell(Text(record.NumberOfTrip)),
        DataCell(Text(record.TotalIncome+".00 AED")),
        DataCell(Text(record.OperatingCosts+".00 AED")),
        DataCell(Text(record.percentageLastMonth)),
        DataCell(Text(record.EfficiencyRatio, style: TextStyle(color: record.percentageLastMonthType == "down" ? Colors.red : Colors.green),)),
      ],
    );
  }

  List<({String providerName, String NumberOfTrip, String TotalIncome, String OperatingCosts, String percentageLastMonth,String percentageLastMonthType, String EfficiencyRatio})> listWorkingDriver = [
  (providerName: "providerName" ,NumberOfTrip:"25",TotalIncome:"500",OperatingCosts:"100",percentageLastMonth:"80%",percentageLastMonthType:"up",EfficiencyRatio:"90%"),
  (providerName: "providerName" ,NumberOfTrip:"40",TotalIncome:"800",OperatingCosts:"300",percentageLastMonth:"55%",percentageLastMonthType:"up",EfficiencyRatio:"60%"),
  (providerName: "providerName" ,NumberOfTrip:"64",TotalIncome:"752",OperatingCosts:"400",percentageLastMonth:"78%",percentageLastMonthType:"down",EfficiencyRatio:"50%"),
  (providerName: "providerName" ,NumberOfTrip:"45",TotalIncome:"900",OperatingCosts:"250",percentageLastMonth:"67%",percentageLastMonthType:"up",EfficiencyRatio:"%70"),
  (providerName: "providerName" ,NumberOfTrip:"82",TotalIncome:"452",OperatingCosts:"120",percentageLastMonth:"55%",percentageLastMonthType:"down",EfficiencyRatio:"50%"),
  (providerName: "providerName" ,NumberOfTrip:"78",TotalIncome:"925",OperatingCosts:"500",percentageLastMonth:"70%",percentageLastMonthType:"up",EfficiencyRatio:"90%"),
  (providerName: "providerName" ,NumberOfTrip:"75",TotalIncome:"1452",OperatingCosts:"100",percentageLastMonth:"75%",percentageLastMonthType:"down",EfficiencyRatio:"60%"),
  (providerName: "providerName" ,NumberOfTrip:"52",TotalIncome:"500",OperatingCosts:"300",percentageLastMonth:"50%",percentageLastMonthType:"up",EfficiencyRatio:"80%"),
  ];

}
