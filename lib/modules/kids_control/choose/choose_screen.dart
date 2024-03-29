import 'package:flutter/material.dart';
import 'package:graduation1/modules/kids_control/child_side/childside_screen.dart';
import 'package:graduation1/modules/kids_control/login/login_screen.dart';
import 'package:graduation1/shared/styles/colors.dart';
import '../../../shared/componants/componants.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Choose your agent",
                      style: TextStyle(
                        color: defaultColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Default',
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, LoginScreen(),);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 350,
                  height: 250,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "parent phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Default',
                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Container(
                        width: 250,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage("assets/images/choose1.jpg",),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, ChildSideScreen(),);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 350,
                  height: 250,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Kid phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Default',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Container(
                        width: 250,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/choose2.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
