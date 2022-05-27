import 'package:flutter/material.dart';
import 'package:project/ProfileEdit.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              'Profile',
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
              Icons.share_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      //** End the AppBar */
      //************************/
      //** body */
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.reddit,
                      color: Colors.orange,
                      size: 120,
                    ),
                  ),
                  SizedBox(width: 100),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      Text(
                        'UserName : Mehdi Momeni',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'GoogleSans-Medium',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'numPosts              followers              followings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'GoogleSans-Medium',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 40, 15, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileEdit(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(500, 50),
                  primary: Colors.orange,
                  onPrimary: Colors.black,
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/ph.jpg", //** =))))) */
                width: 300,
                height: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
