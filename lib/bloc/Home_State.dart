import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Home_State extends Equatable{

final String password;
final String email;
final String titleText;
final String descriptionText;
final bool isemailvalid;
final bool isemailtouched;
final bool ispasswordvalid;
final bool ispasswordtouched;
final bool isloginsubmited;
final bool isloading;
final bool istitletextvalid;
final bool istitletexttouched;
final bool isdescriptiontextvalid;
final bool isdescriptiontexttouched;



// bool get iseverythingvalid => isemailvalid && ispasswordvalid;
// bool get iseverythingtouched => isemailtouched && ispasswordtouched;
bool get iseverythintouchedandvalid => isemailvalid && ispasswordvalid && isemailtouched && ispasswordtouched;
bool get istexttouchedandvalid => istitletextvalid && isdescriptiontextvalid && istitletexttouched && isdescriptiontexttouched;

Home_State({
  this.password,
  this.email,
  this.titleText,
  this.descriptionText,
  this.isemailvalid,
  this.isemailtouched,
  this.ispasswordvalid,
  this.ispasswordtouched,
  this.isloginsubmited,
  this.isloading,
  this.istitletextvalid,
  this.istitletexttouched,
  this.isdescriptiontextvalid,
  this.isdescriptiontexttouched,
}):super ([password, email, titleText, descriptionText, isemailvalid, isemailtouched, ispasswordvalid, ispasswordtouched, istitletextvalid, isloginsubmited, isloading, istitletextvalid, istitletexttouched, isdescriptiontextvalid, isdescriptiontexttouched]);

Home_State copyWith ({
  String password,
  String email,
  String titleText,
  String descriptionText,

  bool isemailvalid,
  bool isemailtouched,
  bool ispasswordvalid,
  bool ispasswordtouched,
  bool isloginsubmited,
  bool isloading,
  bool istitletextvalid,
  bool istitletexttouched,
  bool isdescriptiontextvalid,
  bool isdescriptiontexttouched,}){
return Home_State(
  password: password ?? this.password,
  email: email ?? this.email,
  titleText: titleText ?? this.titleText,
  descriptionText: descriptionText ?? this.descriptionText,
  isemailvalid: isemailvalid ?? this.isemailvalid,
  isemailtouched: isemailtouched ?? this.isemailtouched,
  ispasswordvalid: ispasswordvalid ?? this.ispasswordvalid,
  ispasswordtouched: ispasswordtouched ?? this.isemailtouched,
  isloginsubmited: isloginsubmited ?? this.isloginsubmited,
  isloading: isloading ?? this.isloading,
  istitletextvalid: istitletextvalid ?? this.istitletextvalid,
  istitletexttouched: istitletexttouched ?? this.istitletexttouched,
  isdescriptiontextvalid: isdescriptiontextvalid ?? this.isdescriptiontextvalid,
  isdescriptiontexttouched: isdescriptiontexttouched ?? this.isdescriptiontexttouched);
  }
}

class Success extends Home_State {
  
  bool get iseverythintouchedandvalid => isemailvalid && ispasswordvalid && isemailtouched && ispasswordtouched;
  bool get istexttouchedandvalid => istitletextvalid && isdescriptiontextvalid && istitletexttouched && isdescriptiontexttouched;

  Success():super(
    isemailvalid: true,
    ispasswordvalid: true,
    isloginsubmited: true,
    ispasswordtouched: false,
    isemailtouched: false,
    isdescriptiontextvalid: true,
    isdescriptiontexttouched: false,
    istitletextvalid: true,
    istitletexttouched: false,
    isloading:false,
  );
  @override
  String toString() => 'Success: Usuario e senha validos';
}

class Fail extends Home_State{
  
  bool get iseverythintouchedandvalid => isemailvalid && ispasswordvalid && isemailtouched && ispasswordtouched;
  bool get istexttouchedandvalid => istitletextvalid && isdescriptiontextvalid && istitletexttouched && isdescriptiontexttouched;

  Fail():super(
    isemailvalid: true,
    ispasswordvalid: true,
    isloginsubmited: true,
    ispasswordtouched: false,
    isemailtouched: false,
    isdescriptiontextvalid: true,
    isdescriptiontexttouched: false,
    istitletextvalid: true,
    istitletexttouched: false,
    isloading:false,
  );
  @override
  String toString() => 'Fail: Usuario e senha invalidos';
}

//class LoginFailure extends Home_State {
  //final String loginerror;
 
  //LoginFailure({@required this.loginerror}) : super(loginerror: loginerror);

  //@override
  //String toString() => 'LoginFailure { error: $loginerror }';
//}

class InitState extends Home_State{
  InitState():super(
    password: "",
    email: "",
    titleText: "",
    descriptionText:"",
    isemailvalid: true,
    isemailtouched: false,
    ispasswordvalid: true,
    ispasswordtouched: false,
    istitletextvalid: true,
    istitletexttouched: false,
    isdescriptiontextvalid: true,
    isdescriptiontexttouched: false,
    isloginsubmited: true,
    isloading: false,
  );
}
