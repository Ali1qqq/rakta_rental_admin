import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rakta_admin/constants.dart';
import 'package:rakta_admin/controller/home_controller.dart';
import 'package:rakta_admin/responsive.dart';
import 'package:rakta_admin/screens/Activity/Activity_screen.dart';
import 'package:rakta_admin/screens/account_management/account_management_screen.dart';
import 'package:rakta_admin/screens/ai/ai_screen.dart';
import 'package:rakta_admin/screens/buses/buses_screen.dart';
import 'package:rakta_admin/screens/cars/cars_screen.dart';
import 'package:rakta_admin/screens/customer_happiness/customer_happiness_screen.dart';
import 'package:rakta_admin/screens/dashboard/dashboard_screen.dart';
import 'package:rakta_admin/screens/drivers/drivers_screen.dart';
import 'package:rakta_admin/screens/ferrys/ferry_screen.dart';
import 'package:rakta_admin/screens/maps/maps_screen.dart';
import 'package:rakta_admin/screens/provider/Prpvider_users_screen.dart';
import 'package:rakta_admin/screens/reports/reports_screen.dart';
import 'package:rakta_admin/screens/settings/settings_screen.dart';
import 'package:rakta_admin/screens/users/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_view/split_view.dart';
import 'package:tab_container/tab_container.dart';

import '../notification/notification_screen.dart';
import '../taxi/taxi_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{
  final text = ["Dashboard", "Users", "Providers", "All Cars","Activity",/* "Taxi", "Buss", "Ferry",*/ "Notification", "Reports", "Maps Center", "AI", "customer Happiness", "Account Management", "Settings"];
  final image = [
    "assets/icons/menu_dashboard.svg",
    "assets/icons/menu_profile.svg",
    "assets/icons/menu_profile.svg",
    "assets/icons/menu_task.svg",
    // "assets/icons/garage.svg",
    "assets/icons/trip.svg",
/*    "assets/icons/car2.svg",
    "assets/icons/bus2.svg",
    "assets/icons/boat2.svg",*/
    "assets/icons/menu_notification.svg",
    "assets/icons/menu_doc.svg",
    "assets/icons/garage.svg",
    "assets/icons/menu_tran.svg",
    "assets/icons/menu_profile.svg",
    "assets/icons/menu_setting.svg",
    "assets/icons/menu_setting.svg",
  ];
  late TabController tabController ;
  @override
  void initState() {
   tabController =  TabController(length: text.length, vsync: this);
   tabController.addListener(() {
     setState(() {});
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: secondaryColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  TabContainer(
                    controller: tabController,
                    tabEdge: TabEdge.left,
                    tabsEnd: 0.95,
                    tabsStart: 0.125,
                    tabMaxLength: 60,
                    tabExtent: 280,
                    borderRadius: BorderRadius.circular(10),
                    tabBorderRadius: BorderRadius.circular(20),
                    childPadding: const EdgeInsets.all(10.0),
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    unselectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                    ),
                    colors:  List.generate(
                        text.length,
                          (index) => bgColor
                    ),
                    tabs: List.generate(
                      text.length,
                          (index) {
                        return DrawerListTile(
                          index: index,
                          title: text[index],
                          svgSrc: image[index],
                          press: () {
                            // controller.changeIndex(index);
                            setState(() {

                            });
                          },
                        );
                          },
                    ),
                    // children: [
                    //   DashboardScreen(),
                    //   UsersScreen(),
                    //   DriverScreen(),
                    //   CarsScreen(),
                    //   TaxiScreen(),
                    //   BusesScreen(),
                    //   FerryScreen(),
                    //   NotificationScreen(),
                    //   ReportsScreen(),
                    //   MapsScreen(),
                    //   AiScreen(),
                    //   CustomerHappinessScreen(),
                    //   AccountManagementScreen(),
                    //   SettingsScreen(),
                    // ],
                    child: IndexedStack(
                      index: tabController.index,
                      children: [
                        DashboardScreen(),
                        UsersScreen(),
                        ProviderUsersScreen(),
                        CarsScreen(),
                        ActivityScreen(),
                    /*    TaxiScreen(),
                        BusesScreen(),
                        FerryScreen(),*/
                        NotificationScreen(),
                        ReportsScreen(),
                        MapsScreen(),
                        AiScreen(),
                        CustomerHappinessScreen(),
                        AccountManagementScreen(),
                        SettingsScreen(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      height: 100,
                      width: 265,
                      child: Image.asset("assets/RAKTA-LOGO.png"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        // return Scaffold(
        //   key: controller.scaffoldKey,
        //   drawer: SideMenu(),
        //   body: SafeArea(
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         // We want this side menu only for large screen
        //         if (Responsive.isDesktop(context))
        //           Expanded(
        //             flex: 15,
        //             child: SideMenu(),
        //           ),
        //         Expanded(
        //           flex: 85,
        //           child: IndexedStack(
        //             index: controller.menuIndex,
        //             children: [
        //               DashboardScreen(),
        //               UsersScreen(),
        //               DriverScreen(),
        //               CarsScreen(),
        //               TaxiScreen(),
        //               BusesScreen(),
        //               FerryScreen(),
        //               NotificationScreen(),
        //               ReportsScreen(),
        //               MapsScreen(),
        //               AiScreen(),
        //               CustomerHappinessScreen(),
        //               AccountManagementScreen(),
        //               SettingsScreen(),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      }
    );
  }

}
class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.index,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 7),
      child: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          // onTap: press,
          horizontalTitleGap: 0.0,
          leading: SizedBox(
            width: 30,
            child: SvgPicture.asset(
              svgSrc,
              colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
              height: 24,
            ),
          ),
          title: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

