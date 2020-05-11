import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController nameController , emailController , messageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(21, 32, 43, 1),
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
      ),
      body:(isLoading) ? _drawLoading() : _drawMessageForm(),
    );
  }

  Widget _drawMessageForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              validator: (value){
                if(value.isEmpty){
                  return 'Please Enter Your Name';
                }
                return null;
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Your Name' ,
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
            TextFormField(
              controller: emailController,
              validator: (value){
                if(value.isEmpty){
                  return 'Please Enter Your Email';
                }
                return null;
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Your Email' ,
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
            TextFormField (
              controller: messageController,
              validator: (value){
                if(value.isEmpty){
                  return 'Please Enter Your Message';
                }
                return null;
              },
              style: TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Your Message' ,
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

                    String name = nameController.text;
                    String email = emailController.text;
                    String message = messageController.text;

                    setState(() {
                      isLoading = true;
                    });
                  }
                },
                child: Text('Send Messege' , style: TextStyle(color: Colors.white),),
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

