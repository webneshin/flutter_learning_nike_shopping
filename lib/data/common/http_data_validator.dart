import 'package:dio/dio.dart';
import 'package:flutter_learning_nike_shopping/common/exception.dart';

mixin HttpResponseValidatorMixin{
  validateResponse(Response response){
    if (response.statusCode!=200){
      throw AppException();
    }
  }
}