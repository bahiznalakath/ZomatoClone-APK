import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../drawer.dart';
import 'exampleloc.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  late Position position;
  String placeName ="";
  String pinCode="";

  Future getpermisstion() async{
    bool serviceEnabled;
    LocationPermission permission;

    permission =await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission=await Geolocator.requestPermission();
      if(permission==LocationPermission.denied){
        //return  Futer .error ("loaction permistion denied")
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    serviceEnabled =await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      Geolocator.openLocationSettings();
      return false;
    }
    return true;
  }
  Future getAddressFromPosition(Position position)async{
    try{
      List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
      print('PlaceMark = $placemark');
      Placemark place = placemark[0];
      print('Place = $place');


      setState(() {
        placeName = place.locality!;
        pinCode = place.postalCode!;

      });

    }catch(e){
      print("Error =$e");

    }
  }

  Future getLoction() async{
    bool result = await getpermisstion();
    if( result== true){
      print('permisstion grandedd');
      position= await Geolocator.getCurrentPosition();
      getAddressFromPosition(position);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title:  const Text("Location",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.redAccent[100],
      ),
      backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
          color: Colors.black,
            width: 2,
          ),
          ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place = $placeName",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PlaceCode = $pinCode",
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(onPressed: (){
                    getLoction();
                  },
                      child: Text('Ok')),

                  ElevatedButton(onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GeolocatorWidget()));
                  }, child: Text('ExAMPLE FORM '))

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
