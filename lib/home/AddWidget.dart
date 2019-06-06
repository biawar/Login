import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddWidget extends StatefulWidget{
  @override
  AddWidgetState createState() => AddWidgetState();
}

class AddWidgetState extends State<AddWidget>{

  final HomeBloc bloc = HomeBloc();


    Widget sendAddButton(bool istexttouchedandvalid){
      return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        color: Colors.lightBlue,
        child: Text("Criar Pedido"),
        textColor: Colors.white,
        //shape: StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        onPressed: () { 
          bloc.dispatch(SendAddButtonPressed(titleText: bloc.currentState.titleText, descriptionText: bloc.currentState.descriptionText ));
           }
       ));
    }

    Widget _inputMesa(HomeBloc bloc, bool titlevalidtext){
      //print('inside emailField: $validemail');
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          //onChanged: bloc.,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Digite a Mesa",
            labelText: "Mesa",
            //icon: Icon(Icons.email) ,
            errorText: titlevalidtext ? null: 'Digite algo',
          ),
          onChanged:(String titleText) => bloc.dispatch(IsTitleTextChanged(titleText:titleText)),
        ),
      );
    }  

    Widget _inputPedido(HomeBloc bloc, bool descriptionvalidtext){
      //print('inside passwordField: $validpassword');
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          //onChanged: (String password) => bloc.dispatch(IsPasswordChanged(password)),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Digite o pedido",
            labelText: "Pedido",
            //icon: Icon(Icons.lock) ,
            errorText: descriptionvalidtext ? null: 'Digite algo'
          ),
          onChanged:(String descriptionText) => bloc.dispatch(IsDescriptionTextChanged(descriptionText:descriptionText)),
        ),
      );
    }

    Widget _loading(){
    return Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0)),
          CircularProgressIndicator(),
        ],  );
  }


    Widget build(BuildContext context){
      Size size = MediaQuery.of(context).size;
       return Scaffold(
      appBar: AppBar(
        title: Text("Criar um Pedido"),
        //automaticallyImplyLeading: false,
      ),
     body:BlocListener(
        bloc: bloc,
        listener: (context, state) async { 

            if(state is Success) {
                  Padding(padding: const EdgeInsets.all(50.0));
                  CircularProgressIndicator();          
              }
            if (state is Fail) {
                print(state);
              }

          }, 
        child:BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, Home_State state) {
        return ListView(
        children: <Widget>[
          _inputMesa(bloc, state.istitletextvalid),
          _inputPedido(bloc, state.isdescriptiontextvalid),
          sendAddButton(bloc.currentState.istexttouchedandvalid),
          state.isloading ? _loading() : Padding(padding: EdgeInsets.all(10.0),),
          state is Fail ? Center(child:Text('Algo errado não esta certo',
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.redAccent.withOpacity(0.8)),
          )): Padding(padding: EdgeInsets.all(10.0),),
          state is Success ? Center(child:Text('Pedido Criado!',
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.grey.withOpacity(0.8)),
          )): Padding(padding: EdgeInsets.all(10.0),),

        ],

        );
        },
        ),
     ),
      );
    }

}
