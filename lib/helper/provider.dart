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
    Toaddinfo(
      createdTime: DateTime.now(),
      title: 'www.Walmart.com',
      category: 'shopping',
    ),
    Toaddinfo(
      createdTime: DateTime.now(),
      title: 'uo',
      category: 'shopping',
    ),
    Toaddinfo(
      createdTime: DateTime.now(),
      title: 'uo',
      category: 'shopping',
    ),
    Toaddinfo(
      createdTime: DateTime.now(),
      title: 'uo',
      category: 'shopping',
    ),

  ];

  List<Toaddinfo> get toadds => _toadds.toList();

  void addBookmark(Toaddinfo toaddinfo){
    _toadds.add(toaddinfo);
    notifyListeners();
  }

  int get bkCounts {
    return toadds.length;
  }

  void removeBookmark(Toaddinfo toaddinfo){
    _toadds.remove(toaddinfo);
    notifyListeners();
  }

  void updateBookmark(Toaddinfo toaddinfo, String title, String category){
    toaddinfo.title = title;
    toaddinfo.category = category;

    notifyListeners();
  }

}