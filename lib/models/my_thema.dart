import 'package:flutter/material.dart';

class MyThema{
  MaterialColor _color;

  MyThema(this._color);

  MaterialColor get color => _color;

  set color(MaterialColor value) {
    _color = value;
  }

}