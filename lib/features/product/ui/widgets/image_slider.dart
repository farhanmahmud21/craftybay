import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/app/appColor.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.controller,
    required this.images,
    required this.activeIndex,
  });

  final CarouselSliderController controller;
  final List<String> images;
  final ValueNotifier<dynamic> activeIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
              ),
              child: Image.asset(images[index]),
            );
          },

          options: CarouselOptions(
            onPageChanged: (index, reason) {
              activeIndex.value++;
              activeIndex.value = index;
            },
            initialPage: 0,
            height: 280,
            viewportFraction: 1,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 170,
          right: 170,
          child: AnimatedSmoothIndicator(
            effect: ColorTransitionEffect(activeDotColor: AppColor.themeColor),
            onDotClicked: (index) {
              activeIndex.value = index;
              controller.jumpToPage(index);
            },
            activeIndex: activeIndex.value,
            count: images.length,
          ),
        ),
      ],
    );
  }
}
