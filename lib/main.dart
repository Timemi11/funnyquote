import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  //top level function is non-depend on any class
  runApp(const FunnyQuotesApp());
}

//Statelesswidget of Statelesswidget is about write visial dom or element on website or app
class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //similar document html structure
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage() //it's visual dom
        );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quotes = [
    "Avenger",
    "Commics",
    "Cartoon",
    "Wanganda Forever",
    "I like mama",
    "ง่วงนอนจังเลยXD6",

  ];

    var quote = quotes[0];

  void handleclick(){
    setState(() { //refesh when imprement success
      var rad = Random();
      var rndindex =  rad.nextInt(quotes.length);
      quote = quotes[rndindex];
    });
  }



  @override
  Widget build(BuildContext context) {
    //const ใส่ตรง literal ที่มีค่าแน่นอนไม่ปลี่ยนแปลง

    return Scaffold(
      // Scaffold is widget help for layout
      appBar: AppBar(title: const Text("kumkhomguanguan")),
      floatingActionButton: FloatingActionButton(
        onPressed:handleclick ,
        child: const Text("Go"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Text(
          quote,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 50,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            letterSpacing: 20,
          ),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
