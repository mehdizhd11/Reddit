import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/PostModel.dart';

class PostItem extends StatelessWidget {
  PostItem(this._postModel);
  PostModel _postModel;
  int likeState = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //* Set to Page */
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
              Column(
                //** Publisher and UserName */
                children: [
                  Text(
                    _postModel.publisherName, //** Publisher Name */
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    //** UserName and DateTime */
                    _postModel.userName +
                        '.' +
                        DateTime.now()
                            .difference(_postModel.gregorianDate)
                            .inHours
                            .toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'GoogleSans-Medium',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            //** Text of post */
            width: double.infinity,
            margin: EdgeInsets.only(left: 20),
            child: Text(
              _postModel.text,
              style: TextStyle(
                color: Colors.orange,
                fontFamily: 'GoogleSans-Medium',
                fontSize: 20,
              ),
            ),
          ),
          Row( //** Optional Keys */
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
                    IconButton( //** Like Icon */
                      icon: Icon(
                        Icons.thumb_up_alt_outlined,
                        color: likeState == 1 ? Colors.orange : Colors.black,
                      ),
                      onPressed: () {
                        likeState == 1
                            ? _postModel.numLikes--
                            : _postModel.numLikes++;
                      },
                    ),
                    Text( //** Num Likes */
                      (_postModel.numLikes - _postModel.numDisLikes).toString(),
                      style: TextStyle(
                        color: likeState == 1 ? Colors.orange : (likeState == 0
                          ? Colors.grey : Colors.red),
                        fontSize: 16,
                        fontFamily: 'GoogleSans-Medium',
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton( //** DisLike Icon */
                        icon: Icon(
                          Icons.thumd_down_alt_outlined,
                          color: likeState == -1 ? Colors.red : Colors.black,
                        ),
                        onPressed: () {
                          likeState == -1 ?
                            ///********************************************* */
                        },
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
