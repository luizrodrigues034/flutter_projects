import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 100.0);

const kMessageTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 60.0);

const kButtonTextStyle = TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB');

const kConditionTextStyle = TextStyle(fontSize: 100.0);
const kInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Digite a cidade',
  hintStyle: TextStyle(color: Colors.grey),
  icon: Icon(Icons.location_city, color: Colors.white, size: 40),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);
