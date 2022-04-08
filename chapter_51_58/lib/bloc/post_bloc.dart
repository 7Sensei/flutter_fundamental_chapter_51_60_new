import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental_chapter_51_60/model/post.dart';

class PostEvent {}

abstract class PostState {}

class PostUninitialized extends PostState {}

class PostLoaded extends PostState {
  List<Post> posts;
  bool reachedMax;

  PostLoaded({this.posts, this.reachedMax});

  PostLoaded copyWith({List<Post> posts, bool reachedMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      reachedMax: reachedMax ?? this.reachedMax,
    );
  }
}

class Postbloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;
    if (state is PostUninitialized) {
      posts = await Post.connectToAPI(0, 10);
      yield PostLoaded(posts: posts, reachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToAPI(postLoaded.posts.length, 10);

      yield (posts.isEmpty)
          ? postLoaded.copyWith(reachedMax: true)
          : PostLoaded(posts: postLoaded.posts + posts, reachedMax: false);
    }
  }
}
