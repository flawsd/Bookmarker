import 'package:flutter/material.dart';
import 'package:bookmarker/screen/add_bookmark_screen.dart';
import 'package:path/path.dart';
import 'package:bookmarker/screen/tasks_screen.dart';

class ToAdd extends StatelessWidget {
  final String title;
  final String category;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedCategory;
  final VoidCallback onSavedToAdd;

  const ToAdd({
    Key? key,
    this.title = '',
    this.category = '',
    required this.onChangedTitle,
    required this.onChangedCategory,
    required this.onSavedToAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 20.0),
        buildCategory(),
        SizedBox(height: 30.0),
        buildButton(context),
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    initialValue: title,
    onChanged: onChangedTitle,

    autofocus: true,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
        icon: Icon(Icons.content_paste),
        hintText: 'Title or URL'
    ),

  );

  Widget buildCategory() => TextFormField(
    initialValue: category,
    onChanged: onChangedCategory,

    autofocus: true,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
        icon: Icon(Icons.category),
        hintText: 'Category'
    ),

  );

  Widget buildButton(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
        ),
        child:Text(
          'Add',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onSavedToAdd,
      ),
      TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
        ),
        child:Text(
          'Cancel',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(false),
      ),
    ],
  );


}