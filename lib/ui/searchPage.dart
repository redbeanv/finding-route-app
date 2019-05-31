import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: ListView(
            children: <Widget>[
              InputForm()
            ],
          ),
        ),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();

  Future<Position> getCurrentLocation() async {
    // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // print(position);

    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((location) {      
      print(location);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            onTap: () {
              getCurrentLocation();
            },
          ),
          TextFormField(
            validator: (value) {
              if(value.isEmpty) {
                return 'Please enter some text';
              }
            },
            
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data'),));
                }
              },
              child: Text('search'),
            ),
          )
        ],
      ),
    );
  }
}