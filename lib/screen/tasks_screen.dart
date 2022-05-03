import 'package:bookmarker/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/screen/add_bookmark_screen.dart';
import 'package:bookmarker/screen/search.dart';
import 'package:provider/provider.dart';
import 'package:bookmarker/helper/bookmark_widget.dart';
import 'package:bookmarker/helper/toadd_list_widget.dart';
import 'package:bookmarker/helper/provider.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) =>ToaddProvider(),
    child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AddBookmarkScreen() );
          },
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
              EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('images/p1.png'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Bookmarker',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '0 bookmarks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            ),

            Expanded(
             child: Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child:ToaddListWidget(),
              ),
            ),
          ],
        ),
      ),
  );
}
