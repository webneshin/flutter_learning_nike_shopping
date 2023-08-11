import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_nike_shopping/data/repo/comment_repository.dart';
import 'package:flutter_learning_nike_shopping/ui/product/comment/comment.dart';
import 'package:flutter_learning_nike_shopping/ui/product/comment/comment_list_bloc.dart';
import 'package:flutter_learning_nike_shopping/ui/widgets/error.dart';

class CommentList extends StatelessWidget {
  final int productId;

  const CommentList({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final CommentListBloc bloc = CommentListBloc(
            repository: commentRepository, productId: productId);
        bloc.add(CommentListEventStarted());
        return bloc;
      },
      child: BlocBuilder<CommentListBloc, CommentListState>(
        builder: (context, state) {
          if (state is CommentListStateSuccess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CommentItem(
                    comment: state.comments[index],
                  );
                },
                childCount: state.comments.length,
              ),
            );
          } else if (state is CommentListStateLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CommentListStateError) {
            return SliverToBoxAdapter(
              child: AppErrorWidget(
                exception: state.exception,
                onPressed: () {
                  BlocProvider.of<CommentListBloc>(context)
                      .add(CommentListEventStarted());
                },
              ),
            );
          } else {
            throw Exception('State is not Supported');
          }
        },
      ),
    );
  }
}

