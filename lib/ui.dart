import 'package:flutter/material.dart';

class RoundedTextField extends TextField {
  String hintText;

  RoundedTextField(String hintText): super(
          obscureText: false,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
}

class RoundedPasswordField extends TextField {
  String hintText;

  RoundedPasswordField(String hintText): super(
          obscureText: true,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
}

class RoundedButton extends Material {
  String title;
  BuildContext context;

  RoundedButton(String title, BuildContext context): super(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );
}