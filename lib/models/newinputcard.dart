import 'package:flash_card/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewInputCard extends StatefulWidget {
  final Function addNewCard;
  final GlobalKey<ScaffoldState> scaffoldKey;

  // Function newInputDictionary;

  NewInputCard({required Key keyInput, required this.addNewCard, required this.scaffoldKey})
      : super(key: keyInput);

  @override
  NewInputCardState createState() => NewInputCardState();
}

class NewInputCardState extends State<NewInputCard> {
  late TextEditingController _firstSideController;
  late TextEditingController _secondSideController;
  final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _firstSideFocus = FocusNode();
  final _secondSideFocus = FocusNode();

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
    _firstSideFocus.dispose();
    _secondSideFocus.dispose();
    super.dispose();
  }

  void addNewInputCard() {
    if (_formKey.currentState!.validate()) {
      widget.addNewCard(_firstSideController.text, _secondSideController.text);
      _firstSideController.clear();
      _secondSideController.clear();
      _showMessage(message: 'Карточка добавлена в словарь');
    }
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _showMessage({String? message}) {
    widget.scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).accentColor,
        duration: Duration(milliseconds: 500),
        content: FittedBox(
          child: Text(
            message!,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              // fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }

  // void validateForm() {
  //
  // }

  // NewCard newCard = NewCard();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            focusNode: _firstSideFocus,
            onFieldSubmitted: (_) {
              _fieldFocusChange(context, _firstSideFocus, _secondSideFocus);
            },
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(200),
            ],
            validator: (val) =>
                val!.isEmpty ? 'Сторона должна быть заполнена' : null,
          ),
          Divider(
            color: Colors.black87,
            thickness: 1.0,
            indent: 6.0,
            endIndent: 6.0,
          ),
          TextFormField(
            focusNode: _secondSideFocus,
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(200),
            ],
            validator: (val) =>
                val!.isEmpty ? 'Сторона должна быть заполнена' : null,
          ),
        ],
      ),
    );
  }
}
