import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/HomeBloc.dart';
import '../bloc/Home_events.dart';
import '../bloc/Home_State.dart';

class HomeWidget extends StatefulWidget{
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{
  
  HomeBloc bloc;
  //Stream<String> verifica;
  //var filter = (x) => true;

  Widget _submitButton(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        color: Colors.pink,
        child: Text("Entrar"),
        textColor: Colors.white,
        shape: StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        //onPressed: ()
      ),
    );
  }

  Widget _emailField(HomeBloc bloc){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        //onChanged: bloc.,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "example@email.com",
          labelText: "Email",
        ),
        onChanged: (String email) => bloc.dispatch(IsEmailChanged(email)),
      ),
    );
  }

Widget _passwordField(HomeBloc bloc){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: true,
        onChanged: (String password) => bloc.dispatch(IsPasswordChanged(password)),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "password",
          labelText: "Password",
        ),
      ),
    );
  }

  Widget build (BuildContext context){
    
   // filter = (x) => x % 5 == 0;
    //verifica = countStream(100).where((x) => filter(x)).map((x) => transfString(x));
     print(bloc.currentState);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: ListView(
        children: <Widget>[
          _emailField(bloc),
          _passwordField(bloc),
          _submitButton(),
        ],
      ),
    );
  }

  // Stream<int> countStream(int max) async*{
  //   for(var i = 1; i<max; i++){
  //    	await new Future.delayed(const Duration(seconds : 1));
  //     yield i;
  //   }
	// }

  // String transfString(int i){
  //   return "$i - Eh multiplo de 5.";   
  // }


}