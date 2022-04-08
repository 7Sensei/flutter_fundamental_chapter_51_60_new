import 'package:flutter/material.dart';
import 'package:flutter_fundamental_chapter_51_60/ui/main_page_infinite.dart';
import 'package:flutter_fundamental_chapter_51_60/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<Postbloc>(
        create: (context) => Postbloc()..add(PostEvent()),
        child: MainPage(),
      ),
    );
  }
}
