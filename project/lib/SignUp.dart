import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Globals.dart';
import 'Home.dart';
import 'UserIdentity.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController _username = TextEditingController(text: "");
  final TextEditingController _password = TextEditingController(text: "");
  final TextEditingController _email = TextEditingController(text: "");
  String _log = "";

  @override
  State<StatefulWidget> createState() => SignUpState();
}

//** Sign Up Page Fo first time user */
class SignUpState extends State<SignUp> {
  bool showPass = true; //** password visiblity */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //** Back to UserIdentity */
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserIdentity(),
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                //*************** Input Email @gmail.com from user */
                margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  controller: widget._email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.orange,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.orange,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(25),
                  ),
                ),
              ),
              Container(
                //&& Input UserName From client **/
                margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  controller: widget._username,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.orange,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.orange,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(25),
                  ),
                ),
              ),
              Container(
                //** PassWord set Client */
                margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextField(
                  obscureText: showPass,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  controller: widget._password,
                  decoration: InputDecoration(
                    suffixIcon: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: IconButton(
                        //&& Password Visiblity **/
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: Icon(
                            showPass ? Icons.visibility : Icons.visibility_off),
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.orange,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.orange,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(25),
                  ),
                ),
              ),
              //SizedBox(height: 100,),
              Container(
                //** Continue Button */
                margin: EdgeInsets.fromLTRB(50, 70, 50, 0),
                child: ElevatedButton(
                  onPressed: () {
                    //** Go to Home Page */
                    if (widget._email.text.isEmpty ||
                        widget._password.text.isEmpty ||
                        widget._username.text.isEmpty) {
                      setState(() {
                        widget._log = "Please fill all the fields";
                      });
                    } else {
                      signUp(context, widget._username.text,
                          widget._password.text, widget._email.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 50),
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget._log,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: 'GoogleSans-Medium',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }

  signUp(BuildContext context, String username, String password,
      String email) async {
    String response = "signUp&&$username&&$password&&$email\u0000";
    await Socket.connect("192.168.43.147", 8000).then((serverSocket) {
      serverSocket.write(response);
      serverSocket.flush();
      serverSocket.listen((data) {
        String dataString = String.fromCharCodes(data);
        if (dataString == "success") {
          widget._log = "";
          user_name = username;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          setState(() {
            widget._log = dataString;
          });
        }
      });
    });
  }
}
