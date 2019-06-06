import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DashboardWidget extends StatefulWidget{
  @override
  DashboardWidgetState createState() => DashboardWidgetState();
}

class DashboardWidgetState extends State<DashboardWidget>{

  

  final HomeBloc bloc = HomeBloc();

    Widget logout(){
       return Padding(
       padding: const EdgeInsets.all(30.0),
       child: RaisedButton(
         color: Colors.red,
         child: Text("Logout"),
         textColor: Colors.white,
         shape: StadiumBorder(),
         clipBehavior: Clip.antiAlias,
         onPressed: () { 
          bloc.dispatch(LogoutButtonPressed());
          Navigator.pushNamed( context, '/' );
           }
       ));
    }

    Widget addButton(){
      return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        color: Colors.lightBlue,
        child: Text("Criar Pedido"),
        textColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        onPressed: () { 
          bloc.dispatch(AddButtonPressed());
          Navigator.pushNamed( context, '/AddWidget' );
           }
       ));
    }

     Widget readButton(){
      return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        color: Colors.lightBlue,
        child: Text("Ver Pedidos"),
        textColor: Colors.white,
        //shape: StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        onPressed: () { 
          bloc.dispatch(ReadButtonPressed());
          Navigator.pushNamed( context, '/ReadWidget' );
           }
       ));
    }

     Widget updateButton(){
      return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        color: Colors.lightBlue,
        child: Text("Alterar Pedido"),
        textColor: Colors.white,
        //shape: StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        onPressed: () { 
          //bloc.dispatch(LogoutButtonPressed());
          //Navigator.pushNamed( context, '/' );
           }
       ));
    }

    Widget deleteButton(){
      return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        color: Colors.lightBlue,
        child: Text("Deletar Pedido"),
        textColor: Colors.white,
        //shape: StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        onPressed: () { 
          //bloc.dispatch(LogoutButtonPressed());
          //Navigator.pushNamed( context, '/' );
           }
       ));
    }

    Widget build(BuildContext context){
      Size size = MediaQuery.of(context).size;
       return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body:BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, Home_State state) {
        return ListView(
        children: <Widget>[
          addButton(),
          readButton(),
          updateButton(),
          deleteButton(),
          logout(),

        ],

        );
        },
        ),
      );
    }

}
