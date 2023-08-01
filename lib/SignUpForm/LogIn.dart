import 'package:Zomato/LoginwithMoblieNumber/Login_with_moblie_Number.dart';
import 'package:Zomato/SignUpForm/SignUp.dart';
import 'package:Zomato/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/images/zomatologo.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpPage()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Login with Your Moblie Number",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       ElevatedButton(
                         onPressed: () {},
                         child: Image.asset(
                           'assets/images/google.png',
                           width: 50,
                           height: 40,
                         ),
                       ),
                       const SizedBox(width: 10),
                       ElevatedButton(
                         onPressed: () {},
                         child: Image.asset(
                           'assets/images/logo1.png',
                           width: 50,
                           height: 40,
                         ),
                       ),
                       const SizedBox(width: 10),
                       ElevatedButton(
                         onPressed: () {},
                         child: Image.asset(
                           'assets/images/github.png',
                           width: 50,
                          height: 40,
                         ),
                       ),
                     ],
                   ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 90,
            right: 20,
            child: Transform.scale(
              scale: 0.7, // Set the desired scale factor
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                backgroundColor: Colors.white,
                child: Text(
                  "Skip",
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
  );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}

// import 'package:Zomato/homescreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../LoginwithMoblieNumber/Login_with_moblie_Number.dart';
// import '../customwidgets/reusable_widgets.dart';
// import 'SignUp.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class LogInScreen extends StatefulWidget {
//   const LogInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }
//
// class _LogInScreenState extends State<LogInScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   String? errorMessage;
//   TextEditingController passwordTextController = TextEditingController();
//   TextEditingController emailTextController = TextEditingController();
//   // UserModel loggeduser = UserModel();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Colors.red, Colors.redAccent],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter),
//           ),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(
//                   20, MediaQuery.of(context).size.height * 0.2, 20, 0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   logoWidget("assets/images/zomatologo.png"),
//                   Text(
//                     "India's #1 Food Delivery and Dining App",
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     autofocus: false,
//                     controller: emailTextController,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Please Enter Your Email";
//                       }
//                       if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]+").hasMatch(value)) {
//                         return "Please Enter a Valid Email";
//                       }
//                       return null;
//                     },
//
//                     onSaved: (value) {
//                       emailTextController.text = value!;
//                     },
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.mail_outline,
//                         color: Colors.white70,
//                       ),
//                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
//                       hintText: "Email",
//                       labelText: "Enter Email",
//                       labelStyle:
//                           TextStyle(color: Colors.white.withOpacity(0.9)),
//                       filled: true,
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       fillColor: Colors.white.withOpacity(0.3),
//                       border: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(width: 0, style: BorderStyle.none),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextFormField(
//                     autofocus: false,
//                     controller: passwordTextController,
//                     obscureText: true,
//                     validator: (value) {
//                       RegExp regex = RegExp(r'^.{6,}$');
//                       if (value!.isEmpty) {
//                         return "Password is required for login";
//                       }
//                       if (!regex.hasMatch(value)) {
//                         return "Enter valid Password (Min. 6 Character)";
//                       }
//                       return null;
//                     },
//
//                     onSaved: (value) {
//                       passwordTextController.text = value!;
//                     },
//                     textInputAction: TextInputAction.done,
//                     style: TextStyle(color: Colors.white.withOpacity(0.9)),
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.vpn_key,
//                         color: Colors.white70,
//                       ),
//                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
//                       hintText: "Password",
//                       labelText: "Enter Password",
//                       labelStyle:
//                           TextStyle(color: Colors.white.withOpacity(0.9)),
//                       filled: true,
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       fillColor: Colors.white.withOpacity(0.3),
//                       border: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(width: 0, style: BorderStyle.none),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   SizedBox(
//                     width: 350,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         signIn(emailTextController.text,
//                             passwordTextController.text);
//                       },
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       child: const Text(
//                         "LOG IN",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   signUpOption(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 1,
//                         width: 80, // Adjust the width as needed
//                         color: Colors.black,
//                       ),
//                       const SizedBox(width: 8),
//                       // Add some spacing between the line and the text
//                       const Text(
//                         "or",
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       // Add some spacing between the text and the line
//                       Container(
//                         height: 1,
//                         width: 80, // Adjust the width as needed
//                         color: Colors.black,
//                       ),
//                     ],
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Image.asset(
//                           'assets/images/google.png',
//                           width: 50,
//                           height: 40,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Image.asset(
//                           'assets/images/logo1.png',
//                           width: 50,
//                           height: 40,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Image.asset(
//                           'assets/images/github.png',
//                           width: 50,
//                           height: 40,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   const Center(
//                     child: Text(
//                       "By continuing, you agree to our Terms of Services Privacy Policy Content Policy",
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w200,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 70,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           "Don't have an account ? ",
//           style: TextStyle(color: Colors.white70),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => SignUpPage()));
//           },
//           child: Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
//
//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth.signInWithEmailAndPassword(email: email, password: password)
//             .then((uid) => {
//                   Fluttertoast.showToast(msg: "Login Successful"),
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => HomeScreen())),
//                 });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";
//
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }
// }
