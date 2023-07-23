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
    "แคปชั่นไม่รู้ แต่แคบหมูไม่แน่",
    "อยากมีคนใส่ใจ ที่ไม่ใช่ป้าข้างบ้าน",
    "ใจไม่ดำหรอกจ้ะ ขอบตาต่างหากที่ดำ",
    "อย่าทำให้หลงได้ไหม น้ำมันแพง",
    "ไม่ค่อยหลายใจ ส่วนมากจะหลายขวด",
    "เหมาะกับการอยู่ในวงเหล้า มากกว่าการเข้าไปอยู่ในใจใคร",
  ];
  static const List<Color> colors = [
    Colors.amberAccent,
    Colors.blue,
    Colors.lightGreenAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
  ];

  var colorrnd = colors[0];
  var quote = quotes[0];
  var precolor = 0;
  var preindex = 0;
  var rad = Random();

  void handleclick() {
    setState(() {
      //refesh when imprement success
      var rndindex = rad.nextInt(quotes.length);
      if (rndindex == preindex) {
        // print("it's match");
        // print("before : ${rndindex}");
        rndindex = rad.nextInt(quotes.length);
        // print("after : ${rndindex}");
        quote = quotes[rndindex];
        preindex = rndindex;
        return;
      }
      quote = quotes[rndindex];
      preindex = rndindex;
    });
  }

  void randomcolor() {
    setState(() {
      //refesh when imprement success
      var rndcolor = rad.nextInt(colors.length);
      if (rndcolor == precolor) {
        rndcolor = rad.nextInt(colors.length);
        colorrnd = colors[rndcolor];
        precolor = rndcolor;
        return;
      }
      colorrnd = colors[rndcolor];
      precolor = rndcolor;
    });
  }

  @override
  Widget build(BuildContext context) {
    //const ใส่ตรง literal ที่มีค่าแน่นอนไม่ปลี่ยนแปลง

    return Scaffold(
      // Scaffold is widget help for layout
      appBar: AppBar(title: const Text("คำคมกวนๆ")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //arrow function of dart
          handleclick();
          randomcolor();
          //
        },
        child: const Text("สุ่มคำคม"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Text(
          quote,
          style: TextStyle(
            color: colorrnd,
            fontSize: 50,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
