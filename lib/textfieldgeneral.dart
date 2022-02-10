import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textform/textfieldfocus.dart';

class TextFormGeneral extends StatefulWidget {
  const TextFormGeneral({Key? key}) : super(key: key);

  @override
  _TextFormGeneralState createState() => _TextFormGeneralState();
}

class _TextFormGeneralState extends State<TextFormGeneral> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  String password = '';
  String username = '';
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
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              buildUsername(),
              SizedBox(height: 24),
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
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    formKey.currentState!.save();
                    final message = 'Changes saved';
                    final snackBar = SnackBar(
                      content: Text(
                        message,
                        style: TextStyle(fontSize: 20),
                      ),
                      backgroundColor: Colors.green,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
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
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      autofocus: true,
      validator: (value) {
        final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (value!.isEmpty) {
          return 'Enter an email';
        } else if (!regExp.hasMatch(value)) {
          return 'Enter a valid email';
        } else {
          return null;
        }
      },
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

  TextFormField buildPassword() {
    return TextFormField(
      onSaved: (value) => setState(() => password = value!),
      validator: (value) {
        if (value!.length < 7) {
          return 'Password must be at least 7 characters long';
        } else {
          return null;
        }
      },
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

  TextFormField buildUsername() {
    return TextFormField(
      maxLength: 30,
      validator: (value) {
        if (value!.length < 4) {
          return 'Enter at least 4 character';
        } else if (value.isEmpty) {
          return 'Enter Username';
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => username = value!),
      //onSubmitted: (value)=> setState(() => this.password = value),
      decoration: InputDecoration(
        hintText: 'Username',
        labelText: 'Username',
        //errorText: 'Incorrect Password',
        // suffixIcon: IconButton(
        //   onPressed: () {
        //     setState(() {
        //       _isPasswordVisible = !_isPasswordVisible;
        //     });
        //   },
        //   icon: _isPasswordVisible
        //       ? Icon(Icons.visibility_off)
        //       : Icon(Icons.visibility),
        // ),
        border: OutlineInputBorder(),
      ),
      //obscureText: _isPasswordVisible,
      keyboardType: TextInputType.name,
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
