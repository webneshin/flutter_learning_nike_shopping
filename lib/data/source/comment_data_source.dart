import 'package:dio/dio.dart';
import 'package:flutter_learning_nike_shopping/data/comment.dart';
import 'package:flutter_learning_nike_shopping/data/common/http_data_validator.dart';

abstract class ICommentDataSource {
  Future<List<CommentEntity>> getAll(int productId);
}


class CommentRemoteDataSource with HttpResponseValidatorMixin implements ICommentDataSource{
  final Dio httpClient;

  CommentRemoteDataSource(this.httpClient);

  @override
  Future<List<CommentEntity>> getAll(int productId) async {
    final response = await httpClient.get('comment/list?product_id=$productId');
    validateResponse(response);
    final List<CommentEntity> comments = [];
    (response.data as List).forEach((element) {
      comments.add(CommentEntity.fromJson(element));
    });
    return comments;
  }

}