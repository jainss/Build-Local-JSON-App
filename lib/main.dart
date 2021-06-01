import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Text> data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Load JSON App"),
        ),
        body: Container(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var mydata = jsonDecode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Name: " + mydata[index]['name']),
                        Text("Age: " + mydata[index]['age']),
                        Text("Color: " + mydata[index]['color'])
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
