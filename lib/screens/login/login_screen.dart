import 'package:rakta_admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width/3,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1),borderRadius: BorderRadius.circular(10)),
                  child: Image.asset("assets/RAKTA-LOGO.png",)),
              SizedBox(height: 100,),
              Container(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login To the Saqr Dashboard",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey.shade300),),
                    SizedBox(height: 50,),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "User Name",
                        fillColor: bgColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    TextField(
                      controller: passwordController,
                      obscureText: isSecure,
                      decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: bgColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: GestureDetector(
                          onLongPressDown: (_){
                            isSecure=false;
                            setState(() {});
                          },
                          onLongPressUp: (){
                          isSecure=true;
                          setState(() {});
                        },
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * 0.75),
                            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Icon(Icons.remove_red_eye_sharp,size: 20,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    InkWell(
                      onTap: () {
                        Get.offAll(()=>MainScreen());
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(defaultPadding * 0.75),
                        // margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(child: Text("Login", style: TextStyle(fontSize: 22,color: Colors.white),)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
