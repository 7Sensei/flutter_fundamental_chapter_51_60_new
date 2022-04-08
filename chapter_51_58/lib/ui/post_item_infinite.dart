import 'package:flutter/material.dart';
import 'package:flutter_fundamental_chapter_51_60/bloc/post_bloc.dart';
import 'package:flutter_fundamental_chapter_51_60/model/post.dart';
import 'package:http/http.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem(this.post);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(post.id),
          Container(
            width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(post.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
