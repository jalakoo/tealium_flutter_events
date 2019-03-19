import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

LoginPadding(BuildContext context) {
  return EdgeInsets.only(
    left: 40,
    top: MediaQuery.of(context).size.height * 0.15,
    right: 40,
    bottom: 20,
  );
}

ContactDetailsPadding(BuildContext context) {
  return EdgeInsets.only(
    left: 40,
    top: MediaQuery.of(context).size.height * 0.05,
    right: 40,
    bottom: 20,
  );
}

ImageContainer(String assetPath) {
  return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.scaleDown, image: AssetImage(assetPath))));
}

RoundedTextField(String hintText) {
  return TextField(
    obscureText: false,
    style: TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.black),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );
}

RoundedContactTextArea(String hintText, bool enabled) {
  return TextField(
    //textAlign: TextAlign.center,
    keyboardType: TextInputType.multiline,
    maxLines: 10,
    obscureText: false,
    enabled: enabled,
    style: TextStyle(
        fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.black, height: .65),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );
}

RoundedContactTextField(String hintText, bool enabled) {
  return TextField(
    obscureText: false,
    enabled: enabled,
    style: TextStyle(
        fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.black),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );
}

RoundedPasswordField(String hintText) {
  return TextField(
    obscureText: true,
    style: TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.black),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );
}

RoundedButton(String title, BuildContext context, VoidCallback onPressed) {
  return Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xff01A0C7),
    // color: Colors.black,
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () { onPressed(); },
      child: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0)
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
}

RoundedBizCardButton(String title, BuildContext context, VoidCallback onPressed) {
  return Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xff01A0C7),
    // color: Colors.black,
    child: MaterialButton(
      minWidth: 12.0,
      height: .4,
      padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
      onPressed: () { onPressed(); },
      child: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0)
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
}

SectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Text(
      title,
      style: TextStyle(fontSize: 18.0),
    ),
  );
}

UIDivider() {
  return Container(
    height: 1.0,
    color: new Color(0xff999999),
    margin: const EdgeInsets.symmetric(vertical: 12.0),
  );
}

WrappedText(double width, String text) {
  return Container(
    width: width,
    child: Text(text, textAlign: TextAlign.center)
  );
}

// LinkTextSpan(TextStyle style, String url, String text) {
//   return TextSpan(
//   style: style,
//   text: text ?? url,
//   recognizer: TapGestureRecognizer()..onTap = () {
//     launch(url, forceSafariVC: false);
//   }
// }
  
