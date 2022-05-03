import 'package:flutter/material.dart';

class ToaddinfoField{
   static const createdTime = 'createdTime';
}

class Toaddinfo{
  DateTime createdTime;
  String title;
  String id;
  String category;

  Toaddinfo({
    required this.createdTime,
    this.title = '',
    this.category ='',
    this.id ='',
  });

}