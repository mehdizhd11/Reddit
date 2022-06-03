import 'package:flutter/material.dart';
import 'package:project/CommentItem.dart';
import 'package:project/PostItem.dart';
import 'package:project/PostModel.dart';

import 'Settings.dart';

class PostProp extends StatefulWidget {
  PostModel _post;
  PostProp(this._post);

  @override
  State<PostProp> createState() => _PostPropState();
}

class _PostPropState extends State<PostProp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //** App Bar */
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
            //** Add Comment */
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
              hintText: 'Add Comment', //** Hint Text 'Add Comment' */
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
                //** Add Icon */
                icon: Icon(
                  Icons.add,
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
      //****************************************************/
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PostItem(widget._post),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,0,15),
              child: Text(
                'Comments : ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'GoogleSans-Medium',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget._post.numComments,
                itemBuilder: (context, index) {
                  return CommentItem(widget._post.comments[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
