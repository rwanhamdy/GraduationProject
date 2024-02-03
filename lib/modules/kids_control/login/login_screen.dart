import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation1/modules/kids_control/homeexample.dart';
import 'package:graduation1/modules/kids_control/login/forget_password.dart';
import 'package:graduation1/shared/componants/componants.dart';
import 'package:graduation1/shared/styles/colors.dart';
import 'package:icon_icons/icon_icons.dart';
import '../signup/signup_screen.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    var formkey = GlobalKey<FormState>();


    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool _IsShow = true;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/sginin.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: defaultColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Default',
                      ),
                    ),
                    Text(
                      "     Now!",
                      style: TextStyle(
                        fontSize: 30,
                        color: defaultColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Default',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
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
                    SizedBox(
                      height: 20,
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
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
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
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        labelText: 'Password',
                        hintText: ' enter your password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgetPassword()));
                          },
                          child: Text(
                            " Forget Password ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Default',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 200,
                      height: 60,
                      decoration:  BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          _SigninAuth();
                        },
                        child: Text('SignIn',style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account ?",
                        ),
                        TextButton(onPressed: () {
                          navigateTo(context, SignUpScreen(),);
                        },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
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
                        SizedBox(
                          width: 12,
                        ),
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
          ],
        ),
      ),
    );
  }

//Firebase Space
void _SigninAuth() async {
    if(formkey.currentState!.validate()){
      try {
        var credential = await FirebaseAuth
            .instance
            .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text,
        );
        if(credential.user!.emailVerified){
          Fluttertoast.showToast(
              msg: "Welcome To KidsControl Application :)",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: defaultColor,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()) ,(route) => false,);
        }else{
          Fluttertoast.showToast(
              msg: "Email Address Must Verified..",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          Fluttertoast.showToast(
              msg: "No user found for that email..",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          Fluttertoast.showToast(
              msg: "Wrong password provided for that user.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }catch(e){
        Fluttertoast.showToast(
            msg: "${e.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
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
