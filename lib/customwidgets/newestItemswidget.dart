import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewestItemswidget extends StatelessWidget {
  const NewestItemswidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10,horizontal: 10),
        child: Column(
          children: [
            for(int i=1;i<10;i++)
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0,3)
                    )
                  ]
                ),

                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/ithempage");
                      },
                      child:Container(
                        child: Image.asset("assets/images/pizza.jpeg",
                        height: 120,
                        width: 150,),
                      ),
                    ),
                    Container(
                      width: 120,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Pizza",style: TextStyle(
                           fontSize: 22,
                           fontWeight: FontWeight.bold
                         ),),
                         Text("Tast our Hot pizza,we provid our great foods  ",style: TextStyle(
                             fontSize: 15,

                         ),),
                         RatingBar.builder(
                              initialRating:4,
                             minRating: 1,
                             direction:Axis.horizontal,
                             itemCount: 5,
                             itemSize: 17,
                             itemPadding: EdgeInsets.symmetric(horizontal: 4),
                             itemBuilder: (context,_)=>Icon(Icons.star),
                             onRatingUpdate: (index){})

                       ],
                     ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
