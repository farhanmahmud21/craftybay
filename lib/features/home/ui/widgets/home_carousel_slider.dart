import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/appColor.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CarouselSliderController();
    ValueNotifier activeIndex = ValueNotifier(0);
    return Column(
      children: [
        // Carousel View niye khelbo
        ValueListenableBuilder(
          valueListenable: activeIndex,
          builder: (context, value, child) => CarouselSlider.builder(
            itemCount: 5,
            carouselController: controller,
            itemBuilder: (context, index, realIndex) => Container(
              margin: EdgeInsetsGeometry.all(8),
              color: activeIndex.value >= 2 ? AppColor.themeColor : Colors.red,
              child: Center(child: Text('$index')),
            ),
            options: CarouselOptions(
              autoPlay: false,
              // aspectRatio: 16 / 9,
              height: 200,
              viewportFraction: 1,

              onPageChanged: (index, reason) {
                activeIndex.value = index;
              },
            ),
          ),
        ),

        SizedBox(height: 16),

        ValueListenableBuilder(
          valueListenable: activeIndex,
          builder: (context, value, child) => AnimatedSmoothIndicator(
            onDotClicked: (index) {
              activeIndex.value = index;
              controller.jumpToPage(index);
            },
            activeIndex: activeIndex.value,
            count: 5,

            effect: ExpandingDotsEffect(),
          ),
        ),
      ],
    );
  }
}
