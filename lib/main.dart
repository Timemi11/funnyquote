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

class HomePage extends StatefulWidget {// ถ้าต้องการเปลี่ยนแปลงค่าได้ควรใช้ statefullwidget
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _quotes = [
    "แคปชั่นไม่รู้ แต่แคบหมูไม่แน่",
    "อยากมีคนใส่ใจ ที่ไม่ใช่ป้าข้างบ้าน",
    "ใจไม่ดำหรอกจ้ะ ขอบตาต่างหากที่ดำ",
    "อย่าทำให้หลงได้ไหม น้ำมันแพง",
    "ไม่ค่อยหลายใจ ส่วนมากจะหลายขวด",
    "เหมาะกับการอยู่ในวงเหล้า มากกว่าการเข้าไปอยู่ในใจใคร",
  ];
  static const List<Color> _colors = [
    Colors.amberAccent,
    Colors.blue,
    Colors.lightGreenAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
  ];

//can private (method,variable) by add "_" prefix on name
  var _colorrnd = _colors[0]; //state variable is variable in class
  var _quote = _quotes[0];
  final _rad = Random();

  void handleclick() {
    setState(() { // method in state
      //ใช้กับตัวแปรที่อยากให้เปลี่ยนแปลงได้ update ค่า
      //refesh when imprement success

      // Solution
      var rndindex = _rad.nextInt(_quotes.length);
      var newq =_quotes[rndindex];
      while(newq == _quote){
        rndindex = _rad.nextInt(_quotes.length);
        newq = _quotes[rndindex];
      }
        _quote = newq;
      // END Solution
    });
  }

  void randomcolor() {
    setState(() {
      //refesh when imprement success
      var rndcolor = _rad.nextInt(_colors.length);
      var newc = _colors[rndcolor];
      while(newc == _colorrnd){
        rndcolor = _rad.nextInt(_colors.length);
        newc = _colors[rndcolor];
      }
      _colorrnd = newc;

    });
  }

  @override
  Widget build(BuildContext context) { //layout app
    //const ใส่ตรง literal ที่มีค่าแน่นอนไม่ต้องการจะเปลี่ยนแปลงตลอด
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
        child: const Text("สุ่มคำคม",textAlign: TextAlign.center,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Text(
          _quote,
          style: TextStyle(
            color: _colorrnd,
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
