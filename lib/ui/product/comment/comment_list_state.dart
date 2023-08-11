part of 'comment_list_bloc.dart';

abstract class CommentListState extends Equatable {
  const CommentListState();
}

// class CommentListInitial extends CommentListState {
//   @override
//   List<Object> get props => [];
// }

class CommentListStateLoading extends CommentListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentListStateSuccess extends CommentListState{
  final List<CommentEntity> comments;

  CommentListStateSuccess(this.comments);

  @override
  List<Object> get props => [comments];
}

class CommentListStateError extends CommentListState{
  final AppException exception;

  CommentListStateError(this.exception);

  @override
  List<Object> get props => [exception];
}