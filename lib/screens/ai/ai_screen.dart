import 'package:flutter/material.dart';

import 'chart2.dart';
import 'chart3.dart';
import 'chart4.dart';
import 'line_chart1.dart';

class AiScreen extends StatefulWidget {
   AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  PageController pageController = PageController();

  List text = ["Customer Happiness","Efficiency","Providers response speed to users ","oil consumption"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Ai Screen",style: TextStyle(fontSize: 22),),
          ),
        SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: pageController.hasClients&&pageController.page!=0?(){
                      pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear).then((value) => setState(() {}));

                    }:null,
                    child: Icon(Icons.arrow_back_ios_new)),
                SizedBox(
                    width: 500,
                    child: Center(child: Text(text[(pageController.hasClients ?(pageController.page??0):0).toInt() ],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),))),
                InkWell(
                    onTap:  pageController.hasClients&&pageController.page!= 3?(){
                      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear).then((value) => setState(() {}));
                      setState(() {});
                    }:null,
                    child: Icon(Icons.arrow_forward_ios_sharp)),
              ],
            )),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Chart2(),
              Chart3(),
              LineChart1(),
              Chart4(),
            ],
          ),
        )
    ],);
  }
}
