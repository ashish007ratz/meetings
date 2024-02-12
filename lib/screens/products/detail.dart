import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:project2/models/Product.dart';
import 'package:share_plus/share_plus.dart';

import '../../colors.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Product product = Product.getById(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // shadowColor: Colors.grey,
          title: Text('Individual Meetup', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200,width: 2))
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                /// slider with bottom icon bar
                displaySlider(),
                SizedBox(height: 10),
                /// data bar
                Row(
                  children: [
                    Icon(Icons.bookmark_border, size:  20, color: textSecondaryColor),
                    SizedBox(width: 5),
                    Text("${product.save}", style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Icon(Icons.favorite_outline, size:  20, color: textSecondaryColor),
                    SizedBox(width: 5),
                    Text("${product.likes}", style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10, top: 1,bottom: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, size:  18, color: liteColor),
                          Icon(Icons.star, size:  18, color: liteColor),
                          Icon(Icons.star, size:  18, color: liteColor),
                          Icon(Icons.star, size:  18, color: liteColor.withOpacity(0.5)),
                          Icon(Icons.star, size:  18, color: Colors.white70)
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("${3.2}", style: TextStyle(fontSize: 13, color: textSecondaryColor, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 20),
                Text("Actor Name", style: TextStyle(color: primaryColorDark,fontWeight: FontWeight.w600, fontSize: 14)),
                SizedBox(height: 3),
                Text(product.actorName, style: TextStyle(color: subTitle, fontSize: 14)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.timer_outlined, size: 20, color: subTitle,),
                    SizedBox(width: 5),
                    Text("Duration ${product.duration}", style: TextStyle(color:subTitle, fontSize: 14)),

                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.wallet, size: 20, color: subTitle,),
                    SizedBox(width: 5),
                    Text("Total Average Fees ${product.fee}", style: TextStyle(color: subTitle, fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                Text("About", style: TextStyle(color: primaryColorDark,fontWeight: FontWeight.w600, fontSize: 14)),
                SizedBox(height: 5),
                Text(product.about, style: TextStyle(color: subTitle, fontSize: 14)),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("See More", style: TextStyle(color: textSecondaryColor,fontWeight: FontWeight.w600, fontSize: 12)),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displaySlider(){
    final deviceSize = MediaQuery.of(context).size;
    return  Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            FlutterCarousel(
              options: CarouselOptions(
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                // disableCenter: true,
                viewportFraction:1.0,
                height: 320,
                indicatorMargin: 0,
                enableInfiniteScroll: true,
                slideIndicator: const CircularSlideIndicator(
                  padding: EdgeInsets.only(bottom: 20)
                ),
              ),
              items: [
                ...products.map((product) => ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.network(product.imageUrl, fit: BoxFit.fill),
                  ),
                )).toList()
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 0),
                Icon(Icons.download, size:  30, color: Colors.grey.shade500),
                Icon(Icons.bookmark_border, size:  30, color: Colors.grey.shade500),
                Icon(Icons.favorite_outline, size:  30, color: Colors.grey.shade500),
                Icon(Icons.zoom_in_map, size:  30, color: Colors.grey.shade500),
                Icon(Icons.star_border_outlined, size:  30, color: Colors.black87),
                InkWell(
                    onTap: ()async{
                      await Share.share(
                        "Hey, checkout this page",
                        subject: "This is demo sub",
                      );
                    },
                    child: Icon(Icons.share_outlined, size:  30, color: Colors.black87)),
                SizedBox(width: 0),
              ],
            ),
            SizedBox(height: 5),
          ],

        ),
      ),
    );
  }
}
