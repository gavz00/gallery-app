import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:apps/pages/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  static const String routeName = "login";

  @override
  _LoginPageState createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  var formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Gallery")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                                setState(() {
                                  if(_userNameController.text==""||_passwordController.text==""){
                                    return  showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text("Sorry"),
                                              content: const Text('Please insert Username and/or Password.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            )
                                    );
                                  }else{
                                    Navigator.pushNamed(context, GalleryPage.routeName);
                                  }
                                });
                          },
                          child: Text("Login"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
