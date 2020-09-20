//Steps for using stateful widgets
//1.Create a class the extends StatefulWidget,that returns a state in CreateState()
//2.Create your 'State' class, with properties that may change
//3.Within "State" class, implement the "build()" method
//4.Call the setState() to make changes
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

List display_this = [Text('No image here!!')]; //Can be text or image
Map jsonResult = {};//Will contain image locations
int which_img = -1;

void main(){
  runApp(
    MaterialApp(
      title: 'JustTap',
      home: Tap(),
    )
  );
}

setjson(){//fetching and setting jsonResult
  Future<Map> loadjson() async {
    String data = await rootBundle.loadString('images/AssetManifest.json');
    jsonResult = json.decode(data);
  }
  getjson() async{
    await loadjson();
  }
  getjson();
}

image_display(){//for setting 'display_this' according to jsonResult
  which_img += 1;
  if(which_img<jsonResult['assets'].length){
    display_this[0] = Image.asset(jsonResult['assets'][which_img]);
  }else{
    which_img = -1;
  }
}

class Tap extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Tap(); //return state of this widget
  }
}

class _Tap extends State<Tap>{
  @override
  Widget build(BuildContext context) {
    debugPrint('Widget is being created');
    setjson();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap That button!!'),
      ),
      body: Column(children: <Widget>[
          Container(
              alignment: Alignment.center,
              height: 300,
              child: display_this[0],
            ),
          Padding(padding: EdgeInsets.only(top: 210.0)),//Spacing in between image and button
          Align(
            alignment: Alignment.bottomCenter,
            child : ButtonTheme( //modify button size
              minWidth: 360.0,
              height: 50.0,
              child: RaisedButton( //create button
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("PressME!!", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  setState(() {
                    image_display();
                });
              },
            ),
          ),
        ),
      ]),
    );
  }
}
