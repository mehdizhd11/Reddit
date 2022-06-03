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
        title: Center(
          child: Text(
            'Post',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'GoogleSans-Medium',
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
