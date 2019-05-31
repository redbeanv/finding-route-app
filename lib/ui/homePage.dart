import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:finding_route/ui/appbar/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(37.49243, 127.03101);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finding Route'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
            //   child: Container(
            //     child: Text('data'),
            //     color: Colors.red,
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
            ListTile(
              title: Text('data1'),
              onTap: () {
                // Navigator.push(context, '/setting');
                Navigator.pushNamed(context, '/setting');
              },
            ),
            ListTile(
              title: Text('data1'),
              onTap: () {
                // Navigator.push(context, '/setting');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Text(
                'search',
                style: TextStyle(fontSize: 20)
              )
            ),
          ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   child: RaisedButton(
          //     onPressed: null,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         border: Border.all(width: 28.0, color: Colors.red)
          //       ),
          //       child: Text('data'),
          //     ),
          //   ),
          // ),
        ],
      ),
      
      
      // Column(
      //   children: <Widget>[
      //     Flexible(
      //       flex:1,
      //       child: Stack(
      //         children: <Widget>[
      //           RaisedButton(
      //             onPressed: null,
      //             child: Container(
      //               decoration: BoxDecoration(
      //                 border: Border.all(width: 28.0, color: Colors.red)
      //               ),
      //               child: Text('data'),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     Flexible(
      //       flex: 6,
      //       // child: Center(
      //       //   child: Text('임시'),
      //       // ),
      //       child: GoogleMap(
      //         onMapCreated: _onMapCreated,
      //         myLocationEnabled: true,
      //         initialCameraPosition: CameraPosition(
      //           target: _center,
      //           zoom: 13.0,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // body: Column(
      //   children: <Widget>[
      //     Flexible(
      //       flex: 1,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: <Widget>[
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: <Widget>[
      //               MyRow(subject: '출발지',),
      //               MyRow(subject: '목적지',),
      //               MyRow(subject: '도착시간',)
      //             ]
      //           ),
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: <Widget>[
      //               Row(
      //                 children: <Widget>[Text('data')],
      //               ),
      //               Row(
      //                 children: <Widget>[Text('data')],
      //               ),
      //               Row(
      //                 children: <Widget>[Text('data')],
      //               )
      //             ],
      //           ),
      //         ],
      //       )
      //     ),
      //     Flexible(
      //       flex: 6,
      //       child: GoogleMap(
      //         onMapCreated: _onMapCreated,
      //         myLocationEnabled: true,
      //         initialCameraPosition: CameraPosition(
      //           target: _center,
      //           zoom: 13.0,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
        },
        tooltip: '현재 위치',
        child: Icon(Icons.person_pin_circle),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({Key key, this.subject}) : super(key: key);
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.ac_unit),
        Container(
          child: Text(subject),
          height: 28.0,
          // color: Colors.grey,
          decoration: BoxDecoration(color: Colors.red),
        )
      ],
    );
  }
}
