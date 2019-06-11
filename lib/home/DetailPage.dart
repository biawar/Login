import 'dart:async';

import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/home/EditWidget.dart';



class DetailPage extends StatefulWidget{

  final DocumentSnapshot post;
  DetailPage({this.post});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>{


  navigateToEdit(DocumentSnapshot post){

    Navigator.push(context, MaterialPageRoute(builder: (context) => EditWidget(post: post,)));

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesa ${widget.post.data["Mesa"]}'),
      ),
      body: Container(
      child: Card(
        child: ListTile(
          title: Text('Mesa ${widget.post.data["Mesa"]}'),
          subtitle: Text(widget.post.data["Pedido"]),
           trailing: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed:() {
                                  navigateToEdit(widget.post);
                                }),
        ),
      ),
      ),
    );
  }

}