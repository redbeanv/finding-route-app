import 'dart:async';
import 'package:flutter/material.dart';
import 'package:finding_route/util/placeUtil.dart';
import 'package:google_maps_webservice/places.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: InputForm()
        ),
    );
  }
}

class InputForm extends StatefulWidget {

  final String apiKey;
  final String hint;
  final Location location;
  final num offset;
  final num radius;
  final String language;
  final List<String> types;
  final List<Component> components;
  final bool strictbounds;
  final ValueChanged<PlacesAutocompleteResponse> onError;

  InputForm(
      {@required this.apiKey,
      this.hint = "Search",
      this.offset,
      this.location,
      this.radius,
      this.language,
      this.types,
      this.components,
      this.strictbounds,
      this.onError,
      Key key})
      : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}



// class _InputFormState extends State<InputForm> implements GooglePlacesListener{
class _InputFormState extends State<InputForm> {

  GoogleMapsPlaces googleMapsPlaces = new GoogleMapsPlaces(apiKey: 'my_api_key');

  final _startPositionController = TextEditingController();
  final _endPositionController = TextEditingController();

  GooglePlaces googlePlaces;
  PlacesAutocompleteResponse response;

  @override
  void initState() {
    super.initState();
    _startPositionController.addListener(() => {
      // searchPlace(_startPositionController.text)
    });
    _endPositionController.addListener(() => {
      // searchPlace(_endPositionController.text)
    });
    // googlePlaces = new GooglePlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _textField(context, ValueKey(1), Colors.red, '여기서 출발', _startPositionController),
                  // _textField(context, ValueKey(2),Colors.blue, '여기로 도착', _endPositionController),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  // color: Colors.red
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.swap_vert,
                    color: Colors.indigo,
                    size: 30,
                  ),
                  onPressed: () {
                    _swapText();
                  },
                ),
              )
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
            },
            child: Text('search'),
          ),
        ),
        Container(
          child: placeList(),
        )
      ],
    );
  }
  
  Widget _textField(
    BuildContext context, 
    Key key ,
    Color iconColor, 
    String hint, 
    TextEditingController controller
  ) => Row(

    key: key,
    // mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Flexible(
        child: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black54, fontSize: 16.0),
            icon: Icon(
              Icons.location_on,
              color: iconColor,
              size: 30.0,
            ),
            hintText: hint
            // border:  

          ),
          // onChanged: search
            
          
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.grey[600],
        ),
        onPressed: () {
          searchPlace(_startPositionController.text);
        },
      ),
      IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.grey[600],
        ),
        onPressed: () {
          _deleteText(context, key.toString());
        },
      ),
    ],
  );

  Widget placeList() {
    var list;
    if(_startPositionController.text.isEmpty || response == null 
      || response.predictions.isEmpty){
        list = null;
    } else {
      list =  SingleChildScrollView(
        child:  ListBody(
          children: response.predictions.map(
            (p) =>  PredictionTile(prediction: p, onTap: Navigator.of(context).pop)).toList()
        )
      );
    }
    return list;
  }

  @override
  void dispose() {
    _startPositionController.dispose();
    _endPositionController.dispose();
    super.dispose();
  }

  _swapText() {
    // var tempRepo = _startPositionController.text;
    // _startPositionController.text = _endPositionController.text;
    // _endPositionController.text = tempRepo;
    setState(() {
      response = PlacesAutocompleteResponse.fromJson({
        "predictions" : [
            {
              "description" : "서울특별시 미성동 난곡사거리",
              "id" : "8f1ff7819e42012322404e36f4220bc9759916df",
              "matched_substrings" : [
                  {
                    "length" : 2,
                    "offset" : 10
                  }
              ],
              "place_id" : "ChIJEwWwRMyffDURVHLw-0gH5eg",
              "reference" : "ChIJEwWwRMyffDURVHLw-0gH5eg",
              "structured_formatting" : {
                  "main_text" : "난곡사거리",
                  "main_text_matched_substrings" : [
                    {
                        "length" : 2,
                        "offset" : 0
                    }
                  ],
                  "secondary_text" : "서울특별시 미성동"
              },
              "terms" : [
                  {
                    "offset" : 10,
                    "value" : "난곡사거리"
                  },
                  {
                    "offset" : 6,
                    "value" : "미성동"
                  },
                  {
                    "offset" : 0,
                    "value" : "서울특별시"
                  }
              ],
              "types" : [ "geocode" ]
            }
        ],
        "status" : "OK"
      });
    });
  }

  _deleteText(BuildContext context, String key) {
    if(key == '[<1>]') {
      _startPositionController.clear();
    } else if (key == '[<2>]') {
      _endPositionController.clear();
    }
  }

  Future<Null> searchPlace(String value) async {
    print("searchPlacec: $value");
    if (value.isNotEmpty) {
      final res = await googleMapsPlaces.autocomplete(
        value,
        offset: widget.offset,
        location: widget.location,
        radius: widget.radius,
        language: widget.language,
        types: widget.types,
        components: widget.components,
        strictbounds: widget.strictbounds
      );

      if (res.errorMessage?.isNotEmpty == true ||
          res.status == "REQUEST_DENIED") {
        // onResponseError(res);
      } else {
        // onResponse(res);
        setState(() {
          response = res;
        });
      }
    } else {
      // onResponse(null);
    }
  }
  
}

class PredictionTile extends StatelessWidget {
  final Prediction prediction;
  final ValueChanged<Prediction> onTap;

  PredictionTile({@required this.prediction, this.onTap});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Icon(Icons.location_on),
      title: new Text(prediction.description),
      onTap: () {
        if (onTap != null) {
          onTap(prediction);
        }
      },
    );
  }
}



