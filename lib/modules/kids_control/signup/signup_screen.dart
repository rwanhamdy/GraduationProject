import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation1/modules/kids_control/homeexample.dart';
import 'package:graduation1/modules/kids_control/login/login_screen.dart';
import 'package:graduation1/shared/styles/colors.dart';
import 'package:icon_icons/icon_icons.dart';

import '../../../shared/componants/componants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    bool _IsShow =true;
    bool _IsShowTwo =true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: defaultColor,
                        fontFamily: 'Default',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The EmailAddress Must Contain @';
                    }
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined
                    ),
                    labelText: 'Email',
                    hintText: ' enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The name Must Not Be Empty';
                    }
                  },
                  onFieldSubmitted: ( String value){
                    print(value);
                  },
                  onChanged: ( String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.person
                    ),
                    labelText: 'Name',
                    hintText: ' User Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  obscureText: _IsShow,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Password Must Not Be Empty';
                    }
                  },
                  onFieldSubmitted: ( String value){
                    print(value);

                  },
                  onChanged: ( String value){
                    print(value);

                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.lock
                    ),
                    suffixIcon:IconButton(
                      onPressed: (){
                        setState(() {
                          _IsShow = !_IsShow;
                        });
                      },
                      icon: _IsShow ? Icon(
                        Icons.visibility_off,
                      )
                          : Icon(Icons.visibility),
                    ),
                    labelText: 'Password',
                    hintText: ' enter your password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  obscureText: _IsShowTwo,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'The Password Must Not Be Empty';
                    }
                  },
                  onFieldSubmitted: ( String value){
                    print(value);

                  },
                  onChanged: ( String value){
                    print(value);

                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.lock
                    ),
                     suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _IsShowTwo = !_IsShowTwo;
                        });
                      },
                      icon: _IsShowTwo ? Icon(
                        Icons.visibility_off,
                      )
                          : Icon(Icons.visibility),
                    ),
                    labelText: ' Confirm Password',
                    hintText: ' confirm your password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 43,
                  decoration:  BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      _SignupAuth();
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Default',
                    ),
                    ),
                  ),
                ),
                SizedBox (
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          _signInWithFacebook();
                        },
                        icon:
                        IconIcons.facebook(
                          width: 50.0,
                          height: 50.0,
                        )
                    ),
                    SizedBox(width: 12,),
                    TextButton(
                      onPressed: () {
                        _signInWithGoogle();
                      },
                      child: Image.asset("assets/images/GoogleIcon.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

void _SignupAuth()async {
    if(formkey.currentState!.validate()){
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Fluttertoast.showToast(
            msg: "The Account Created Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: defaultColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          Fluttertoast.showToast(
              msg: "The password provided is too weak.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Fluttertoast.showToast(
              msg: "The account already exists for that email.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

void _signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()) ,(route) => false,);
    }

void _signInWithFacebook() async {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()) ,(route) => false,);
    }
}
