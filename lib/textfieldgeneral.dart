import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textform/textfieldfocus.dart';

class TextFormGeneral extends StatefulWidget {
  const TextFormGeneral({Key? key}) : super(key: key);

  @override
  _TextFormGeneralState createState() => _TextFormGeneralState();
}

class _TextFormGeneralState extends State<TextFormGeneral> {
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  String password = '';
  bool _isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            buildEmail(),
            SizedBox(height: 24),
            buildPassword(),
            SizedBox(height: 24),
            buildNumber(),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextFieldFocus(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Click Go To Focus Page'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // print('Email:  ${_emailController.text}');
                // print('Password: ${password}');
                // print('Number:  ${_numberController.text}');
              },
              child: Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              style: style,
            ),
          ],
        ),
      ),
    );
  }

  TextField buildEmail() {
    return TextField(
      autofocus: true,
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Johndoe@example.com',
        labelText: 'Email',
        prefixIcon: Icon(Icons.mail),
        suffixIcon: _emailController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _emailController.clear();
                },
              ),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }

  TextField buildPassword() {
    return TextField(
      onChanged: (value) => setState(() => this.password = value),
      //onSubmitted: (value)=> setState(() => this.password = value),
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        //errorText: 'Incorrect Password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: _isPasswordVisible
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
        border: OutlineInputBorder(),
      ),
      obscureText: _isPasswordVisible,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }

  Column buildNumber() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Number',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _numberController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Number',
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
          ),
        ],
      );
}
