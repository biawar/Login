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


    QuerySnapshot qn = await Firestore.instance.collection("meusPedidos").getDocuments();

    return qn.documents;

  }

  void delete(snapshot) async{
    await Firestore.instance.runTransaction((Transaction myTransaction) async {
    await myTransaction.delete(snapshot.reference);
    });
  }

 
  // void deletePost(snapshot) async {
  //   await snapshot.remove().then((_) {
  //     print('Transaction  committed.');
  //   });
  // }

  //  Future delete(DocumentSnapshot post) async {

  //   Firestore.instance.runTransaction(
  //     (Transaction transaction) async{
  //       print("Delete!");
  //       await transaction.delete(documentReference);
  //     }
  //   );

  //}

  navigateToDetail(DocumentSnapshot post){

    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));

  }

    @override
    Widget build(BuildContext context){
      //Size size = MediaQuery.of(context).size;
       return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pedidos"),
        automaticallyImplyLeading: false,
      ),
      body:StreamBuilder(
        stream: Firestore.instance.collection("meusPedidos").snapshots(),
        builder: (_, snapshot){
          if(!snapshot.hasData){
            return Center(
                child:CircularProgressIndicator(),
            );
          } else{

            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (_,index){
                DocumentSnapshot ds = snapshot.data.documents[index];
                return new Container( 
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child:ListTile(
                          title: Text('Mesa ${ds["Mesa"]}',
                          style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.grey[850].withOpacity(0.8))),
                          onTap: () => navigateToDetail(snapshot.data.documents[index]),
                          trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed:() {
                                   Firestore.instance.collection("meusPedidos").document(ds.documentID).delete();
                                  //delete(snapshot.data[index]);
                                  //Navigator.pushNamed( context, '/ReadWidget' );
                                  //snapshot.data.documents[index]
                                }),
                          ));
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
              }),
              floatingActionButton: new FloatingActionButton(
                onPressed: (){
                  Navigator.pushNamed( context, '/AddWidget' );
                },
                child: new Icon(Icons.add),
              ),
              );
            }

          }


