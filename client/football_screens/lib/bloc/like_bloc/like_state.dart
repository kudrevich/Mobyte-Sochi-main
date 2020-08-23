part of 'like_bloc.dart';

abstract class LikeBlocState {
  final String animation;
  LikeBlocState(this.animation);
}

class DislikeState extends LikeBlocState {
  DislikeState() : super('unlike');
}

class LikeState extends LikeBlocState {
  LikeState() : super('like');
}
