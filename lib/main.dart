import 'package:flutter/material.dart';
import 'newPage.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "vous devez cliquer sur le bouton obtenir un rsultat";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "vous devez cliquer sur le bouton obtenir un rsultat";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 16.5) {
        _infoText = "dénutration";
      } else if (imc < 18.5) {
        _infoText = "maigreur";
      } else if (imc < 25) {
        _infoText = "corpulence normal";
      } else if (imc < 30) {
        _infoText = "surpoids";
      } else if (imc < 35) {
        _infoText = "modérée";
      } else {
        _infoText = "obésité morbide ou  massive";
      }
    });
Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new Second(_infoText) ));
  }

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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: weightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "saisire votre poids";
                    }
                  },
                  decoration: InputDecoration(labelText: "(Kg)")),
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: heightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "saisire votre taille";
                    }
                  },
                  decoration: InputDecoration(labelText: "(Cm)")),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("calculer IMC",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    onPressed:_calculate ,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("RAZ",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    onPressed: _resetFields,
                    color: Colors.redAccent,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
