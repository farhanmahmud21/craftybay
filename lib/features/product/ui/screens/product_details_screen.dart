import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/app/app_AssetsPath.dart';
import 'package:craftybay/features/product/ui/controllers/product_detail_list_controller.dart';
import 'package:craftybay/features/product/ui/widgets/image_slider.dart';
import 'package:craftybay/features/product/ui/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final String productId;

  static String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  ProductDetailListController Pcontroller= ProductDetailListController();

  @override
  void initState(){
    super.initState();
    Pcontroller.getProductDetail(widget.productId);
  }
  
  int cartQuantity = 1;
  String selectedColor = 'Red';
  final Map<String, Color> Xcolor = {
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
    'Orange': Colors.orange,
  };
  ValueNotifier activeIndex = ValueNotifier(0);
  CarouselSliderController controller = CarouselSliderController();

  void onTapGesture(value) {
    selectedColor = Xcolor.keys.toList()[value];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailListController>(
      init: Pcontroller,
      builder: (_) {
        if (Pcontroller.inProgress){
         return  Center(child: CircularProgressIndicator());
        }
      if(Pcontroller.pDetail==null){
        return Center(child: Text('No Product Details available'));
      }
       return Scaffold(
      appBar: AppBar(
        title: Text(
         Pcontroller.pDetail!.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Slider
                ValueListenableBuilder(
                  valueListenable: activeIndex,
                  builder: (context, value, child) => ProductImageSlider(
                    controller: controller,
                    images: Pcontroller.pDetail!.photos,
                    activeIndex: activeIndex,
                  ),
                ),
                    
                //Name Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  //Name Column
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Pcontroller.pDetail!.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '\$ ${Pcontroller.pDetail!.current_price.toString()}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                  
                          // Name COlumn End
                          Spacer(),
                          // Cart Button
                          IncDecButton(
                            value: cartQuantity,
                            onDecrease: () {
                              setState(() {
                                if (cartQuantity < 1) return;
                                cartQuantity--;
                              });
                            },
                            onIncrease: () {
                              setState(() {});
                              cartQuantity++;
                            },
                          ),
                        ],
                      ),
                  
                      // Star and Review
                      star_review(),
                    ],
                  ), //Slider And Name Column End
                ),
                // Color  Container
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: colorContainers(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                       Pcontroller.pDetail!.description,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          
            // Bottom Container
            _buildPriceAndCartSection(context,price: Pcontroller.pDetail!.current_price),
            // BottomPriceAndButtonContainer(),
          ],
        ),
      ));
      
      }
      );
  }

  Widget _buildPriceAndCartSection(BuildContext context, {required int price}) {
    return Container(
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColor.themeColor.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: Theme.of(context).textTheme.labelLarge),
              Text(
               price.toString(),
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: AppColor.themeColor),
              ),
            ],
          ),

          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add to Cart',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget colorContainers(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: Theme.of(context).textTheme.titleSmall),
        Row(
          spacing: 6,
          children: [0, 1, 2, 3]
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    onTapGesture(e);
                    setState(() {});
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      border: selectedColor == Xcolor.keys.toList()[e]
                          ? Border.all(width: 4, color: Colors.black)
                          : null,
                      color: Xcolor.values.toList()[e],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Expanded(
                        child: Text(
                          Xcolor.keys.toList()[e],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class star_review extends StatelessWidget {
  const star_review({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Wrap(
          children: [
            Icon(Icons.star, size: 18, color: Colors.amber),
            Text('4.8', style: TextStyle(color: Colors.grey)),
          ],
        ),
        TextButton(onPressed: () {}, child: Text('Reviews')),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: AppColor.themeColor,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.favorite_outline_outlined,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
