import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental_chapter_51_60/bloc/post_bloc.dart';
import 'package:flutter_fundamental_chapter_51_60/ui/post_item_infinite.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController scrollController = ScrollController();
  Postbloc bloc;

  void onScroll() {
    double maxscroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxscroll) bloc.add(PostEvent());
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<Postbloc>(context);
    scrollController.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: BlocBuilder<Postbloc, PostState>(
          builder: (context, state) {
            if (state is PostUninitialized)
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            else {
              PostLoaded postLoaded = state as PostLoaded;
              return ListView.builder(
                controller: scrollController,
                itemCount: (postLoaded.reachedMax)
                    ? postLoaded.posts.length
                    : postLoaded.posts.length +
                        1, // menambah circular indikator
                itemBuilder: (context, index) =>
                    (index < postLoaded.posts.length)
                        ? PostItem(postLoaded.posts[index])
                        : Container(
                            child: Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
              );
            }
          },
        ),
      ),
    );
  }
}
