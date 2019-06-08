import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // decoration: BoxDecoration(color: Colors.blue),
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0), 
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            // verticalDirection: VerticalDirection.up,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                iconSize: 25,
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Container(
                child:Row(
                  children: <Widget>[
                    Icon(
                      Icons.map
                    ),
                    Text('주소검색'),
                    // Icon

                  ],
                ),
                decoration: BoxDecoration(
                  // color: Colors.red,
                ),
                width: 219,
              ),
              IconButton(
                iconSize: 25,
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              
            ],
          )
        )
      ),
    );
  }
}


// Padding(
//   padding: EdgeInsets.all(0), // left, top, right, bottom
//   child: RaisedButton(
//     onPressed: () {
//       Navigator.pushNamed(context, '/search');
//     },
//     child: Text(
//       'search',
//       style: TextStyle(fontSize: 20)
//     )
//   ),
// ),