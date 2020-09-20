import 'package:flutter/material.dart';

//Notice the nesting
//Flutter apps are made entirly of widgets
//Meaning there is a widget for almost anything:)
void main() => runApp(
  MaterialApp(
    // home is always the starting point
    home: Scaffold(// Scaffolds are very important as any widget can be placed on top of them
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('I am Rich'),//Even plain text is made of widgets
        backgroundColor: Colors.blueGrey[900],//the bigger the num the darker
      ),
      body: Center(
        child: Image(
          image: AssetImage('Images/success.jpeg'), //Any image you specified under assets in pubspec
        ),
      ),
    ),
  )
);