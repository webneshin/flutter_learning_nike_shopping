import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_nike_shopping/common/utils.dart';
import 'package:flutter_learning_nike_shopping/data/banner.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/data/repo/banner_repository.dart';
import 'package:flutter_learning_nike_shopping/data/repo/product_repository.dart';
import 'package:flutter_learning_nike_shopping/generated/assets.dart';
import 'package:flutter_learning_nike_shopping/ui/home/home_bloc.dart';
import 'package:flutter_learning_nike_shopping/ui/widgets/image.dart';
import 'package:flutter_learning_nike_shopping/ui/widgets/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final homeBloc = HomeBloc(
            bannerRepository: bannerRepository,
            productRepository: productRepository);
        homeBloc.add(HomeEventStarted());
        return homeBloc;
      },
      child: Scaffold(
        // backgroundColor: Colors.grey,
        // appBar: AppBar(),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeStateSuccess) {
                return ListView.builder(
                  itemCount: 5,
                  // padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: Image.asset(
                            Assets.imgNikeLogo,
                            height: 24,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      case 2:
                        return BannerSliderShow(
                          banners: state.banners,
                        );
                      case 3:
                        return _HorizontalProductList(
                          title: 'جدیدترین',
                          onTap: () {},
                          products: state.latestProducts,
                        );
                      case 4:
                        return _HorizontalProductList(
                          title: 'پربازدیدترین',
                          onTap: () {},
                          products: state.popularProducts,
                        );
                      default:
                        return Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        );
                    }
                  },
                );
              } else if (state is HomeStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeStateError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.exception.message,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(HomeEventRefresh());
                        },
                        child: const Text('تلاش مجدد'))
                  ],
                ));
              } else {
                throw Exception('State is not Supported');
              }
            },
          ),
        ),
      ),
    );
  }
}

class _HorizontalProductList extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final List<Product> products;

  const _HorizontalProductList({
    super.key,
    required this.title,
    required this.products,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              TextButton(onPressed: () => onTap, child: const Text('نمایش همه'))
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            physics: defaultScrollPhysics,
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 8, right: 8),
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
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
                              borderRadius: BorderRadius.circular(12),
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
                        child: Tooltip(message: product.title, child: Text(product.title,overflow: TextOverflow.ellipsis ,maxLines: 1,)),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 8,left: 8),
                        child: Text(product.previousPrice.withPriceLable,style: Theme.of(context).textTheme.bodySmall?.copyWith(decoration: TextDecoration.lineThrough),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8,left: 8,top: 4),
                        child: Text(product.price.withPriceLable),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
