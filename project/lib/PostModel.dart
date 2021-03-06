import 'package:flutter/cupertino.dart';
import 'package:project/CommentModel.dart';

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

  List<CommentModel> _comments = [
    CommentModel(
      'Mehdi Avara',
      DateTime.parse('2019-01-01'),
      DateTime.now(),
      'سلام',
      12,
      10,
    ),
    CommentModel(
      'Ali Taba',
      DateTime.parse('2020-01-02'),
      DateTime.now(),
      'محتوای عالی',
      12,
      10,
    ),
    CommentModel(
      'Abolfazl Qas',
      DateTime.parse('2020-01-01'),
      DateTime.now(),
      'شما با من در گروه تماس بگیرید؟',
      12,
      10,
    ),
    CommentModel(
      'Abolfazl Qas',
      DateTime.parse('2020-01-01'),
      DateTime.now(),
      'شما با من در گروه تماس بگیرید؟',
      12,
      10,
    ),
    CommentModel(
      'Abolfazl Qas',
      DateTime.parse('2020-02-01'),
      DateTime.now(),
      'مفید',
      12,
      10,
    ),
    CommentModel(
      'Abolfazl Qas',
      DateTime.parse('2020-01-01'),
      DateTime.now(),
      'شما با من در گروه تماس بگیرید؟',
      12,
      10,
    ),
    CommentModel(
      'Abolfazl Qas',
      DateTime.parse('2020-01-01'),
      DateTime.now(),
      'شما با من در گروه تماس بگیرید؟',
      12,
      10,
    ),
    CommentModel(
      'Abolfazl Qas',
      DateTime.parse('2020-01-01'),
      DateTime.now(),
      'شما با من در گروه تماس بگیرید؟',
      12,
      10,
    ),
  ];

  List<CommentModel> get comments => _comments;

  set comments(List<CommentModel> comments) {
    _comments = comments;
  }

  void addComment(CommentModel comment) {
    _comments.add(comment);
  }

  //** Constructor */
  PostModel(
      this._publisherName,
      this._userName,
      this._gregorianDate,
      this._solarDate,
      this._text,
      this._numLikes,
      this._numDisLikes,
      this._numComments,
      /*this._comments*/);
}
