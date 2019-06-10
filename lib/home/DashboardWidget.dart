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


   Future getPostsLength() async {

    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("meusPedidos").getDocuments();

    return qn.documents.length;

  }

  final HomeBloc bloc = HomeBloc();


    Widget addButton(){
      return Padding(
      padding: const EdgeInsets.only(left:10.0, right: 10.0, top: 30.0, bottom: 10.0),
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
      padding: const EdgeInsets.only(left:10.0, right: 10.0, bottom: 10.0),
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
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
       return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                 bloc.dispatch(LogoutButtonPressed());
                 Navigator.pushNamed( context, '/' );
              },
            ),]
      ),
      body:FutureBuilder(
         future: getPostsLength(),
        builder: (_, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
                child:CircularProgressIndicator(),
            );
          } else{
        return ListView(
        children: <Widget>[
          Text('TOTAL DE PEDIDOS: ${snapshot.data}'),
          addButton(),
          readButton(),
          //logout(),

        ],

        );
          }
        },
        ),
      );
    }

}
