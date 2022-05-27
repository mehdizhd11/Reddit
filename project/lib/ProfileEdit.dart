import 'package:flutter/material.dart';
import 'package:project/Profile.dart';

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //** App Bar */
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.reddit,
              color: Colors.orange,
            ),
            label: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'GoogleSans-Medium',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
          )
        ],
      ),
      //** End the App Bar */
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              //* Input Email @gmail.com from user */
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
                  hintText: 'New Email',
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
              //** User Name */
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
                  hintText: 'New Username',
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
                decoration: InputDecoration(
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: IconButton(
                      //** Password Visiblity */
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
                  hintText: 'New Password',
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
      ),
    );
  }
}
