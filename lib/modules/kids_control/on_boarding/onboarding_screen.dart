import 'package:flutter/material.dart';
import 'package:graduation1/shared/componants/componants.dart';
import 'package:graduation1/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../choose/choose_screen.dart';

class BoardingModel {

  final String image;
  final String title1;
  final String title2;

  BoardingModel({required this.image, required this.title1, required this.title2} );
}
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var broadController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title1: "Protect Your Child From Addition!",
      title2: '',



    ),
    BoardingModel(
      image: 'assets/images/onboarding2.jpg',
      title1: 'Provide Your Child A Safe Digital Experience....',
      title2: '',


    ),
    BoardingModel(
      image: 'assets/images/onboarding3.jpg',
      title1: "Help you set dos and don'ts for their online word...",
      title2: '',



    ),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller:broadController ,
        onPageChanged:(int index) {
          if(index == boarding.length-1)
            {
              setState(() {
                isLast = true;
              });

            }
          else{
            isLast = false;

          }
        },
        itemBuilder: (context, index) => builderBroadingItem(boarding[index]),
          itemCount: boarding.length,),

      );
  }
  Widget builderBroadingItem(BoardingModel model)=> Container(
    decoration:   BoxDecoration(
      image: DecorationImage(
        opacity: .8,
        image: AssetImage('${model.image}'),
        fit: BoxFit.cover,
      ),
    ),
    width: double.infinity,
    height: double.infinity,
    child:  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SafeArea(child:
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('${model.title1}',
                 style: const TextStyle(
                   color: defaultColor,
                   fontWeight: FontWeight.bold,
                   fontSize: 35,

                 ),
               ),
               Text('${model.title2}',
                 style: const TextStyle(
                   color: defaultColor,
                   fontWeight: FontWeight.bold,
                   fontSize: 35,

                 ),
               ),

             ],
           ),
          ),
          const Spacer(),
          const SizedBox(
            height: 100,
          ),
          Center(

            child: SmoothPageIndicator(
                controller: broadController,
                effect:const  ExpandingDotsEffect(
                  dotColor:defaultColor,
                  expansionFactor: 3,
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 5.0,
                ),
                count: boarding.length),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: TextButton(
                  onPressed: (){
                  navigateAndFinish(context, const ChooseScreen(),);

                },
                    child: const Text("skip",
                      style: TextStyle(
                        fontSize: 25,
                          color:Colors.black,
                      ),
                    ),
                ),
              ),
              const Spacer(),
              Container (
                width: 150,
                decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: TextButton(onPressed: (){
                  if(isLast)
                    {
                      navigateAndFinish(context, const ChooseScreen(),);
                    }else
                      {
                        broadController.nextPage(
                          duration:const Duration(milliseconds: 750,
                          ),
                          curve:Curves.easeInToLinear,
                        );
                      }
                },
                  child: const Text("continue",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    ),
  );
}

