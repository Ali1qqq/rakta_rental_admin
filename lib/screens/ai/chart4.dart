import 'package:flutter/material.dart';

class Chart4 extends StatefulWidget {
  const Chart4({super.key});

  @override
  State<Chart4> createState() => _Chart4State();
}

class _Chart4State extends State<Chart4> {

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
              label: Text("Number of Rivers"),
            ),
            DataColumn(
              label: Text("Total oil consumption"),
            ),
            DataColumn(
              label: Text("Total oil costs"),
            ),
            DataColumn(
              label: Text("Percentage last month"),
            ),
            DataColumn(
              label: Text("oil consumption ratio"),
            ),
          ],
          rows: List.generate(
            listWorkingDriver.length, (index) => workingDriverDataRow(listWorkingDriver[index]),
          ),
        ),
      ),
    );
  }

  DataRow workingDriverDataRow(({String providerName, String NumberOfRiverse, String totalOilConsumption, String totalOilCosts, String percentageLastMonth,String percentageLastMonthType, String oilConsumptionRatio}) record) {
    return DataRow(
      cells: [
        DataCell(Text(record.providerName),),
        DataCell(Text(record.NumberOfRiverse)),
        DataCell(Text(record.totalOilConsumption+" L")),
        DataCell(Text(record.totalOilCosts+".00 AED")),
        DataCell(Text(record.percentageLastMonth)),
        DataCell(Text(record.oilConsumptionRatio, style: TextStyle(color: record.percentageLastMonthType == "down" ? Colors.red : Colors.green),)),
      ],
    );
  }

  List<({String providerName, String NumberOfRiverse, String totalOilConsumption, String totalOilCosts, String percentageLastMonth,String percentageLastMonthType, String oilConsumptionRatio})> listWorkingDriver = [
  (providerName: "providerName" ,NumberOfRiverse:"25",totalOilConsumption:"50",totalOilCosts:"100",percentageLastMonth:"80%",percentageLastMonthType:"up",oilConsumptionRatio:"90%"),
  (providerName: "providerName" ,NumberOfRiverse:"40",totalOilConsumption:"80",totalOilCosts:"300",percentageLastMonth:"55%",percentageLastMonthType:"up",oilConsumptionRatio:"60%"),
  (providerName: "providerName" ,NumberOfRiverse:"64",totalOilConsumption:"72",totalOilCosts:"400",percentageLastMonth:"78%",percentageLastMonthType:"down",oilConsumptionRatio:"50%"),
  (providerName: "providerName" ,NumberOfRiverse:"45",totalOilConsumption:"90",totalOilCosts:"250",percentageLastMonth:"67%",percentageLastMonthType:"up",oilConsumptionRatio:"%70"),
  (providerName: "providerName" ,NumberOfRiverse:"82",totalOilConsumption:"42",totalOilCosts:"120",percentageLastMonth:"55%",percentageLastMonthType:"down",oilConsumptionRatio:"50%"),
  (providerName: "providerName" ,NumberOfRiverse:"78",totalOilConsumption:"95",totalOilCosts:"500",percentageLastMonth:"70%",percentageLastMonthType:"up",oilConsumptionRatio:"90%"),
  (providerName: "providerName" ,NumberOfRiverse:"75",totalOilConsumption:"71",totalOilCosts:"100",percentageLastMonth:"75%",percentageLastMonthType:"down",oilConsumptionRatio:"60%"),
  (providerName: "providerName" ,NumberOfRiverse:"52",totalOilConsumption:"50",totalOilCosts:"300",percentageLastMonth:"50%",percentageLastMonthType:"up",oilConsumptionRatio:"80%"),
  ];

}
