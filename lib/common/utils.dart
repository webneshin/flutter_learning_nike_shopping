import 'package:flutter/cupertino.dart';

const defaultScrollPhysics = BouncingScrollPhysics();

extension PriceLabel on int {
  String get withPriceLable =>'$this تومان';
}