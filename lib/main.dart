import 'package:flutter/material.dart';

// SOLID
// S - Single Responsibility Principle
// O - Open/Closed Principle
// L - Liskov Substitution Principle
// I - Interface Segregation Principle
// D - Dependency Inversion Principle

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
            Icons.arrow_back, 
            size: 30, 
            color: Colors.grey
        ),
        title: Text('Home Screen', style: TextStyle(
          color: Colors.red,
          backgroundColor: Colors.grey,
          fontSize: 30, fontWeight: FontWeight.bold,
          wordSpacing: 10,
          letterSpacing: 3
        ),),
        actions: [
          Icon(Icons.check),
          SizedBox(width: 10,),
          Text('Hello'),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Hello'),
          Icon(Icons.add, size: 50,),
          Text('Hello Ahmed Saber'),
          Container(
            width: 100,
            height: 100,
            // color: Colors.blueAccent,
            alignment: Alignment.center, // as wrapping with center
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(5)
            ),
            child: Text('data'),
          ),

          SizedBox(height: 20,),
          Container(
            width: 100,
            height: 100,
            // color: Colors.blueAccent,
            alignment: Alignment.center, // as wrapping with center
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text('data'),
          ),

        ],
      ),
    );
  }
}
