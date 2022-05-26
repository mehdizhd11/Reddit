class CommentModel {
  //** Fileds for Comment */
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

  //** Constructor */
  CommentModel(
    this._userName,
    this._gregorianDate,
    this._solarDate,
    this._text,
    this._numLikes,
    this._numDisLikes,
  );
}
