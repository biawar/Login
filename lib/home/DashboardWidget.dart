import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';
import 'dart:math';

class DashboardWidget extends StatefulWidget{
  @override
  DashboardWidgetState createState() => DashboardWidgetState();
}

class DashboardWidgetState extends State<DashboardWidget>{
  final HomeBloc bloc = HomeBloc();
  @override
    Widget build(BuildContext context){
      Size size = MediaQuery.of(context).size;
       return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body:BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, Home_State state) {
        return ListView(
        children: <Widget>[
          

        ],

        );
        },
        ),
      );
    }

}
