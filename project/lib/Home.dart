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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
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
            fillColor: Colors.grey,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'GoogleSans-Medium',
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: Icon(
              Icons.search,
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
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false, //* Don't show Label */
        showUnselectedLabels: false, //* Don't Show Label */
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


      // bottomNavigationBar: BottomNavigationBar(
      //   //** Down the Page */
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         //** Home Icon */
      //         icon: Icon(
      //           Icons.home,
      //           color: Colors.orange,
      //         ),
      //         onPressed: () {}, //!! Nothing ////
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       //** Search Icon */
      //       icon: IconButton(
      //         icon: Icon(
      //           Icons.search_rounded,
      //           color: Colors.white,
      //         ),
      //         onPressed: () { //** Push to Search Page */
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Search(),
      //             ),
      //           );
      //         }, 
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon: Icon(
      //           Icons.add_circle,
      //           color: Colors.white,
      //         ),
      //         onPressed: () { //** Push to Add Post Page */
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => AddPost(),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon: Icon(
      //           Icons.wechat_rounded,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {},
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon: Icon(
      //           Icons.notifications_sharp,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {},
      //       ),
      //     ),
      //   ],
      // ),
