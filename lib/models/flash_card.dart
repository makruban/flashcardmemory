import 'package:intl/intl.dart';


class FlashCard {
   late final String? _firstSide;
   late final String? _secondSide;
   late final String _id;
   late final String _creatingDateCard;

   static int count = 0;

   FlashCard({String? firstSide, String? secondSide}){
     setFirstSide(firstSide);
     setSecondSide(secondSide);
     setCreatingDateCard(DateTime.now());
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

   void setCreatingDateCard(DateTime dateTime){
     this._creatingDateCard = DateFormat('yyyy-MM-dd').format(dateTime);
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

   String getDateTime(){
     return _creatingDateCard;
   }
  void printValue(){
    print(_firstSide);
    print(_secondSide);
  }
}