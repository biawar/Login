import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Home_events extends Equatable{

Home_events([List properties = const []]):super(properties);

}

class IsEmailChanged extends Home_events{
  final String email;
  IsEmailChanged({this.email}):super([email]);
  @override
  String toString() => 'IsEmailChanged { email: $email }';
}

 class IsPasswordChanged extends Home_events{
   final String password;
   IsPasswordChanged({this.password}):super([password]);
   @override
   String toString() => 'IsPasswordChanged { password: $password}';
 }
 
class IsTitleTextChanged extends Home_events{
   final String titleText;
   IsTitleTextChanged({this.titleText}):super([titleText]);
   @override
   String toString() => 'IsTitleTextChanged { titleText: $titleText}';
 }

class IsDescriptionTextChanged extends Home_events{
   final String descriptionText;
   IsDescriptionTextChanged({this.descriptionText}):super([descriptionText]);
   @override
   String toString() => 'IsDescriptionTextChanged { descriptionText: $descriptionText}';
 } 

class LoginButtonPressed extends Home_events {
  final String email;
  final String password;
  int numero;

  LoginButtonPressed({
    @required this.email,
    @required this.password,
    this.numero,
  }) : super([email, password, numero]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password }';
}

class AddButtonPressed extends Home_events {
  @override
  String toString() =>
      'LoginButtonPressed';
}

class ButtonCreatePressed extends Home_events {
  final String email;
  final String password;

  ButtonCreatePressed({
    @required this.email,
    @required this.password,
  
  }) : super([email, password]);

  @override
  String toString() =>
      'ButtonCreatePressed { username: $email, password: $password }';
}

class SendAddButtonPressed extends Home_events {
  final String titleText;
  final String descriptionText;

  SendAddButtonPressed({
    @required this.titleText,
    @required this.descriptionText,
  
  }) : super([titleText, descriptionText]);

   @override
  String toString() =>
      'SendAddButtonPressed { titleText: $titleText, titleText: $descriptionText }';
}


class SendEditButtonPressed extends Home_events {
  final String titleText;
  final String descriptionText;

  SendEditButtonPressed({
    @required this.titleText,
    @required this.descriptionText,
  
  }) : super([titleText, descriptionText]);

   @override
  String toString() =>
      'SendEditButtonPressed { titleText: $titleText, titleText: $descriptionText }';
}

class ReadButtonPressed extends Home_events {
  @override
  String toString() =>
      'ReadButtonPressed';
}


class LogoutButtonPressed extends Home_events {
  @override
    String toString() =>
      'LogoutButtonPressed';
}

class IsEditIconButtonPressed extends Home_events {
   @override
  String toString() =>
      'IsEditIconButtonPressed';
}