import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/common/utils.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/ui/product/detail.dart';
import 'package:flutter_learning_nike_shopping/ui/widgets/image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product, required this.borderRadius,
  });

  final Product product;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ProductDetailScreen(product: product,);
          },));
        },
        child: SizedBox(
          width: 176,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 176,
                    height: 189,
                    child: ImageLoadingService(
                      imageUrl: product.imageUrl,
                      borderRadius: borderRadius,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    iconSize: 20,
                    splashRadius: 1,
                    tooltip: 'علاقه مندی',

                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tooltip(message: product.title,
                    child: Text(product.title, overflow: TextOverflow.ellipsis,
                      maxLines: 1,)),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Text(product.previousPrice.withPriceLable, style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(decoration: TextDecoration.lineThrough),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 4),
                child: Text(product.price.withPriceLable),
              ),
            ],
          ),
        ),
      ),
    );
  }
}