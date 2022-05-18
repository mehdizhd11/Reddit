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
      bottomNavigationBar: BottomNavigationBar(
        //** Down the Page */
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              //** Home Icon */
              icon: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              onPressed: () {}, //!! Nothing ////
            ),
          ),
          BottomNavigationBarItem(
            //** Search Icon */
            icon: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
              onPressed: () { //** Push to Search Page */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              }, 
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              onPressed: () { //** Push to Add Post Page */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(),
                  ),
                );
              },
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.wechat_rounded,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.notifications_sharp,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
