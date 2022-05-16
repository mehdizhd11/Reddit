import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/SignUp.dart';
import 'SplashScreen.dart';

class UserIdentity extends StatelessWidget {
  const UserIdentity({Key? key}) : super(key: key);

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
              "assets/images/logo.png" ,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20,),
            Text('Welcome to Reddit', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'GoogleSans-Medium',
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 150,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {},
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium', 
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic
                  )
                )
              )
            ),
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium', 
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic
                  )
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
