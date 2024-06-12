import 'package:rakta_admin/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';



class AccountManagementScreen extends StatefulWidget {
   AccountManagementScreen({super.key});

  @override
  State<AccountManagementScreen> createState() => _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  String? role;
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
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
                        "Account Management",
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
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            hintText: "User Name",
                            fillColor: secondaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        )),
                    SizedBox(width: 20,),
                    Expanded(
                        child: TextField(
                          controller: pass,
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: secondaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        )),
                    SizedBox(width: 20,),
                    Expanded(
                        child: DropdownButton(
                          value: role,
                          isExpanded: true,
                          onChanged: (_){
                            role = _;
                            setState(() {

                            });
                          },
                          items: ["Admin","Employ","Watch"].map((e) => DropdownMenuItem(value: e,child: Text(e.toString()))).toList(),
                        )),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: (){
                        listWorkingDriver.add((a: role!,status: "Offline",mangerName: name.text));
                        name.clear();
                        pass.clear();
                        role=null;
                        setState(() {

                        });
                      },
                      child: Container(
                          height: 55,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(15)),
                          child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 22),)),
                        ),
                    ),

                  ],
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
                        "All User",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("Manager Name"),
                            ),
                            DataColumn(
                              label: Text("Role"),
                            ),
                            DataColumn(
                              label: Text("Status"),
                            ),
                            DataColumn(
                              label: Text("Operation"),
                            ),
                          ],
                          rows: List.generate(
                            listWorkingDriver.length,
                            (index) => workingDriverDataRow(listWorkingDriver[index],index),
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


  DataRow workingDriverDataRow(({String mangerName, String a,  String status}) record,index) {
    return DataRow(
      cells: [
        DataCell(
          Text(record.mangerName),
        ),
        DataCell(Text(record.a)),
        DataCell(Text(
          record.status,
          style: TextStyle(color: record.status == "Offline" ? Colors.red : Colors.green),
        )),
        DataCell(ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.red),
          ),
          onPressed: () {
            setState((){
              listWorkingDriver.removeAt(index);
            });
          },
          child: Text("Delete Account"),
        )),
      ],
    );
  }

  List<({String mangerName, String a, String status})> listWorkingDriver = [
    (mangerName: "Manger Name", a: "Admin", status: "Online", ),
    (mangerName: "Manger Name", a: "Admin", status: "Online", ),
    (mangerName: "Manger Name", a: "Admin", status: "Offline", ),
    (mangerName: "Manger Name", a: "Admin", status: "Online", ),
    (mangerName: "Manger Name", a: "Admin", status: "Offline", ),
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
