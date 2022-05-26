import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'UserIdentity.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignUpState();
}

//** Sign Up Page Fo first time user */
class SignUpState extends State<SignUp> {
  bool showPass = true; //** password visiblity */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( //** BAck to UserIdentity */
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.push(context,
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
                  obscureText: showPass,
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
              Container(  //** Continue Button */
                margin: EdgeInsets.fromLTRB(50, 70, 50, 0),
                child: ElevatedButton(
                  onPressed: () { //** Go to Home Page */
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
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
            ],
          ),
        ));
  }
}
