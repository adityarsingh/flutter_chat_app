import 'package:chatapp/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/widget/widget.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotpasswordcontrolerf = TextEditingController();

  AuthService authService = new AuthService();
  final Function toggleView = null;

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  passreset() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService.resetPass(forgotpasswordcontrolerf.text);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email Your Email',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(
                controller: forgotpasswordcontrolerf,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Send Email'),
                onPressed: () {
                  passreset();
                },
              ),
              FlatButton(
                child: Text('Sign In'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignIn(toggleView)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
