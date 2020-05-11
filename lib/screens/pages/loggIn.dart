import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 42, 37, 1),

      body:(isLoading) ? _drawLoading() : _drawLoginForm(),
    );
  }

  Widget _drawLoginForm(){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'Please Enter Your Email';
                }
                return null;
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey.shade700),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(216, 142, 121, 1),
                      
                    ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ) ,
              ),
            ),
            SizedBox(height: 50,),
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'Please Enter Your Password';
                }
                return null;
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password' ,
                labelStyle: TextStyle(color: Colors.grey.shade700),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(216, 142, 121, 1),
                    ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  )
                ),
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    setState(() {
                      isLoading = true;
                    });
                  }
                },
                child: Text('Login' , style: TextStyle(color: Colors.white),),
                color: Color.fromRGBO(216, 142, 121, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawLoading(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
