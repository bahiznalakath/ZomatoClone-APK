import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'VerifyCodeScreen.dart';
import '../Utils/Utils.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool looding = false;
  String? validationError;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.redAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 35),
                child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      height:300,
                      child: Image.asset(
                        "assets/images/Zomato.jpg",
                        width: MediaQuery.of(context).size.width,
                        height:350 ,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 50),
                  const Text(
                    "India's #1 Food Delivery and Dining App" ,maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: 80, // Adjust the width as needed
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8), // Add some spacing between the line and the text
                        const Text(
                          "Log in or Sign up",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8), // Add some spacing between the text and the line
                        Container(
                          height: 1,
                          width: 80, // Adjust the width as needed
                          color: Colors.white,
                        ),
                      ],
                    ),

                    SizedBox(height: 60,),
                    Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter your proper Phone Number';
                            }
                            return null;
                          },
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Enter Phone Number',
                            filled: true, // Set to true to add white inside color
                            fillColor: Colors.white, // Specify the background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12,),
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              String phoneNumber = phoneNumberController.text.trim();

                              if (phoneNumber.isEmpty) {
                                setState(() {
                                  validationError = 'Enter your proper Phone Number';
                                });
                              } else {
                                setState(() {
                                  validationError = null;
                                });

                                // Perform your desired action when the phone number is valid.
                                // For example, submit the phone number or proceed to the next step.
                                // Add your logic here.
                              }
                            setState(() {
                              looding=true;
                            });
                            auth.verifyPhoneNumber(
                              phoneNumber: phoneNumberController.text,
                                verificationCompleted: (_){
                                  setState(() {
                                    looding=false;
                                  });
                                },
                                verificationFailed: (e){
                                  setState(() {
                                    looding=false;
                                  });
                                  Utils().toastMessage(e.toString());
                                },
                                codeSent: (String verifcationId ,int? toeken){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>VerifyCodeScreen(verifcationId:verifcationId,)));
                                setState(() {
                                  looding=false;
                                });

                                },
                                codeAutoRetrievalTimeout: (e){
                                  Utils().toastMessage(e.toString());
                                  setState(() {
                                    looding=false;
                                  });
                                });

                          },

                            style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all<Color>(Colors.white),

                              shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                              ),
                            ),
                            child: const Text("Continue",
                              style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: 80, // Adjust the width as needed
                              color: Colors.black,
                            ),
                            const SizedBox(width: 8), // Add some spacing between the line and the text
                            const Text(
                              "or",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8), // Add some spacing between the text and the line
                            Container(
                              height: 1,
                              width: 80, // Adjust the width as needed
                              color: Colors.black,
                            ),
                          ],
                        ),

                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ElevatedButton(onPressed: (){},
                    //         child:Image.asset(
                    //           'assets/images/google.png',
                    //           width: 50,
                    //           height: 40,
                    //         ),),
                    //     const  SizedBox(width: 10),
                    //     ElevatedButton(onPressed: (){},
                    //       child:Image.asset(
                    //         'assets/images/logo1.png',
                    //         width: 50,
                    //         height: 40,
                    //       ),),
                    //     const  SizedBox(width: 10),
                    //     ElevatedButton(onPressed: (){},
                    //       child:Image.asset(
                    //         'assets/images/github.png',
                    //         width: 50,
                    //         height: 40,
                    //       ),),
                    //   ],
                    // ),SizedBox(height: 75,),
                    const SizedBox(height: 20,),
                    const Center(
                      child:  Text(
                        "By continuing, you agree to our Terms of Services Privacy Policy Content Policy",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:  TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      )
                    ),
                    const SizedBox(height: 500,),
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
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            backgroundColor: Colors.white,
            child: Text("Skip"),
          ),
        )

      ])
    );
  }
  String? validatePhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter your proper Phone Number';
    }
    // You can add additional validation logic for the phone number format if needed.
    // For example, check if it has the correct length or format.
    // Add your validation rules here.

    // If the phone number is valid, return null.
    return null;
  }
}

