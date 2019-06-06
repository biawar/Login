import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';


class createACountWidget extends StatefulWidget{
  @override
  createACountWidgetState createState() => createACountWidgetState();
}

class createACountWidgetState extends State<createACountWidget>{
  
  final HomeBloc bloc = HomeBloc();

    Widget _buttonCreate(bool iseverythintouchedandvalid){
       return Padding(
       padding: const EdgeInsets.all(20.0),
       child: RaisedButton(
         color: Colors.blue,
         child: Text("create"),
         textColor: Colors.white,
         shape: StadiumBorder(),
         clipBehavior: Clip.antiAlias,
         onPressed: () { 
          bloc.dispatch(ButtonCreatePressed(email: bloc.currentState.email, password: bloc.currentState.password));
          //Navigator.pushNamed( context, '/DashboardWidget');
           }
       ));
    }

  Widget _inputEmailField(HomeBloc bloc, bool validemail){
    //print('inside emailField: $validemail');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        //onChanged: bloc.,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Digite seu email",
          labelText: "Email",
          //icon: Icon(Icons.email) ,
          errorText: validemail ? null: 'Email Inválido',
        ),
        onChanged:(String email) => bloc.dispatch(IsEmailChanged(email:email)),
      ),
    );
  }  

   Widget _inputPasswordField(HomeBloc bloc, bool validpassword){
    //print('inside passwordField: $validpassword');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: true,
        //onChanged: (String password) => bloc.dispatch(IsPasswordChanged(password)),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Digite uma senha com mais de 4 caracteres",
          labelText: "Password",
          //icon: Icon(Icons.lock) ,
          errorText: validpassword ? null: 'Senha Inválida'
        ),
         onChanged:(String password) => bloc.dispatch(IsPasswordChanged(password:password)),
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
        title: Text("Create a Count"),
        automaticallyImplyLeading: false
      ),
      body:BlocListener(
        bloc: bloc,
        listener: (context, state) async { 

            if(state is Success) {
                  Padding(padding: const EdgeInsets.all(50.0));
                  CircularProgressIndicator();  
                //print("oi");
                //await Future.delayed(Duration(seconds:3)); 
                Navigator.pushNamed( context, '/DashboardWidget' );            
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
          _inputEmailField(bloc, state.isemailvalid),
          _inputPasswordField(bloc, state.ispasswordvalid),
          _buttonCreate(bloc.currentState.iseverythintouchedandvalid),
          state.isloading ? _loading() : Padding(padding: EdgeInsets.all(10.0),),
          state is Fail ? Center(child:Text('Algo errado não esta certo',
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.redAccent.withOpacity(0.8)),
          )): Padding(padding: EdgeInsets.all(10.0),),
        ],

        );
        },
        ),
      ),
       );
    }

}
