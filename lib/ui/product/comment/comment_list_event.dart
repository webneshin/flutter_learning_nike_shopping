part of 'comment_list_bloc.dart';

abstract class CommentListEvent extends Equatable {
  const CommentListEvent();
}


class CommentListEventStarted extends CommentListEvent{
  @override
  List<Object?> get props => [];
}
