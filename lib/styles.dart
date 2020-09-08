import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
  static RoundedRectangleBorder buttonStyle() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: Colors.white));
  }

  static RoundedRectangleBorder disabledButtonStyle() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: Colors.grey[400]));
  }
}
