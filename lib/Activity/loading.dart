import 'package:flutter/material.dart';
import 'package:whether/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  String temp="";
  String hum="";
  String air="";
  String desc="";
  String maindesc="";
  String picicon="";
  String city="Chittagong";
  String tempfeel="";

  void startapp(String city) async{
    worker instance=worker(location: city);
    await instance.getData();
    temp=instance.temp;
    hum=instance.humidity;
    air=instance.airspeed;
    desc=instance.description;
    maindesc=instance.main;
    picicon=instance.icon;
    tempfeel=instance.feeltemp;

    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,'/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_value" : air,
        "desc_value": desc,
        "main_value": maindesc,
        "icon_value":picicon,
        "city_name": city,
        "feel_temp":tempfeel,
      });

    });




  }


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Widget build(BuildContext context) {
    Map ? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if(search?.isNotEmpty?? false){
      city=search?['searched_text'];

    }
    startapp(city);

    return   Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 250,),
              Image.asset("assets/images/logoapp.png",height: 180,width: 180,),
              SizedBox(height: 20,),
              Text("Weather App",
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 20,),
              Text("Made by Nabani",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),),
              SizedBox(height: 30,),
              SpinKitSpinningLines(
                color: Colors.blueGrey,
                size: 70.0,
              )

            ],
          ),
        ),
      ),
          backgroundColor: Colors.blue[100],
    );
  }
}
