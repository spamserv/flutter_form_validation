import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key key,
    this.storeString,
  }) : super(key: key);

  final Function storeString;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => storeString(value),
      decoration: InputDecoration(
        hintText: 'Your String Here',
        icon: Icon(
          Icons.trending_flat,
          color: Theme.of(context).primaryColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}