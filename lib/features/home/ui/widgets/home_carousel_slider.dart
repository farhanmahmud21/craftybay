import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/features/home/data/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<SliderModel> sliders;
  const HomeCarouselSlider({super.key, required this.sliders});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final controller = CarouselSliderController();
  // ValueNotifier activeIndex = ValueNotifier(0);
  ValueNotifier<int> currentSlider = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CarouselSlider(
        //   items: widget.sliders.map((slider) {
        //     return Builder(
        //       builder: (context) {
        //         return Container(
        //           margin: EdgeInsets.all(8),

        //           child: Image.network(slider.photo_url),
        //         );
        //       },
        //     );
        //   }).toList(),
        //   options: CarouselOptions(
        //     onPageChanged: (index, reason) {
        //       currentSlider.value = index;
        //     },
        //     aspectRatio: 16 / 9,
        //     viewportFraction: 1,
        //     height: 200,
        //   ),
        // ),

        // ValueListenableBuilder<int>(
        //   valueListenable: currentSlider,
        //   builder: (context, value, child) => Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       for (int i = 0; i < widget.sliders.length; i++)
        //         Container(
        //           margin: EdgeInsets.all(2),
        //           height: 16,
        //           width: 16,
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.grey),
        //             shape: BoxShape.circle,
        //             color: currentSlider.value == i
        //                 ? AppColor.themeColor
        //                 : null,
        //           ),
        //         ),
        //     ],
        //   ),
        // ),

        // Carousel View niye khelbo
        ValueListenableBuilder(
          valueListenable: currentSlider,
          builder: (context, value, child) => CarouselSlider.builder(
            itemCount: widget.sliders.length,
            carouselController: controller,
            itemBuilder: (context, index, realIndex) => Container(
              margin: EdgeInsetsGeometry.all(8),

              child: Image.network(widget.sliders[index].photo_url),
            ),
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 16 / 9,
              height: 200,
              viewportFraction: 1,

              onPageChanged: (index, reason) {
                currentSlider.value = index;
              },
            ),
          ),
        ),

        SizedBox(height: 16),

        ValueListenableBuilder(
          valueListenable: currentSlider,
          builder: (context, value, child) => AnimatedSmoothIndicator(
            onDotClicked: (index) {
              currentSlider.value = index;
              controller.jumpToPage(index);
            },
            activeIndex: currentSlider.value,
            count: widget.sliders.length,

            effect: ExpandingDotsEffect(),
          ),
        ),
      ],
    );
  }
}
