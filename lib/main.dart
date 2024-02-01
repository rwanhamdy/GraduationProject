import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation1/modules/kids_control/on_boarding/onboarding_screen.dart';


void main()async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splach(),
    );
  }
}


class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  void initState(){
    super.initState();
    Future.delayed( const Duration(seconds: 3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> const OnBoardingScreen()));
    }
    );
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.asset('assets/images/splach1.jpg',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Kids Protect",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight:FontWeight.bold,
            ),
            ),

          ],
        ),
      ),

    );
  }
}


