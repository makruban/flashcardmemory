class NewCard {
   String? _firstSide;
   String? _secondSide;

  void setFirstSide(String first){
    this._firstSide = first;
  }
  void setSecondSide(String second){
    this._secondSide = second;
  }

  void printValue(){
    print(_firstSide);
  }
}