import 'package:flutter/material.dart';

class RoundedLabel extends StatelessWidget {
  const RoundedLabel({
    Key key,
    @required this.size,
    @required this.icon,
    @required this.iconColor,
    @required this.text,
  }) : super(key: key);

  final Size size;
  final Color iconColor;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          color: Theme.of(context).accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
              ),
              Icon(
                icon,
                color: iconColor,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}