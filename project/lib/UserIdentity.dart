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
            //** Reddit icon black and white **/
            Image.asset(
              "assets/images/logo.png" ,
              width: 150,
              height: 150,
            ),
            //! set distance between children **/
            SizedBox(height: 20,),
            //?? Text Welcome
            Text('Welcome to Reddit', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'GoogleSans-Medium',
              ),
            ),
            SizedBox(height: 30),
            //** Sign in Button */
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
            //?? Sign Up Button *//
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
