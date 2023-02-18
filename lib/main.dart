

import 'package:flutter/material.dart';
import 'package:whether/Activity/home.dart';
import 'package:whether/Activity/loading.dart';


void main() {
  runApp( MaterialApp(
    routes: {
      "/" : (context)=>const Loading(),
      "/home" : (context)=>const Home(),
      "/loading":(context)=>const Loading()
    },
  ));
}


