import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental_chapter_51_60/ui/user_card.dart';
import '../bloc/user_bloc.dart';
import '../model/user.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('MVVM'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.blueGrey,
              onPressed: () {
                bloc.add(random.nextInt(10) + 1);
              },
              child: Text(
                'Pick Random User',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BlocBuilder<UserBloc, User>(
                builder: (context, user) =>
                    (user is UninitializedUser) ? Container() : UserCard(user))
          ],
        ),
      ),
    );
  }
}
