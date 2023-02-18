import 'dart:convert';
import 'package:http/http.dart';
class worker{
  String location="";
  String temp="";
  String humidity="";
  String airspeed="";
  String description="";
  String main="";
  String icon="";
  String city="";
  String feeltemp="";

  //constructor
  worker({location}){
    this.location=location;

  }

  //method

  Future<void> getData() async{
   try{
     Response response=await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=ec4ad8006b8d1b1b0d93915dcb7d7bb4"));
     Map data=jsonDecode(response.body);

     //getting temp data
     Map temp_data=data['main'];
     String getHumidity=temp_data["humidity"].toString();
     double getTemp=temp_data['temp']-273.15;//-273.15;
     double getfeelTemp=temp_data['feels_like']-273.15;//-273.15;
     //getting wind
     Map wind=data['wind'];
     String getairSpeed=wind["speed"].toString() ;//0.2777777778;
     //weather data
     List weatherData=data['weather'];
     Map weatherMainData=weatherData[0];
     String mainDescription=weatherMainData['description'];
     String getMain=weatherMainData['main'];
     String geticon=weatherMainData['icon'];
     String getcity=data['name'];
     print(getfeelTemp);


     //Assigning values
     temp=getTemp.toString();//c
     humidity=getHumidity;//%
     airspeed=getairSpeed.toString();//m/s
     description=mainDescription;//string
     main=getMain;//string
     icon=geticon;
     city=getcity;
     feeltemp=getfeelTemp.toString();
   }catch(e){
     temp="NA";
     humidity="NA";
     airspeed="NA";
     description="Can't find the data";
     main="Can't find the data";
     icon="09d";
     city="NA";
     feeltemp="NA";

   }





  }

}