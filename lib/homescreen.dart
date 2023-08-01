import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidgets/appbarwidget.dart';
import 'customwidgets/catagorieswidget.dart';
import 'customwidgets/newestItemswidget.dart';
import 'drawer.dart';
import 'customwidgets/popularitems.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: ListView(
       children: [
         AppBarWidget(),
         Padding(
             padding:   EdgeInsets.symmetric(
                 vertical: 10,
                 horizontal: 15),
           child: Container(
             width: double.infinity,
             height: 50,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20),
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.2),
                   spreadRadius: 2,
                   blurRadius: 10,
                   offset:   Offset(0,3),
                 )]),
             child: Padding(padding:  EdgeInsets.symmetric(
               horizontal: 10
             ),
               child: Row(
                 children: [
                    Icon(CupertinoIcons.search,
                   color: Colors.red,),
                   Container(
                     height: 50,
                     width: 250,
                     child: Padding(padding: EdgeInsets.symmetric(
                       horizontal: 15,
                     ),
                     child: TextFormField(
                       decoration:  InputDecoration(
                         hintText: "what would you like to have ?",
                         border: InputBorder.none
                       ),
                     ),),
                   ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.filter_list),
                    ),
                 ],
               ),
             ),
           ),
         ),
         Padding(padding: const EdgeInsets.only(top: 20,left:10),
         child: Text("Catagories",
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 20,
         ),),
         ),
         CatagoriesWidget(),
         Padding(padding: const EdgeInsets.only(top: 20,left:10),
           child: Text("Popular Items",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),),
         ),
         PopularItems(),

         Padding(padding: const EdgeInsets.only(top: 20,left:10),
           child: Text("Newest",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),),
         ),
         NewestItemswidget(),
       ],
     ),
        drawer: DrawerWidget(),
        floatingActionButton: Stack(
            children: [
              Positioned(
                bottom: 30,
                right: 18,
                child: SizedBox(
                  width: 60, // Set the desired width
                  height: 60, // Set the desired height
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cart');
                    },
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.red,
                      size: 30, // Set the size of the icon
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
                )

              )

            ])
    );


  }
}
