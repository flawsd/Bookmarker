import 'package:flutter/material.dart';
import 'package:bookmarker/helper/provider.dart';
import 'package:bookmarker/helper/to_add_form.dart';
import 'package:bookmarker/helper/toaddInfo.dart';
import 'package:bookmarker/helper/bookmark_widget.dart';
import 'package:provider/provider.dart';

class ToaddListWidget extends StatelessWidget {
  const ToaddListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToaddProvider>(context);
    final toadds = provider.toadds;

    return ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 16,bottom: 16),
        separatorBuilder: (context,index) => Divider(height: 10,color: Colors.black,),
        itemCount: toadds.length,
        itemBuilder: (context,index) {
          final toaddInfo = toadds[index];

          return BookmarkWidget(toaddInfo: toaddInfo);
        },
    );
  }
}
