import 'package:flutter/material.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          FilledButton.icon(onPressed:(){
          Navigator.pushNamed(context, "/home");
          },
         icon: Icon(Icons.home_filled), label:Text("Go to home"))
        ],),
      ),
    );
  }
}
