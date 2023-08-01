import 'package:flutter/material.dart';

class CatagoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 5),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/images/coco.png',
                    width: 50,
                    height: 50,),
              ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/manditwo.jpeg',
                    width: 50,
                    height: 50,),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/mandione.jpeg',
                    width: 50,
                    height: 50,),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/salan.jpeg',
                    width: 50,
                    height: 50,),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/biryani.jpeg',
                    width: 50,
                    height: 50,),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/burger.jpeg',
                    width: 50,
                    height: 50,),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/pizza.jpeg',
                    width: 50,
                    height: 50,),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
