import 'package:flutter/cupertino.dart';

double h(double val, BuildContext context) {
  return MediaQuery.of(context).size.height * (val / 100);
}

double w(double val, BuildContext context) {
  return MediaQuery.of(context).size.width * (val / 100);
}
