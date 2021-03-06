import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/Settings.dart';
import 'Home.dart';

class CreateSubreddit extends StatefulWidget {
  CreateSubreddit({Key? key}) : super(key: key);
  

  @override
  State<StatefulWidget> createState() => CreateSubredditState();
}

//** Create Subreddit Page ******/

class CreateSubredditState extends State<CreateSubreddit> {
  String _dropDownValue = 'Type';
  final TextEditingController _subRedditName = TextEditingController(text: "");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( //** Back to Settings */
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Subreddit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'GoogleSans-Medium',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                //** Subreddit Name */
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: TextField(
                  maxLength: 30,
                  autofocus: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  cursorColor: Colors.white,
                  controller: _subRedditName,
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
                    hintText: 'Subreddit Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              Container(
                //** Subreddit Type */
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(20),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.black,
                  hint: _dropDownValue == 'Type'
                      ? Text('Type',
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
                  items: ['Public', 'Restricted', 'Private'].map(
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
              //SizedBox(height: 100,),
              Container(  //** Create Button */
                margin: EdgeInsets.fromLTRB(50, 95, 50, 0),                
                child: ElevatedButton(
                  onPressed: () { //** Go to Home Page */
                    addSubReddit(context, _subRedditName.text, _dropDownValue);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 50),
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  addSubReddit(BuildContext context, String subRedditName, String subRedditType) async {
    String response = "addSubReddit&&$subRedditName&&$subRedditType\u0000";
    await Socket.connect("192.168.43.147", 8000).then((serverSocket) {
      serverSocket.write(response);
      serverSocket.flush();
      serverSocket.listen((data) {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      });
    });
  }
}