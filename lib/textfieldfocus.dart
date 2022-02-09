import 'package:flutter/material.dart';

class TextFieldFocus extends StatefulWidget {
  const TextFieldFocus({Key? key}) : super(key: key);

  @override
  State<TextFieldFocus> createState() => _TextFieldFocusState();
}

class _TextFieldFocusState extends State<TextFieldFocus> {
  final node1 = FocusNode();
  final node2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text Field Focus',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(28),
            children: [
              TextField(
                focusNode: node1,
                decoration: InputDecoration(
                  labelText: 'Textfield 1',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                focusNode: node2,
                decoration: InputDecoration(
                  labelText: 'Textfield 2',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              buttonWidget(
                text: 'Focus Textfield 1',
                onClicked: () => FocusScope.of(context).requestFocus(node1),
              ),
              SizedBox(height: 20),
              buttonWidget(
                text: 'Focus Textfield 2',
                onClicked: () => FocusScope.of(context).requestFocus(node2),
              ),
              SizedBox(height: 20),
              buttonWidget(
                text: 'Unfocus TextField',
                onClicked: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              SizedBox(height: 20),
              buttonWidget(
                text: 'Focus Textfield 1',
                onClicked: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buttonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const buttonWidget({
    Key? key,
    @required required this.text,
    @required required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
