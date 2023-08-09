import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoadingService extends StatelessWidget {
  final String imageUrl;
  final BorderRadius? borderRadius;

  const ImageLoadingService({
    super.key, required this.imageUrl, this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    var br=borderRadius;
    if (borderRadius==null){
      br= BorderRadius.zero;
    }
    return ClipRRect(
        borderRadius: br,
        child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,));
  }
}