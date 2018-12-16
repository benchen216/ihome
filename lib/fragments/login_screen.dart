import 'package:flutter/material.dart';
import '../Mixin/validation_mixin.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with Validation_mixin{
  final formKey = GlobalKey<FormState>();
  String password;
  String email;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(bottom: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType:  TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: "you@example.com",
      ),
      validator: validateEmail,
      onSaved: (String value){
        email = value;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'password',
          hintText: "password",
        ),
      validator: validatePassword,
      onSaved: (String value){
          password = value;
      },
    );
  }

  Widget submitButton(){
    return RaisedButton(
      color: Color(0xFFE1BEE7),
      child: Text("Submit!!"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
        }
      },
    );
  }
}