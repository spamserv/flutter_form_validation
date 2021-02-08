import 'package:flutter/material.dart';

import 'screens/form_validation_screen.dart';

/*
Napišite Flutter aplikaciju koja provjerava da li uneseni niz znakova zadovoljava kriterije:

niz mora sadržavati barem 8 znakova
niz mora sadržavati barem jedno veliko slovo
broj mora dijeliti niz u barem dva niza znakova
Npr. (ispravne zaporke su zelene): asdFghjk, asd3fGhjk, 123aSdfghjk, asd6H.

Posvetite nešto pažnje i jednostavnom UI/UX-u aplikacije te ih sami definirajte.
*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF6F35A5),
        accentColor: Color(0xFFF1E6FF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormValidationScreen(),
    );
  }
}

