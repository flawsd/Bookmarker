import 'package:flutter/material.dart';

const kTextField_Decoration = InputDecoration(
  hintText: 'Enter something',
  contentPadding: EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 15.0,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
