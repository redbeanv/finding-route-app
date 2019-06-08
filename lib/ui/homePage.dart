import 'package:flutter/material.dart';
import 'package:finding_route/ui/common/appbar.dart';

import 'package:finding_route/util/mapUtil.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Finding Route'),
      // ),
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
          MapUtil(),
          MainAppBar(),
          // mainAppBar(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: '현재 위치',
        child: Icon(Icons.person_pin_circle),
      ),
    );
  }
}

// Widget mainAppBar(context) {
//   return Container(
//       height: 80,
//       // decoration: BoxDecoration(color: Colors.blue),
//       child: Center(
//         child: Container(
//           margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(15))
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0), 
//           child: Row(
//             // crossAxisAlignment: CrossAxisAlignment.baseline,
//             // verticalDirection: VerticalDirection.up,
//             // mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               IconButton(
//                 iconSize: 25,
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   BuildContext
//                   Scaffold.of(context).openDrawer();
//                 },
//               ),
//               Container(
//                 child:Row(
//                   children: <Widget>[
//                     Icon(
//                       Icons.map
//                     ),
//                     Text('주소검색'),
//                     // Icon

//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   // color: Colors.red,
//                 ),
//                 width: 219,
//               ),
//               IconButton(
//                 iconSize: 25,
//                 icon: Icon(Icons.arrow_drop_down),
//                 onPressed: () {
//                   print(context);
//                   Navigator.pushNamed(context, '/search');
//                 },
//               ),
              
//             ],
//           )
//         )
//       ),
//     );
// }