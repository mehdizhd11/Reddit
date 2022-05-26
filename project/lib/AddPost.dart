import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Home.dart';

import 'Search.dart';

class AddPost extends StatefulWidget {
  AddPost({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddPostState();
}

class AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //** Scaffold color */
      backgroundColor: Colors.black,
      //** App Bar */
      appBar: AppBar(
        backgroundColor: Colors.black,
          //** Icon Close */
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
            )
          ],
          centerTitle: true,
          title: Text(
            'New Post',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
              fontFamily: 'GoogleSans-Medium',
              fontWeight: FontWeight.bold,
            ),
          ),
      ),
      //*************************************/
      //** Down the Page */
      bottomNavigationBar: BottomNavigationBar(
        //** Style */
        iconSize: 25,
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false, //** Don't show Label */
        showUnselectedLabels: false, //** Don't Show Label */
        items: [
          //** Home Icon Page */
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
              ),
              label: 'Home'),
          //** Search Icon */
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                  );
                },
              ),
              label: 'Search'),
          //** Add Post Icon Page */
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.orange,
                ),
                onPressed: () {},
              ),
              label: 'Add Post'),
          //** Chats Icon Page */
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.wechat_rounded,
                  color: Colors.white,
                ),
                onPressed: () {}, //** Nothing */
              ),
              label: 'Chats'),
          //** Notification Icon Page */
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.notifications_sharp,
                  color: Colors.white,
                ),
                onPressed: () {}, //** Nothing */
              ),
              label: 'Notification'),
        ],
      ),
    );
  }
}
