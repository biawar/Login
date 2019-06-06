import 'package:flutter/material.dart';
import 'package:login/home/DetailPage.dart';
import 'package:login/home/HomeWidget.dart';
import 'package:login/home/DashboardWidget.dart';
import 'package:login/home/createACountWidget.dart';
import 'package:login/home/AddWidget.dart';
import 'package:login/home/ReadWidget.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp( 
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context)=> new HomeWidget(),
      '/DashboardWidget': (BuildContext context)=> new DashboardWidget(),
      '/createACountWidget': (BuildContext context)=> new createACountWidget(),
      '/AddWidget': (BuildContext context)=> new AddWidget(),
      '/ReadWidget': (BuildContext context)=> new ReadWidget(),
      '/DetailPage': (BuildContext context)=> new DetailPage(),
    } ,
    initialRoute: '/',
    //home: HomeWidget(),
    );
  }
}
