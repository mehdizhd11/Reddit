import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/AddPost.dart';
import 'package:project/PostItem.dart';
import 'package:project/PostModel.dart';
import 'package:project/Search.dart';
import 'package:project/Settings.dart';

class Home extends StatefulWidget {
  //** Home Page */
  Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<PostModel> _postList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //** App Bar , Search Icon */
      appBar: AppBar(
        backgroundColor: Colors.black, //** App Bar color */
        title: TextField( //** Search Bar */
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'GoogleSans-Medium', //** Font */
            fontWeight: FontWeight.bold,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 15, 13, 13),
            hintText: 'Search', //** Hint Text 'Search' */
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'GoogleSans-Medium',
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: Icon(
              Icons.search, //** Search Icon */
              color: Colors.orange,
            ),
          ),
        ),
        actions: [ //** Setting Icon */
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => Settings(), //** Push to Setting */
                  ),
                );
            },
          ),
        ],
      ),
      //** End the AppBar */
      //*****************************************************/
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
                label: "Home"),
            //** Search IconButton */
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.search_rounded,
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
              label: "Search",
            ),
            //* Add Icon Push to Add Post */
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  Navigator.push(
                    context,
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
            //** Notif Icon Push To Nothing */***************** */
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: "Notifications",
            ),
          ]),
      //** End the Bottom Navi...*/
      //**********************************************************/
      //** List of Posts */
      body: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          width: double.infinity,
          child: ListView.builder(
              itemCount: _postList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return PostItem(_postList[index]);
              })),
      //** End the List of Posts */
      //************************************** */
    );
  }
}
