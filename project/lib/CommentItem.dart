import 'package:flutter/material.dart';
import 'package:project/CommentModel.dart';

class CommentItem extends StatefulWidget {
  CommentModel _commentModel;
  CommentItem(this._commentModel);

  @override
  State<CommentItem> createState() => _CommentItemState(_commentModel);
}

class _CommentItemState extends State<CommentItem> {
  CommentModel _commentModel;
  _CommentItemState(this._commentModel);
  int likeState = 0;
  bool _collections = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //** Set to page */
      margin: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        //** Beautiful :) */
        color: Colors.black,
        border: Border.all(
          color: Colors.orange,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                //** Profile Image */
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.orange,
                ),
                radius: 30.0,
                backgroundColor: Colors.black,
                //  child: Image.asset(), //** incompelete Profile */ //* 14 minuts 41////
              ),
              Text(
                //** UserName and DateTime */
                _commentModel.userName +
                    '  ' +
                    DateTime.now()
                        .difference(_commentModel.gregorianDate)
                        .inDays
                        .toString() + '  Days ago',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GoogleSans-Medium',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
          Container(
            //** Text of post */
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10,0,0,25),
            child: Text(
              _commentModel.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GoogleSans-Medium',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
              //** Optiobal Key */
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              //** optional Keys */
              children: [
                Container(
                  //** Like , numLikes , DisLike */
                  color: Colors.black,
                  margin: EdgeInsets.only(left: 20),
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //** Icons and Text */
                    children: [
                      IconButton(
                        //** Like Icon */
                        icon: Icon(
                          Icons.thumb_up,
                          color: likeState == 1 ? Colors.orange : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (likeState == 1) {
                              likeState = 0;
                              _commentModel.numLikes--;
                            } else if (likeState == -1) {
                              likeState = 1;
                              _commentModel.numLikes++;
                              _commentModel.numDisLikes--;
                            } else {
                              likeState = 1;
                              _commentModel.numLikes++;
                            }
                          });
                        },
                      ),
                      Text(
                        //** Num Likes */
                        'Vote',
                        style: TextStyle(
                          color: likeState == 1
                              ? Colors.orange
                              : (likeState == 0 ? Colors.grey : Colors.red),
                          fontSize: 16,
                          fontFamily: 'GoogleSans-Medium',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        //** DisLike Icon */
                        icon: Icon(
                          Icons.thumb_down,
                          color: likeState == 1 ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (likeState == -1) {
                              likeState = 0;
                              _commentModel.numDisLikes--;
                            } else if (likeState == 1) {
                              likeState = -1;
                              _commentModel.numDisLikes++;
                              _commentModel.numLikes--;
                            } else {
                              likeState = -1;
                              _commentModel.numDisLikes++;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                TextButton.icon(
                  //** Reply */
                  icon: Icon(
                    Icons.reply_all_rounded,
                    color: Colors.orange,
                  ),
                  label: Text(
                    'Reply',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),                  
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width:  40,
                ),
                Icon(
                  Icons.report,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 50,
                ),
                IconButton(  
                  //** _Collections */         
                  icon: Icon(
                    Icons.bookmark_add_outlined,
                    color: _collections ? Colors.orange : Colors.white,                  
                  ),
                  onPressed: () {
                    setState(() {
                      if (_collections)
                        _collections = false;
                      else
                        _collections = true;
                    });
                  },
                ),
              ]
            )
        ],
      ),
    );
  }
}
