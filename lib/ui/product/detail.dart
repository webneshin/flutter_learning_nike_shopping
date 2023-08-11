import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/common/utils.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/ui/product/comment/comment_list.dart';
import 'package:flutter_learning_nike_shopping/ui/widgets/image.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(),
        floatingActionButton: FloatingActionButton.extended(onPressed: () => null, label: Text("اضافه به سبد خرید")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CustomScrollView(
          physics: defaultScrollPhysics,
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.width * 0.8,
              flexibleSpace: ImageLoadingService(
                imageUrl: product.imageUrl,
              ),
              foregroundColor: theme.colorScheme.primary,
              leading: BackButton(color: theme.colorScheme.primary),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  color: Colors.black,
                )
              ],
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        product.title,
                        style: theme.textTheme.titleMedium,
                      )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            product.previousPrice.withPriceLable,
                            style: theme.textTheme.bodySmall?.copyWith(
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(product.price.withPriceLable),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                      ' منسیبت کسیبا کتنبیلس منتیبال کسیبل کسیتبل کشیتبل کشبتل کیتبلک یبل کیبل کشیبل کیشبتال کشیبتال کشبیل کبیشک اشکیبل شکیبلا یبسیب.'),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('نظرات کاربران',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.secondary)),
                      TextButton(onPressed: () {}, child: Text('ثبت نظر'))
                    ],
                  ),
                ],
              ),
            ),
            ),
            CommentList(productId: product.id)
          ],
        ),
      ),
    );
  }
}
