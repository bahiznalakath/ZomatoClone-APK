import 'package:flutter/material.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
              horizontal: 5
        ),
        child: Row(
          children: [
            // for(int i=1;i<10;i++)
            Padding(padding: EdgeInsets.symmetric(
              horizontal: 7
            ),
              child: Container(
                width: 170,
                height: 225,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0,3)
                    )
                  ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/burger.jpeg",
                        height: 130,),
                    ),
                    Text("Hot Burger",
                    style: TextStyle(
                        fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Taste Our Hot Burger",
                      style: TextStyle(
                          fontSize: 15,
                      ),),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rs.179",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                          ),),
                    Icon(
                        Icons.favorite_border,
                    color: Colors.red,
                    size: 16,)
                      ],
                    ),

                  ],
                ),),
              ),

            ),

            Padding(padding: EdgeInsets.symmetric(
                horizontal: 7
            ),
              child: Container(
                width: 170,
                height: 225,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0,3)
                      )
                    ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/pizza.jpeg",
                          height: 130,),
                      ),
                      Text("Pizz",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Taste Our Hot Pizza",
                        style: TextStyle(
                          fontSize: 15,
                        ),),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rs.399",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                            ),),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 16,)
                        ],
                      ),

                    ],
                  ),),
              ),

            ),
            Padding(padding: EdgeInsets.symmetric(
                horizontal: 7
            ),
              child: Container(
                width: 170,
                height: 225,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0,3)
                      )
                    ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/mandione.jpeg",
                          height: 130,),
                      ),
                      Text("Goat Mandi",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Goat Mandi",
                        style: TextStyle(
                          fontSize: 15,
                        ),),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rs.799",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                            ),),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 16,)
                        ],
                      ),

                    ],
                  ),),
              ),

            ),
            Padding(padding: EdgeInsets.symmetric(
                horizontal: 7
            ),
              child: Container(
                width: 170,
                height: 225,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0,3)
                      )
                    ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/manditwo.jpeg",
                          height: 130,),
                      ),
                      Text("Chicken Mandi",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(
                        height: 4,
                      ),
                      Text(" Arabic dish",
                        style: TextStyle(
                          fontSize: 15,
                        ),),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rs.620",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                            ),),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 16,)
                        ],
                      ),

                    ],
                  ),),
              ),

            ),
      Padding(padding: EdgeInsets.symmetric(
          horizontal: 7
      ),
        child: Container(
          width: 170,
          height: 225,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3)
                )
              ]
          ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/biryani.jpeg",
                height: 130,),
            ),
            Text("Biryani",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(
              height: 4,
            ),
            Text("Hyderabadi biryani",
              style: TextStyle(
                fontSize: 15,
              ),),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rs.150",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),),
                Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 16,)
              ],
            ),

          ],
        ),),
    ),
      )
          ],
        ),
      ),
    );
  }
}
