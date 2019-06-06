import 'dart:async';

import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/home/DetailPage.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ReadWidget extends StatefulWidget{
  @override
  ReadWidgetState createState() => ReadWidgetState();
}


class ReadWidgetState extends State<ReadWidget>{

  HomeBloc bloc;

  Future getPosts() async {

    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("meusPedidos").getDocuments();

    return qn.documents;

  }


  navigateToDetail(DocumentSnapshot post){

    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));

  }

    @override
    Widget build(BuildContext context){
      //Size size = MediaQuery.of(context).size;
       return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pedidos"),
        //automaticallyImplyLeading: false,
      ),
      body:FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
                child:CircularProgressIndicator(),
            );
          } else{

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_,index){

                return new Container( 
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child:ListTile(
                          title: Text('Mesa ${snapshot.data[index].data["Mesa"]}',
                          style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.grey[850].withOpacity(0.8))),
                          onTap: () => navigateToDetail(snapshot.data[index]),
                          trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed:() => Navigator.pushNamed( context, '/' )),
                          onLongPress:() => Navigator.pushNamed( context, '/AddWidget' )),
                          //IconButton(
                            //icon: Icon(Icons.edit),
                          //onPressed: null,),
                          //IconButton(
                          //icon: Icon(Icons.delete),
                          //onPressed: null,),
                          );
              }
            ); 
                  //ListTile(
                    //title: Text(snapshot.data[index].data["Mesa"]),
                    //onTap: () => navigateToDetail(snapshot.data[index]),);
                    //IconButton(icon: Icon(Icons.edit),
                      //onPressed: null,),
                    //IconButton(icon: Icon(Icons.delete),
                    //onPressed: null,),
              }
              }),);
            }

          }


