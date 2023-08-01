import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Utils/Utils.dart';
import 'package:Zomato/homescreen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verifcationId;

  const VerifyCodeScreen({Key? key, required this.verifcationId})
      : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool looding = false;
  final verifyController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextFormField(
              controller: verifyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  // prefixIcon:const Icon(Icons.phone),
                  hintText: '6 digit code',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ))),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      looding = true;
                    });
                    final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verifcationId,
                        smsCode: verifyController.text.toString());
                    try {
                      await auth.signInWithCredential(credential);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } catch (e) {
                      setState(() {
                        looding = false;
                      });
                      Utils().toastMessage(e.toString());
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
