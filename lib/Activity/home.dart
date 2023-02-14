import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  //async-Function started and will return
  //Future.delayed=Function with start after delay
  // void getData() async{
  //   Response response=await get(Uri.parse("https://dummyjson.com/products"));
  //   Map data=jsonDecode(response.body);
  //   print(data);
  // }
  void getData() async{
    Response response=await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Delhi&appid=a002b760b02d2e3056f27fd1f24a180b"));
    Map data=jsonDecode(response.body);
    List tempData=data['weather'];
    Map weatherData=tempData[0];
    print(weatherData['main']);
    
  }
  int counter=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // timer();

    // showData();
    getData();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Home"),
      ),
      body:
          Column(children: <Widget>[
            FloatingActionButton(
              onPressed: ()=>setState(() {
                counter+=1;
              }),
            ),
            Text("$counter"),
          ],)


    );
  }
}
