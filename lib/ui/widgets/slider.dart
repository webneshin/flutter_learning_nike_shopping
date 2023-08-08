import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/common/utils.dart';
import 'package:flutter_learning_nike_shopping/data/banner.dart';
import 'package:flutter_learning_nike_shopping/ui/widgets/image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSliderShow extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<BannerSlider> banners;

  BannerSliderShow({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
            physics: defaultScrollPhysics,
            controller: _pageController,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return _Slide(banner: banners[index]);
            },
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: banners.length,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                  spacing: 4.0,
                  radius: 4.0,
                  dotWidth: 20.0,
                  dotHeight: 3.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Theme.of(context).colorScheme.secondaryContainer,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    super.key,
    required this.banner,
  });

  final BannerSlider banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: ImageLoadingService(
        imageUrl: banner.imageUrl,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
