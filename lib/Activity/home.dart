import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController=new TextEditingController();
  //async-Function started and will return
  //Future.delayed=Function with start after delay
  // void getData() async{
  //   Response response=await get(Uri.parse("https://dummyjson.com/products"));
  //   Map data=jsonDecode(response.body);
  //   print(data);
  // }
  // void getData() async{
  //   Response response=await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Delhi&appid=a002b760b02d2e3056f27fd1f24a180b"));
  //   Map data=jsonDecode(response.body);
  //   List tempData=data['weather'];
  //   Map weatherData=tempData[0];
  //   print(weatherData['main']);
  //
  // }
  int counter = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // timer();

    // showData();
    // getData();
    print("This is a initstate");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Setstate Called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var cityName = [
      "Delhi",
      "Dhaka",
      "Chittagong",
      "London",
      "Gaya",
      "London",
      "NewYork",
      "Khulna"
    ];
    final _random = new Random();
    var city = cityName[_random.nextInt(cityName.length)];
    Map? info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp=(info['temp_value']);
    if(temp!='NA'){
      temp=(info['temp_value'].substring(0,5));
    }else{
      temp=(info['temp_value']);
    }
    String icon=info['icon_value'];
    String cityname=info['city_name'];
    String humidity=info['hum_value'];
    String desc=info['main_value'];
    // String air=info['air_value'].substring(0,1);
    String feelTemp=info['feel_temp'];
    if(feelTemp=='NA'){
      feelTemp=info['feel_temp'];

    }else{
      feelTemp=info['feel_temp'].substring(0,4);

    }
    //print(air);
    //var focusNode = FocusNode();
    // RawKeyboardListener(
    //     focusNode: focusNode,
    //     onKey: (event) {
    //       if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
    //         // Do something
    //       }
    //     },
    //     child: TextField(controller: TextEditingController())
    // )

    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.enter)){
                print("key pressed");
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child:AppBar(
            backgroundColor: Colors.blue[800],
          )

        ),



        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // stops: [
                  //   0.1, //0-10% tak blue
                  //   0.4  //10% to 90% black
                  // ],
                  colors: [Colors.blue.shade800, Colors.blue.shade300])),
              child: Column(
                children: <Widget>[
                  Container(
                    //search container

                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 23),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if(searchController.text.replaceAll(" ", "")==""){
                              print("blank");


                              }else{
                              Navigator.pushReplacementNamed(context, '/loading',arguments: {
                                "searched_text":searchController.text,

                              });

                            }

                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.blueGrey,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                              controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Any City Name eg.$city"),
                        ))
                      ],
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Image.network('http://openweathermap.org/img/wn/$icon@2x.png'),
                            SizedBox(width: 20,),
                            Column(
                              children: <Widget>[
                                Text("$desc",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                                Text("In $cityname",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),)
                              ],
                            )

                          ],
                        ),
                      ),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("$temp",style:
                                  TextStyle(
                                    fontSize: 90
                                  ),),
                                Text("C",style: TextStyle(
                                  fontSize: 30
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          height: 200,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcons.day_light_wind)
                                ],
                              ),
                              SizedBox(height: 30,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text("$feelTemp",style:
                                 TextStyle(
                                     fontSize: 40,
                                     fontWeight: FontWeight.bold
                                 ),),
                                 Text('C',style: TextStyle(
                                   fontSize: 20,
                                 ),),
                               ],

                             ),
                              Text("Feels Like",style: TextStyle(
                                fontSize: 20,
                              ),)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          height: 200,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcons.humidity)
                                ],
                              ),
                              SizedBox(height: 30,),
                              Text("$humidity",style:
                              TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("percent")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.all(22),
                    child: Column(
                      children: <Widget>[
                        Text("Made By Nabani"),
                        Text("Data Provided By Openweather.org")
                      ],
                    ),
                  )
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
