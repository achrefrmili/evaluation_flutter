import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  Second(this.name);

  String name;

  @override
  _SecondState createState() => _SecondState(name);
}

class _SecondState extends State<Second> {
  _SecondState(this.name);

  String name;

//interface app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluation'),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
