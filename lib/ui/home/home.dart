import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_nike_shopping/common/exception.dart';
import 'package:flutter_learning_nike_shopping/common/utils.dart';
import 'package:flutter_learning_nike_shopping/data/banner.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/data/repo/banner_repository.dart';
import 'package:flutter_learning_nike_shopping/data/repo/product_repository.dart';
import 'package:flutter_learning_nike_shopping/generated/assets.dart';
import 'package:flutter_learning_nike_shopping/ui/home/home_bloc.dart';
import 'package:flutter_learning_nike_shopping/ui/product/product.dart';
import 'package:flutter_learning_nike_shopping/ui/widgets/error.dart';
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
                  physics: defaultScrollPhysics,
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
                            color: Theme.of(context).colorScheme.surfaceTint,
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
                          // color: Theme.of(context).colorScheme.onSurface,
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        );
                    }
                  },
                );
              } else if (state is HomeStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeStateError) {
                return AppErrorWidget(exception: state.exception, onPressed: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeEventRefresh());
                },);
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
              return ProductItem(product: product,borderRadius: BorderRadius.circular(12),);
            },
          ),
        )
      ],
    );
  }
}

