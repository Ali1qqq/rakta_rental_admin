import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:rating_summary/rating_summary.dart';

import '../../constants.dart';

class CustomerHappinessScreen extends StatelessWidget {
  CustomerHappinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              "Customer Happiness",
              style: TextStyle(fontSize: 30),
            ),
            Center(
                child: Image.asset(
              "assets/face.png",
              width: MediaQuery.sizeOf(context).width / 5,
            )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "Very Happy 4.5 / 5.0",
              style: TextStyle(fontSize: 22),
            )),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rates On App Store",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingSummary(
                      counter: 13,
                      average: 3.846,
                      showAverage: true,
                      counterFiveStars: 5,
                      counterFourStars: 4,
                      counterThreeStars: 2,
                      counterTwoStars: 1,
                      counterOneStars: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: secondaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rates On Google Play",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingSummary(
                      counter: 13,
                      average: 3.846,
                      showAverage: true,
                      counterFiveStars: 5,
                      counterFourStars: 4,
                      counterThreeStars: 2,
                      counterTwoStars: 1,
                      counterOneStars: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Last User Review",style: TextStyle(fontSize: 22),),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(15)),
              child: FutureBuilder(
                future: FirebaseFirestore.instance.collection("Reviews").get(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Container(
                        height: 400,

                        child: Center(child: CircularProgressIndicator(color: Colors.white,),));
                  }
                  print(snapshot.data?.docs.length);
                  List<({String name ,String review ,String type ,  })> review = snapshot.data?.docs.map((ee) => ee.data()).toList().map((e) =>(name:"User ",type: e["slider"].toString(),review:e["opinion"].toString()) ).toList()??[];
                  return ListView.builder(
                    itemCount: review.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      ({String name ,String review ,String type ,  }) model = review[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 15,child: Icon(Icons.person),),
                              SizedBox(width: 5,),
                              Text(model.name),
                              SizedBox(width: 10,),
                              RatingStars(
                                value: double.parse(model.type)*5,
                                // onValueChanged: (v) {
                                //   //
                                //   setState(() {
                                //     value = v;
                                //   });
                                // },
                                starBuilder: (index, color) => Icon(
                                  Icons.star,
                                  color: color,
                                ),
                                starCount: 5,
                                starSize: 20,
                                valueLabelColor: const Color(0xff9b9b9b),
                                valueLabelTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                valueLabelRadius: 10,
                                maxValue: 5,
                                starSpacing: 2,
                                maxValueVisibility: true,
                                valueLabelVisibility: true,
                                animationDuration: Duration(milliseconds: 1000),
                                valueLabelPadding:
                                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                valueLabelMargin: const EdgeInsets.only(right: 8),
                                starOffColor: const Color(0xffe7e8ea),
                                starColor: Colors.yellow,
                              ),
                              // if(model.type=="ok")
                              // Icon(Icons.thumb_up,color: Colors.green,)
                              // else
                              //   Icon(Icons.thumb_down_alt,color: Colors.red,)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text(model.review),
                            ],
                          )
                        ],
                      ),
                    );
                  },);
                }
              ),
            )
          ],
        ),
      ),
    );
  }
  // List<({String name ,String review ,String type ,  })> review =[
  // (name:"User ",type: "ok",review:  "Effortless booking experience! This app is a lifesaver for my daily commute. The real-time updates ensure I'm always on time."),
  // (name:"User ",type: "ok",review:  "Love the convenience! Managing my 'saqr' Ecard and booking rides has never been easier. Highly recommended for anyone in Ras Al Khaimah!"),
  // (name:"User ",type: "no",review:  "Disappointing experience. The app crashes frequently, making it frustrating to use. Needs improvement."),
  // (name:"User ",type: "ok",review:  "Fantastic app! Simple, intuitive, and reliable. The perfect companion for anyone using public transportation in Ras Al Khaimah."),
  // (name:"User ",type: "ok",review:  "Great user experience! The app is well-designed, making it easy to book and track my rides. A must-have for anyone living in or visiting Ras Al Khaimah."),
  // (name:"User ",type: "ok",review:  "Great for travelers! As someone who frequently visits Ras Al Khaimah, this app has made getting around so much easier. A definite must-have."),
  // (name:"User ",type: "no",review:  "Confusing interface. Navigating through the app is not intuitive, and finding the information I need can be a challenge"),
  // (name:"User ",type: "ok",review:  "Top-notch service! The app is reliable, user-friendly, and offers great convenience. I recommend it to anyone looking for a seamless transportation experience."),
  // (name:"User ",type: "ok",review:  "highly efficient! This app has saved me so much time and hassle. I can easily plan and manage my transportation needs with just a few taps."),
  // (name:"User ",type: "ok",review:  "Superb service! The app is fast, efficient, and convenient. I can't imagine navigating Ras Al Khaimah without it"),
  // ];
}
