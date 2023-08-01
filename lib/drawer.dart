import 'package:Zomato/cartpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Location/Location.dart';
import 'SignUpForm/LogIn.dart';
import 'customwidgets/usermodel.dart';
import 'homescreen.dart';
import 'main.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  User? user = FirebaseAuth.instance.currentUser;
   UserModel loggedInUser = UserModel();
  String? imageUrl;
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    imageUrl = '';
    getImageUrl();
  }

  Future getImageUrl() async {
    final ref = storage.ref().child('bahiz.jpeg');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${loggedInUser.firstName} ${loggedInUser.secondName}'),
            accountEmail: Text('${loggedInUser.email}'),
            currentAccountPicture: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(imageUrl!),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "HOME",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "MY ACCOUNT",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // // Navigate to the account page.
              // // Replace 'AccountPage' with the actual page to navigate to.
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(
              "MY ORDERS",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // // Navigate to the orders page.
              // // Replace 'OrdersPage' with the actual page to navigate to.
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              "MY WISH LIST",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // // Navigate to the wish list page.
              // // Replace 'WishListPage' with the actual page to navigate to.
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            title: Text(
              "LOCATION",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              // Navigate to the location page.
              // Replace 'GetLocation' with the actual page to navigate to.
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => GetLocation()),
                ModalRoute.withName('location'),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "SETTINGS",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "LOGOUT",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: ()  {
              logout(context);
              // await FirebaseAuth.instance.signOut();
              // final pref = await SharedPreferences.getInstance();
              // await pref.clear();
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (BuildContext context) => SighInScreen()),
              //   ModalRoute.withName('/login'),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.delete_forever_rounded),
            title: Text(
              "Delete",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              delete(context);
            },
          ),
        ],
      ),
    );
  }
}
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut().then((value) {
    print("signed out");
    SystemNavigator.pop();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>LoginScreen()));
  });
  final sharedPref = await SharedPreferences.getInstance();
  sharedPref.setBool(SAVE_KEY_NAME, false);

}


Future<void> delete(BuildContext context) async {
  try {
    await FirebaseAuth.instance.currentUser?.delete();
    SystemNavigator.pop();
    print("account deleted");
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  } catch (e) {
    print("Error deleting account: $e");
  }
}
