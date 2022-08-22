import 'package:flutter/material.dart';
import 'package:ms_task1/allposts.dart';
import 'package:ms_task1/profile.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 25.0,
          title: Text('Lorem Ipsum' , style: TextStyle(fontSize: 25.0),),
          backgroundColor: Colors.red,
          bottom: TabBar(
            tabs: [
              Tab(text: 'ALL POSTS',),
              Tab(text: 'PROFILE',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllPosts(),
            Profile(),
          ],
        ),
      ),
    );
  }
}
