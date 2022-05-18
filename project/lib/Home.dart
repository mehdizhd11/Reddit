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
      //** Scaffold Color */
      backgroundColor: Colors.black,
      //** Down The Page */
      bottomNavigationBar: BottomNavigationBar(
        //** Style */
        type: BottomNavigationBarType.fixed, // Fixed 
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
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
