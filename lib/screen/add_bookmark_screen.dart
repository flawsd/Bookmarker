import 'package:bookmarker/helper/toaddInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bookmarker/screen/bookmark_page.dart';
import 'package:bookmarker/helper/to_add_form.dart';
import 'package:bookmarker/helper/bookmark_widget.dart';
import 'package:bookmarker/helper/toadd_list_widget.dart';
import 'package:bookmarker/helper/provider.dart';
import 'package:provider/provider.dart';



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
                  onSavedToAdd: addBookmark,
              ),
            ],
          ),
        ),
      ),
  );

  void addBookmark(){
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    }else{
      final toaddInfo = Toaddinfo(
          id: DateTime.now().toString(),
          title: title,
          category: category,
          createdTime: DateTime.now(),
      );

      final provider = Provider.of<ToaddProvider>(context, listen: false);
      provider.addBookmark(toaddInfo);
      print(toaddInfo.title);
      Navigator.of(context).pop();
    }

  }
}
