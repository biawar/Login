import 'package:equatable/equatable.dart';

class Home_State extends Equatable{

final String password;
final String email;
final bool isemailvalid;
final bool ispasswordvalid;

Home_State({
  this.password,
  this.email,
  this.isemailvalid,
  this.ispasswordvalid,
}):super ([password, email, isemailvalid, ispasswordvalid]);

Home_State copyWith ({
  String password,
  String email,
  bool isemailvalid,
  bool ispasswordvalid}){
return Home_State(
  password: password ?? this.password,
  email: email ?? this.email,
  isemailvalid: isemailvalid ?? this.isemailvalid,
  ispasswordvalid: ispasswordvalid ?? this.ispasswordvalid,
);
}

}

class InitState extends Home_State{
  InitState():super(
    password: "",
    email: "",
    isemailvalid: true,
    ispasswordvalid: true,
  );
}