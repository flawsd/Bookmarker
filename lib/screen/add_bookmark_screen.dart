import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bookmarker/screen/bookmark_page.dart';
import 'package:bookmarker/helper/to_add_form.dart';



class AddBookmarkScreen extends StatefulWidget {
  @override
  State<AddBookmarkScreen> createState() => _AddBookmarkScreenState();
}

class _AddBookmarkScreenState extends State<AddBookmarkScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String category = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: Colors.transparent,

    content: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(60.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text(
                'Add Bookmark',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ToAdd(
                  onChangedTitle:(title) =>setState(() => this.title = title),
                  onChangedCategory:(category) =>setState(() => this.category = category),
                  onSavedToAdd: (){},
              ),
            ],
          ),
        ),
      ),
  );
}
