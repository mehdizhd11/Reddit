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
  bool _collections = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //* Set to Page */
      margin: EdgeInsets.all(10),
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
                  Icons.reddit,
                  color: Colors.orange,
                  size: 35,
                ),
                radius: 30.0,
                backgroundColor: Colors.black,
                //  child: Image.asset(), //** incompelete Profile */ //* 14 minuts 41////
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //** Publisher and UserName */
                children: [
                  Text(
                    _postModel.publisherName, //** Publisher Name */
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'GoogleSans-Medium',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    //** UserName and DateTime */
                    _postModel.userName +
                        '  ' +
                        DateTime.now()
                            .difference(_postModel.gregorianDate)
                            .inDays
                            .toString() +
                        '  Days ago',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GoogleSans-Medium',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
          Container(
            //** Text of post */
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 25),
            child: Text(
              _postModel.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GoogleSans-Medium',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            //** Optional Keys */
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
                        Icons.thumb_up,
                        color: likeState == 1 ? Colors.orange : Colors.white,
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
                            likeState = 1;
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
                            : (likeState == 0 ? Colors.white : Colors.red),
                        fontSize: 16,
                        fontFamily: 'GoogleSans-Medium',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      //** DisLike Icon */
                      icon: Icon(
                        Icons.thumb_down,
                        color: likeState == -1 ? Colors.red : Colors.white,
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
              SizedBox(
                width: 40,
              ), //** Distance betWeen Comments and ... */
              TextButton.icon(
                //** Comments And numComments */
                icon: Icon(
                  Icons.chat_outlined,
                  color: Colors.orange,
                ),
                label: Text(
                  _postModel.numComments.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Home(), //** INcompelete go to POSTPROP */!!!!!
                    ),
                  );
                },
              ),
              SizedBox(
                width: 40,
              ), //** Distance */
              TextButton.icon(
                  //** Share  */
                  onPressed: () {}, //** NOTHING */
                  icon: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Share',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                width: 50,
              ), //** Distance */
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
              )
            ],
          )
        ],
      ),
    );
  }
}
