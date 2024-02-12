import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:project2/colors.dart';
import '../../models/Product.dart';

class SliderPage extends StatelessWidget {
  final List<Product> products;
  const SliderPage(this.products, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlutterCarousel(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            // disableCenter: true,
            viewportFraction:1.0,
            height: deviceSize.height * 0.45,
            indicatorMargin: 0,
            enableInfiniteScroll: true,
            slideIndicator: const CircularSlideIndicator(
              currentIndicatorColor: primaryColorDark,
              indicatorBackgroundColor: textSecondaryColor,
              indicatorRadius: 4,
              itemSpacing: 12
            ),
          ),
          items: [
            ...products.map((product) => ClipRect(
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 7,right: 7, bottom: 20),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.network(product.imageUrl, fit: BoxFit.fitWidth),
                      ),
                  Positioned(
                      bottom: 35,
                      left: 35,
                      width: 170,
                      child: Text("Popular Meetups in India",maxLines: 2, style: TextStyle(fontSize: 20,letterSpacing: 1, color: Colors.white, fontWeight: FontWeight.w600),))
                ],
              ),
            )).toList()
          ],
        ),
      ),
    );
  }
}