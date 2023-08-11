import 'dart:io';

import 'package:flutter_learning_nike_shopping/data/comment.dart';
import 'package:flutter_learning_nike_shopping/data/common/http_client.dart';
import 'package:flutter_learning_nike_shopping/data/source/comment_data_source.dart';

final commentRepository = CommentRepository(CommentRemoteDataSource(httpClient));

abstract class ICommentRepository {
  Future<List<CommentEntity>> getAll({required int productId});
}

class CommentRepository implements ICommentRepository{
  final ICommentDataSource dataSource;

  CommentRepository(this.dataSource);

  @override
  Future<List<CommentEntity>> getAll({required int productId}) {
    return dataSource.getAll(productId);
  }

}