import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/AddPost.dart';
import 'package:project/CommentModel.dart';
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
  List<CommentModel> _commentList = [];
  List<PostModel> _postList = [];
  Future<void> requestData() async {
    String response = "feed\u0000";
    await Socket.connect("192.168.43.147", 8000).then((serverSocket) {
      serverSocket.write(response);
      serverSocket.flush();
      serverSocket.listen((data) {
        String dataString = String.fromCharCodes(data);
        List<String> dataList = dataString.split("\n");
        if (dataList[0] == "success") {
          _postList.clear();
          for (int i = 1; i < dataList.length; i++) {
            List<String> postData = dataList[i].split("&&");
            _postList.add(
              PostModel(
                postData[0],
                postData[1],
                DateTime.parse(postData[2]),
                DateTime.now(),
                postData[3],
                int.parse(postData[4]),
                int.parse(postData[5]),
                int.parse(postData[6]),
              ),
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //** App Bar , Search Icon */
        appBar: AppBar(
          backgroundColor: Colors.black, //** App Bar color */
          title: TextField(
            //** Search Bar */
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
              prefixIcon: IconButton(
                //** Search Icon */
                icon: Icon(
                  Icons.search,
                  color: Colors.orange,
                ),
                onPressed: () {},
              ),
            ),
          ),
          actions: [
            //** Setting Icon */
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
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
        body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 1), () {
            requestData();
            return _postList;
          }),
          builder: (context, snapshot) {
            try {
              requestData();
              return ListView.builder(
                itemCount: _postList.length,
                itemBuilder: (context, index) {
                  return PostItem(_postList[index]);
                },
              );
            } catch (e) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
        //** End the List of Posts */
        //************************************** */
        );
  }
}
