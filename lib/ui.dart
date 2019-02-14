import 'package:flutter/material.dart';

LoginPadding(BuildContext context) {
  return EdgeInsets.only(
    left: 40,
    top: MediaQuery.of(context).size.height * 0.15,
    right: 40,
    bottom: 20,
  );
}

class ImageContainer extends Container {
  String assetPath;

  ImageContainer(String assetPath)
      : super(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.scaleDown, image: AssetImage(assetPath))));
}

class RoundedTextField extends TextField {
  String hintText;

  RoundedTextField(String hintText)
      : super(
          obscureText: false,
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.black),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        );
}

class RoundedPasswordField extends TextField {
  String hintText;

  RoundedPasswordField(String hintText)
      : super(
          obscureText: true,
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.black),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
        );
}

class RoundedButton extends Material {
  String title;
  BuildContext context;

  RoundedButton(String title, BuildContext context)
      : super(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          // color: Colors.black,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0)
                    .copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class UIDivider extends StatelessWidget {
  const UIDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: new Color(0xff999999),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
    );
  }
}
