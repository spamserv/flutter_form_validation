import 'package:flutter/material.dart';

import '../widgets/rounded_label.dart';
import '../widgets/rounded_input_field.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  void _validateInput() {
    // If string is empty, return
    if (_stringToValidate == null) {
      return;
    }

    // Check if string has 8 or more characters
    if (_stringToValidate.length >= 8) {
      setState(() {
        _ruleMinCharacters = true;
      });
    } else {
      setState(() {
        _ruleMinCharacters = false;
      });
    }

    // Check if string contains uppercase letter
    if (_stringToValidate.contains(new RegExp(r'[A-Z]'))) {
      setState(() {
        _ruleOneUppercase = true;
      });
    } else {
      setState(() {
        _ruleOneUppercase = false;
      });
    }

    // Check if string contains number and if number divides
    if (_stringToValidate.contains(new RegExp(r'[0-9]')) && new RegExp(r'[a-zA-Z].+[0-9].+[a-zA-Z]').firstMatch(_stringToValidate) != null) {
      setState(() {
        _ruleNumberDivides = true;
      });
    } else {
      setState(() {
        _ruleNumberDivides = false;
      });
    }

    // if (_formKey.currentState.validate()) {
    //   _formKey.currentState.save();
    // }
  }

  void _storeString(String value) {
    _stringToValidate = value;
  }

  bool _ruleMinCharacters = false;
  bool _ruleOneUppercase = false;
  bool _ruleNumberDivides = false;

  String _stringToValidate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Form Validation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: RoundedInputField(storeString: _storeString),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _validateInput();
                  },
                  child: const Text(
                    'VALIDATE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            _ruleMinCharacters
                ? RoundedLabel(
                    size: size,
                    icon: Icons.check,
                    iconColor: Colors.green,
                    text: "Min 8 znakova")
                : RoundedLabel(
                    size: size,
                    icon: Icons.close,
                    iconColor: Theme.of(context).primaryColor,
                    text: "Min 8 znakova"),
            _ruleOneUppercase
                ? RoundedLabel(
                    size: size,
                    icon: Icons.check,
                    iconColor: Colors.green,
                    text: "Jedno veliko slovo")
                : RoundedLabel(
                    size: size,
                    icon: Icons.close,
                    iconColor: Theme.of(context).primaryColor,
                    text: "Jedno veliko slovo"),
            _ruleNumberDivides
                ? RoundedLabel(
                    size: size,
                    icon: Icons.check,
                    iconColor: Colors.green,
                    text: "Broj dijeli niz u 2 niza znakova")
                : RoundedLabel(
                    size: size,
                    icon: Icons.close,
                    iconColor: Theme.of(context).primaryColor,
                    text: "Broj dijeli niz u 2 niza znakova")
          ],
        ),
      ),
    );
  }
}