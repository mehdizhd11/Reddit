import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Home.dart';
import 'package:project/PostModel.dart';

class PostItem extends StatefulWidget {
  PostModel _postModel;
  PostItem(this._postModel);

  @override
  State<StatefulWidget> createState() => new PostItemState(_postModel);
}

class PostItemState extends State<PostItem> {
  PostModel _postModel;
  PostItemState(this._postModel);
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
          Row(
            //** Optional Keys */
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
                            _postModel.numLikes--;
                          } else if (likeState == -1) {
                            likeState = 1;
                            _postModel.numLikes++;
                            _postModel.numDisLikes--;
                          } else {
                            likeState = 0;
                            _postModel.numLikes++;
                          }
                        });
                      },
                    ),
                    Text(
                      //** Num Likes */
                      (_postModel.numLikes - _postModel.numDisLikes).toString(),
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
                            _postModel.numDisLikes--;
                          } else if (likeState == 1) {
                            likeState = -1;
                            _postModel.numDisLikes++;
                            _postModel.numLikes--;
                          } else {
                            likeState = -1;
                            _postModel.numDisLikes++;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20,), //** Distance betWeen Comments and ... */
              TextButton.icon( //** Comments And numComments */
                icon: Icon(Icons.chat_bubble_outline),
                label: Text(
                  _postModel.numComments.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => Home(), //** INcompelete go to POSTPROP */!!!!!
                  ),
                );
                },
              ),
              SizedBox(width: 30,), //** Distance */
              TextButton.icon( //** Share  */
                onPressed: () {}, //** NOTHING */
                icon: Icon(Icons.share_outlined),
                label: Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              SizedBox(width: 10,), //** Distance */
              Icon(
                Icons.favorite,
                color: Colors.orange,
              )
            ],
          )
        ],
      ),
    );
  }
}
