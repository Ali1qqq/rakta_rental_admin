import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakta_admin/screens/provider/Provider_Money.dart';



import '../../constants.dart';
import 'Prpvider_users_screen.dart';

class ProviderView extends StatefulWidget {
  const ProviderView({super.key});

  @override
  State<ProviderView> createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView>{
  bool isAdd=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AnimatedCrossFade(
        duration: Duration(milliseconds: 500),
        firstChild: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: Get.height),
          child: ProviderUsersScreen(),
        ),
        secondChild: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: Get.height),
          child: ProviderMoney(),
        ),
        crossFadeState: isAdd ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:primaryColor,
        onPressed: () {
          setState(() {
            isAdd = !isAdd;
          });
        },
        child: Icon(!isAdd? Icons.attach_money_outlined:Icons.grid_view),
      ),
    );
  }
}