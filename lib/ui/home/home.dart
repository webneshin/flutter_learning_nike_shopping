import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_nike_shopping/data/repo/banner_repository.dart';
import 'package:flutter_learning_nike_shopping/data/repo/product_repository.dart';
import 'package:flutter_learning_nike_shopping/generated/assets.dart';
import 'package:flutter_learning_nike_shopping/ui/home/home_bloc.dart';

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
        // appBar: AppBar(),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeStateSuccess) {
                return ListView.builder(
                  itemCount: 5,
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Image.asset(Assets.imgNikeLogo);
                      default:
                        return Container(
                          color: Colors.green,
                          child: Text((index + 1).toString()),
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
                    ElevatedButton(onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(HomeEventRefresh());
                    }, child: const Text('تلاش مجدد'))
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
