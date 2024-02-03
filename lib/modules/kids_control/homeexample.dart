import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation1/main.dart';
import '../../shared/componants/componants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()async {
                await FirebaseAuth.instance.signOut();
                navigateTo(context, Splach(),);
              },
              icon: Icon(FontAwesomeIcons.signOut),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'You In HomePage',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Default',
          ),
        ),
      ),
    );
  }
}
