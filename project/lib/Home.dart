import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/AddPost.dart';
import 'package:project/Search.dart';

class Home extends StatefulWidget {
  //** Home Page */
  Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //** App BAr , Search Icon */
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'GoogleSans-Medium', //** Font */
            fontWeight: FontWeight.bold,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'GoogleSans-Medium',
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: Icon(
              Icons.search, //** Search Icon */
              color: Colors.black,
            ),
          ),
        ),
      ),
      //** Scaffold Color */
      backgroundColor: Colors.black,
      //** Down The Page */
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
          //** Home Icon */
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: "Home"
          ),
          //** Search IconButton */
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.search_rounded,
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
            ),
            label: "Search",
          ),
          //* Add Icon Push to Add Post */
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.add_circle
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(),
                  ),
                );
              },
            ),
            label: "Add",
          ),
          //** Chats Icon Push To Nothing */**************** */
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
            label: "Chats",
          ),
          //** Noti Icon Push To Nothing */***************** */
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_rounded
            ),
            label: "Notifications",
          ),
        ]
      ),
    );
  }
}