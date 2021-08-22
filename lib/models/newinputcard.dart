import 'package:flutter/material.dart';

class NewInputCard extends StatefulWidget {
  final Function addNewCard;

  // Function newInputDictionary;

  NewInputCard({required Key keyInput, required this.addNewCard})
      : super(key: keyInput);

  @override
  NewInputCardState createState() => NewInputCardState();
}

class NewInputCardState extends State<NewInputCard> {
  late TextEditingController _firstSideController;
  late TextEditingController _secondSideController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firstSideController = TextEditingController();
    _secondSideController = TextEditingController();
  }

  @override
  void dispose() {
    _firstSideController.dispose();
    _secondSideController.dispose();
    super.dispose();
  }

  void addNewInputCard() {
    widget.addNewCard(_firstSideController.text, _secondSideController.text);
  }

  void validateForm() {
    _firstSideController.clear();
    _secondSideController.clear();
  }

  // NewCard newCard = NewCard();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: _firstSideController,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
            ),
            decoration: InputDecoration(
              hintText: 'Передняя сторона',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            maxLines: null,
          ),
          Divider(
            color: Colors.black87,
            thickness: 1.0,
            indent: 6.0,
            endIndent: 6.0,
          ),
          TextFormField(
            //         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DictionaryList(
            // listDictionary: storeOfCard,
            // ),),),
            controller: _secondSideController,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
            ),
            decoration: InputDecoration(
              hintText: 'Задняя сторона',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            maxLines: null,
          ),
        ],
      ),
    );
  }
}