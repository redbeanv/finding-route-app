import 'package:flutter/material.dart';
import 'package:finding_route/ui/homePage.dart';
import 'package:finding_route/ui/settingPage.dart';
import 'package:finding_route/ui/searchPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finding Route Main',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/setting': (_) => SettingPage(),
        '/search': (_) => SearchPage(),
      },
    );
  }
}