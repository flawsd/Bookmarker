import 'package:bookmarker/helper/toaddInfo.dart';
import 'package:flutter/material.dart';

class ToaddProvider extends ChangeNotifier{
  List<Toaddinfo> _toadds = [
    Toaddinfo(
        createdTime: DateTime.now(),
        title: 'cpp',
        category: 'study',
    ),
    Toaddinfo(
      createdTime: DateTime.now(),
      title: 'uo',
      category: 'shopping',
    ),
  ];

  List<Toaddinfo> get toadds => _toadds;

  int get bkCounts {
    return toadds.length;
  }

}