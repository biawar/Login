import 'package:flutter/material.dart';
import 'package:login/home/HomeWidget.dart';
import 'package:login/home/DashboardWidget.dart';

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
      '/':(BuildContext context)=> new HomeWidget(),
      '/DashboardWidget': (BuildContext context)=> new DashboardWidget(),
    } ,
    initialRoute: '/',
    //home: HomeWidget(),
    );
  }
}