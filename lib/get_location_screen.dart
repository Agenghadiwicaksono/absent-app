import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetlocationScreen extends StatefulWidget {
  const GetlocationScreen({super.key});

  @override
  State<GetlocationScreen> createState() => _GetlocationScreenState();
}

class _GetlocationScreenState extends State<GetlocationScreen> {
  String? latitude;
  String? longitude;
  String? address;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async{
    setState(() {
      isLoading = true;
    });
    try {
      //check permision apps
      LocationPermission permission = await Geolocator.checkPermission();
      //jika denide maka request permision
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            isLoading = false;
            address = 'permision denide';
          });
          return;
        }
      }
      //jika denide forever buka  settings
      if (permission == LocationPermission.deniedForever) {
        setState(() {
          isLoading = false;
          address = 'permision denide forever please enable from settings';
        });
      }

      //mendapatkan lokasi latitude dan longitude
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high)
      );
      //konversi
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      // print(placemarks[0].country);
      Placemark placemark = placemarks[0];
      setState(() {
        isLoading = false;
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
        address = "${placemark.name},${placemark.locality},${placemark.administrativeArea},${placemark.country} ";
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        address ='error dolar $e';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocator and Geocode'),
      ),
      body: Center(
        child: isLoading 
        ? CircularProgressIndicator() 
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Latitude: $latitude, Longitude: $longitude",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            Text( address?? 'no data')
          ],
        ),
      ),
    );
  }
}