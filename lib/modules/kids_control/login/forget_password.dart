import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation1/shared/styles/colors.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();

}

class _ForgetPasswordState extends State<ForgetPassword> {


  var emailController = TextEditingController();
  var formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/resetback.png",
            ),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Form(
          key: formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SafeArea(
                        child: Text(
                            'Reset Your Password',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: defaultColor,
                            ),
                        ),
                    ),
                  ),
                  SizedBox(height: 64,),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'The EmailAddress Must Contain @';
                      }
                    },
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      labelText: 'Email',
                      hintText: ' enter your email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 35,),
                  Container(
                    width: 200,
                    height: 60,
                    decoration:  BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      child: Text(
                          'Reset Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                      onPressed: (){
                        _ForgetPasswordSend();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


void _ForgetPasswordSend()async {
    if(formkey.currentState!.validate()) {
        await FirebaseAuth.instance.sendPasswordResetEmail(
            email: emailController.text.trim());
        Fluttertoast.showToast(
            msg: "Done! ,Check Your Email :).",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: defaultColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
    }
}

}
