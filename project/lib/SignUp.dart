import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignUpState();
}

//** Sign Up Page Fo first time user */
class SignUpState extends State<SignUp> {
  bool show = true; //** password visiblity */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container( //*************** Input Email @gmail.com from user */
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
              Container( //&& Input UserNAme From client **/
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
              Container(    //** PassWord set Client */
                margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextField(
                  obscureText: show,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: IconButton( //&& Password Visiblity **/
                        onPressed: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        icon: Icon(
                            show ? Icons.visibility : Icons.visibility_off),
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
            ],
          ),
        ));
  }
}
