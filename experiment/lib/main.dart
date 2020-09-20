import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue;
  dropDown(){
      return AlertDialog(
        //scrollable: true,
        title: Text('Provide Feedback'),
        content: Container(
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                // Choose feedback type
                DropdownButton<String>(
                  value: dropdownValue,
                  hint: Text('Feedback type'),
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 15,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue),
                  onChanged: (String newvalue){
                    setState(() {
                      dropdownValue = newvalue;
                    });
                  },
                  items: <String>['Suggestion','Problem'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20,),
                
                // Input feedback
                TextFormField(
                  maxLength: 200,
                  minLines: 5,
                  maxLines: 100,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Feedback here",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                      ),
                  ),
                  validator: (val){
                    if(val.length < 20){
                      return "Feeback too short";
                    }else{
                      return null;
                    }
                  },
                )

              ],),
          ),
        ),
        buttonPadding: EdgeInsets.symmetric(horizontal:20),
        actions: <Widget>[
          FlatButton(
            onPressed: (){Navigator.of(context).pop();},
            child: Text('Cancel')
          ),
          FlatButton(
            onPressed: (){Navigator.of(context).pop();},
            child: Text('Submit')
          )
        ],
      );
  }
  getDropDown(){
    return dropDown();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: getDropDown()
    );
  }
}
