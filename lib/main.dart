import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:textform/textfieldgeneral.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textform Field',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ),
        secondaryHeaderColor: Colors.white,
      ),
      home: TextField(),
    );
  }
}

class TextField extends StatefulWidget {
  const TextField({Key? key}) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text Field',
          style: style,
        ),
      ),
      body: TextFormGeneral(),
    );
  }
}
