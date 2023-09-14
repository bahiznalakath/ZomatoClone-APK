import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Zomato/homescreen.dart';
import '../customwidgets/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  TextEditingController confrompasswordTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController firstTextController = TextEditingController();
  TextEditingController secondTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 8,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.redAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: false,
                  controller: firstTextController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Yourfirst name";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    firstTextController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.white70,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                    hintText: "first name",
                    labelText: "first name",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                // reusableTextField("Enter UserName", Icons.verified_user, true,
                //     userTextController),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: false,
                  controller: secondTextController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter second name ";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    secondTextController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.white70,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                    hintText: "Second name",
                    labelText: "second name",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // reusableTextField(
                //     "Enter Email id", Icons.mail, true, emailTextController),
                TextFormField(
                  autofocus: false,
                  controller: emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Email";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Please Enter a Valid Email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailTextController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.white70,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                    hintText: "Email",
                    labelText: "Enter Email",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: false,
                  controller: passwordTextController,
                  obscureText: true,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return "Password is required for login";
                    }
                    if (!regex.hasMatch(value)) {
                      return "Enter valid Password (Min. 6 Character)";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passwordTextController.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.white70,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                    hintText: "Password",
                    labelText: "Enter Password",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //textformfelid
                TextFormField(
                  autofocus: false,
                  controller: confrompasswordTextController,
                  obscureText: true,
                  validator: (value) {
                    if (confrompasswordTextController.text.length >
                        6 && passwordTextController.text != value) {
                      return "Password don't match";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    confrompasswordTextController.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.white70,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                    hintText: "Password",
                    labelText: "Conform Password",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailTextController.text,
                              password: passwordTextController.text)
                          .then((value) {
                        print('successfull created a account');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("ERROR ${error.toString()}");
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstTextController.text;
    userModel.secondName = secondTextController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
