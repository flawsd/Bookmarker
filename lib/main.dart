import 'package:bookmarker/helper/bookmark_widget.dart';
import 'package:bookmarker/helper/toadd_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/screen/tasks_screen.dart';
import 'package:bookmarker/helper/provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create:(context) => ToaddProvider(),
    child: MaterialApp(
        home:TasksScreen(), //main screen home page
      ),
  );
}


