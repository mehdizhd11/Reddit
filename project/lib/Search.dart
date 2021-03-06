import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/AddPost.dart';
import 'package:project/Home.dart';

import 'Settings.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  List<String> _subRedditList = [];

  Future<void> requestData() async {
    String response = "getSubReddit\u0000";
    await Socket.connect("192.168.43.147", 8000).then((serverSocket) {
      serverSocket.write(response);
      serverSocket.flush();
      serverSocket.listen((data) {
        String dataString = String.fromCharCodes(data);
        List<String> dataList = dataString.split("\n");
        if (dataList[0] == "success") {
          _subRedditList.clear();
          for (int i = 1; i < dataList.length; i++) {
            _subRedditList.add(dataList[i].split("&&")[0]);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //** App Bar , Search Icon , Setting Push */
        backgroundColor: Colors.black,
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
            fillColor: Color.fromARGB(255, 32, 28, 28),
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ), //** Hint Text 'Search' */
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
          )
        ],
      ),
      //** End the App Bar */
      //**************************************/
      //** Scaffold color */
      backgroundColor: Colors.black,
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
          BottomNavigationBarItem( //** Home Icon */
            icon: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,              
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(), //** Push to Home */
                    ),
                  );
              },
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem( //** Search Icon */
            icon: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.orange,
              ),
              onPressed: () {}, //** Nothing */
            ),
            label: 'Search'
          ),
          BottomNavigationBarItem( //** Add Post */
            icon: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPost(), //** Push to AddPost */
                    ),
                  );
              },
            ),
            label: "Add",
          ),
          BottomNavigationBarItem( //** Chat Icon */
            icon: IconButton(
              icon: Icon(
                Icons.wechat_rounded,
                color: Colors.white,
              ),
              onPressed: () {}, //** Nothing */
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem( //** Notifi... Icon */
            icon: IconButton(
              icon: Icon(
                Icons.notifications_sharp,
                color: Colors.white,
              ),
              onPressed: () {}, //** Nothing */
            ),
            label: "Notifications",
          ),
        ],
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1), () {
          requestData();
          return _subRedditList;
        }),
        builder: (context, snapshot) {
          try {
            requestData();
            return ListView.builder(
              itemCount: _subRedditList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _subRedditList[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {},
                );
              },
            );
          } catch (e) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
