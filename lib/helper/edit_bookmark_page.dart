import 'package:bookmarker/helper/toaddInfo.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/helper/provider.dart';
import 'package:bookmarker/helper/to_add_form.dart';
import 'package:provider/provider.dart';

class EditBookmark extends StatefulWidget {
  final Toaddinfo toaddinfo;

  const EditBookmark({Key? key, required this.toaddinfo}) : super(key: key);

  @override
  _EditBookmarkState createState() => _EditBookmarkState();
}

class _EditBookmarkState extends State<EditBookmark> {

  final _formKey = GlobalKey<FormState>();

  late String title;
  late String category;

  @override
  void initState() {

    super.initState();

    title = widget.toaddinfo.title;
    category = widget.toaddinfo.category;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.lightBlueAccent,
      title: Text('Edit Bookmark'),
      actions: [
        IconButton(
            onPressed:(){
              final provider = Provider.of<ToaddProvider>(context, listen: false);
              provider.removeBookmark(widget.toaddinfo);
              Navigator.of(context).pop();
        },
            icon: Icon(Icons.delete),
        )
      ],
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ToAdd(
          title: title,
          category: category,
          onChangedTitle: (title)=>setState(() {
            this.title = title;
          }),
          onChangedCategory: (category)=>setState(() {
          this.category = category;
        }),
          onSavedToAdd: saveEdited,
        ),
      ),
    ),
  );

  void saveEdited(){
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    }else{
      final provider = Provider.of<ToaddProvider>(context, listen: false);

      provider.updateBookmark(widget.toaddinfo, title, category);

      Navigator.of(context).pop();
    }
  }
}
