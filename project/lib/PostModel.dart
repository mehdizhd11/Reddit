import 'package:flutter/cupertino.dart';

class PostModel {
  //** Fields for Posts */
  late String _publisherName;

  String get publisherName => _publisherName;

  set publisherName(String publisherName) {
    _publisherName = publisherName;
  } //** Community Name */
  late String _userName;

  String get userName => _userName;

  set userName(String userName) {
    _userName = userName;
  } //** User Name */
  late DateTime _gregorianDate;

  DateTime get gregorianDate => _gregorianDate;

  set gregorianDate(DateTime gregorianDate) {
    _gregorianDate = gregorianDate;
  } //** Gregorian date */
  late DateTime _solarDate;

  DateTime get solarDate => _solarDate;

  set solarDate(DateTime solarDate) {
    _solarDate = solarDate;
  } //** تاریخ شمسی */
  late String _text;

  String get text => _text;

  set text(String text) {
    _text = text;
  } //** text */
  late int _numLikes;

  int get numLikes => _numLikes;

  set numLikes(int numLikes) {
    _numLikes = numLikes;
  }
  late int _numDisLikes;

  int get numDisLikes => _numDisLikes;

  set numDisLikes(int numDisLikes) {
    _numDisLikes = numDisLikes;
  }
  late int _numComments;

  int get numComments => _numComments;

  set numComments(int numComments) {
    _numComments = numComments;
  }
  List<PostModel> _comments = []; //** incomplete */

  List<PostModel> get comments => _comments; //** incomplete */

  set comments(List<PostModel> comments) { //** incomplete */
    _comments = comments;
  }

  // void addComment() { //** incomplete */
 
  // }
  
  //** Constructor */
  PostModel(this._publisherName,this._userName,this._gregorianDate,
    this._solarDate,this._text,this._numLikes,this._numDisLikes,this._numComments,this._comments);

}
