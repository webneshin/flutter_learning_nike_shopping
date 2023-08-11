


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learning_nike_shopping/common/exception.dart';
import 'package:flutter_learning_nike_shopping/data/comment.dart';
import 'package:flutter_learning_nike_shopping/data/repo/comment_repository.dart';

part 'comment_list_event.dart';

part 'comment_list_state.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  final ICommentRepository repository;
  final int productId;

  CommentListBloc({required this.repository, required this.productId})
      : super(CommentListStateLoading()) {
    on<CommentListEvent>((event, emit) async {
      if (event is CommentListEventStarted) {
        emit(CommentListStateLoading());

        try {
          final comments = await repository.getAll(productId: productId);
          emit(CommentListStateSuccess(comments));
        } catch (e) {
          emit(CommentListStateError(e is AppException ? e : AppException()));
        }
      }
    });
  }
}
