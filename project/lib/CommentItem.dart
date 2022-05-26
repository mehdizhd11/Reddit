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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //** Set to page */
      margin: EdgeInsets.all(30),
      height: 150,
      decoration: BoxDecoration(
        //** Beautiful :) */
        color: Colors.black,
        border: Border.all(
          color: Colors.orange,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                //** Profile Image */
                radius: 30.0,
                backgroundColor: Colors.orange,
                //  child: Image.asset(), //** incompelete Profile */ //* 14 minuts 41////
              ),
              Text(
                //** UserName and DateTime */
                _commentModel.userName +
                    '.' +
                    DateTime.now()
                        .difference(_commentModel.gregorianDate)
                        .inHours
                        .toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'GoogleSans-Medium',
                  fontSize: 12,
                ),
              )
            ],
          ),
          Container(
            //** Text of post */
            width: double.infinity,
            margin: EdgeInsets.only(left: 20),
            child: Text(
              _commentModel.text,
              style: TextStyle(
                color: Colors.orange,
                fontFamily: 'GoogleSans-Medium',
                fontSize: 20,
              ),
            ),
          ),
          Row(
              //** Optiobal Key */
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  //** Like , numLikes , DisLike */
                  color: Colors.black,
                  margin: EdgeInsets.only(left: 20),
                  height: 30,
                  child: Row(
                    //** Icons and Text */
                    children: [
                      IconButton(
                        //** Like Icon */
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
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
                              likeState = 0;
                              _commentModel.numLikes++;
                            }
                          });
                        },
                      ),
                      Text(
                        //** Num Likes */
                        (_commentModel.numLikes - _commentModel.numDisLikes)
                            .toString(),
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
                          Icons.thumb_down_alt_outlined,
                          color: likeState == 1 ? Colors.red : Colors.black,
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
              ]
            )
        ],
      ),
    );
  }
}
