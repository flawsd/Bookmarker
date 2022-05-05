import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/helper/toaddInfo.dart';
import 'package:bookmarker/helper/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:bookmarker/helper/utils.dart';
import 'package:bookmarker/helper/edit_bookmark_page.dart';

class BookmarkWidget extends StatelessWidget {
  final Toaddinfo toaddInfo;

  const BookmarkWidget({
    required this.toaddInfo,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Slidable(
        actionPane:SlidableDrawerActionPane(),
        key: Key(toaddInfo.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () => editBookmark(context,toaddInfo),
            caption: 'Edit',
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            onTap: () => deleteBookmark(context,toaddInfo),
            caption: 'Delete',
            icon: Icons.delete,
          )
        ],
        child: buildBookmark(context),
    ),
  );

  Widget buildBookmark(BuildContext context) => GestureDetector(
    onTap: () => editBookmark(context, toaddInfo),
    child: Row(
      children: [
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Text(
                    toaddInfo.title,
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                if (toaddInfo.category.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top:4),
                    child: Text(
                      toaddInfo.category,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,height: 1.5),
                    ),
                  ),
                Text(
                    toaddInfo.createdTime.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14,height: 1.5),
                ),
              ],
            )
        ),
      ],
    ),
  );

  void deleteBookmark(BuildContext context, Toaddinfo toaddinfo){
    final provider = Provider.of<ToaddProvider>(context, listen:false);
    provider.removeBookmark(toaddinfo);

    Utils.showSnackBar(context, 'Deleted');
  }

  void editBookmark(BuildContext context, Toaddinfo toaddinfo) => Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => EditBookmark(toaddinfo: toaddinfo),
    ),
  );
}

