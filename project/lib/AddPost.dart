import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Globals.dart';
import 'package:project/Home.dart';
import 'package:intl/intl.dart';

import 'Search.dart';

class AddPost extends StatefulWidget {
  AddPost({Key? key}) : super(key: key);
  final TextEditingController _postText = TextEditingController(text: "");
  final TextEditingController _subRedditName = TextEditingController(text: "");

  @override
  State<StatefulWidget> createState() => AddPostState();
}

class AddPostState extends State<AddPost> {
  String _dropDownValue = 'subReddit';
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
            _subRedditList.add(dataList[i]);
          }
        }
      });
    });
  }

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
              Icons.check_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              addPost(context, widget._postText.text, widget._subRedditName.text);
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
      //** body */
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //** Subreddit Type */
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(20),
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                dropdownColor: Colors.black,
                hint: _dropDownValue == 'subReddit'
                    ? Text('subReddit',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'GoogleSans-Medium',
                          fontWeight: FontWeight.bold,
                        ))
                    : Text(
                        _dropDownValue,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'GoogleSans-Medium',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.orange,
                ),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontFamily: 'GoogleSans-Medium',
                  fontWeight: FontWeight.bold,
                ),
                items: _subRedditList.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val!;
                    },
                  );
                },
              ),
            ),
            //** End the Title */
            //****************************************/
            //**** Description */
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: TextField(
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                autofocus: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'GoogleSans-Medium',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                cursorColor: Colors.white,
                controller: widget._postText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  hintText: 'Your Text Post (optional)',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium',
                  ),
                  contentPadding: EdgeInsets.all(20),
                  //hintTextDirection: TextDirection.ltr,
                ),
              ),
            ), //** End the Discription */
          ],
        ),
      ),
      //** End the Body */
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
  addPost(BuildContext context, String postText,String subRedditName) async {
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String response = "addPost&&$user_name&&$postText&&$subRedditName&&$date\u0000";
    await Socket.connect("192.168.43.147", 8000).then((serverSocket) {
      serverSocket.write(response);
      serverSocket.flush();
      serverSocket.listen((data) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          )
        );
      });
    });
  }
}
