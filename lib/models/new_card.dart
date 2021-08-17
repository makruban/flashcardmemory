class NewCard {
   late final String? _firstSide;
   late final String? _secondSide;
   late final String _id;
   late final DateTime _dateTime;

   static int count = 0;

   NewCard({String? firstSide, String? secondSide}){
     setFirstSide(firstSide);
     setSecondSide(secondSide);
     setDateTime(DateTime.now());
     setID(DateTime.now().toString());
     count++;
   }

  void setFirstSide(String? first){
    this._firstSide = first;
  }
  void setSecondSide(String? second){
    this._secondSide = second;
  }

   void setID(String id){
     this._id = id;
   }

   void setDateTime(DateTime dateTime){
     this._dateTime = dateTime;
   }
  String? getFirstSide(){
    return _firstSide;
  }

  String? getSecondSide(){
     return _secondSide;
   }

   String getID(){
     return _id;
   }

   DateTime getDateTime(){
     return _dateTime;
   }
  void printValue(){
    print(_firstSide);
    print(_secondSide);
  }
}