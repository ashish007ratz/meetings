import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project2/colors.dart';
import 'package:project2/models/Product.dart';
import 'package:project2/screens/products/detail.dart';
import 'package:project2/screens/products/slider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Individual Meetup',
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.w600)),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black87,
            ),
            onPressed: () {
              // Handle back button press
            },
          ),
          backgroundColor: Colors.white),
      /// core body
      body: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade200,width: 2))
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              /// Search bar
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
                    prefixIcon: Icon(Icons.search, size: 30),
                    suffixIcon: Icon(Icons.mic, size: 30),
                    labelText: "Search",
                    labelStyle: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 18), // Adjust based on your design
                    hintText: "Enter your input", // Optional hint text
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: primaryColor,
                            width: 2)), // Or other border styles
                  ),
                ),
              ),
              SizedBox(
                height: 15
              ),
              /// slider
              SizedBox(
                height: 225,
                child: SliderPage(Product.getList(3)),
              ),
              SizedBox(height: 25),
              /// trending
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text("Trending Popular People",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
              ),
              SizedBox(height: 15),
              SizedBox(
                  height: 165,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                          3,
                          (index) => Container(
                                width: 260,
                                margin: EdgeInsets.only(left: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade500, width: 1)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: primaryColorDark,
                                          child: Padding(
                                            padding: const EdgeInsets.all(1),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                                color: Colors.grey.shade100,
                                              ),
                                              height: 40,
                                              width: 40,
                                              child: Icon(
                                                Icons.ac_unit,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Author",
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600)),
                                            Text("1,202 Meetups",
                                                style: TextStyle(
                                                    color: subTitle,
                                                    fontSize: 13))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(color: Colors.grey.shade500),
                                    SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          ...List.generate(
                                              4,
                                              (index) => Positioned(
                                                  left: index * 35,
                                                  child: CircleAvatar(
                                                    radius: 23,
                                                    backgroundColor: primaryColor,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                1000),
                                                        color:
                                                            Colors.grey.shade100,
                                                      ),
                                                      clipBehavior: Clip.hardEdge,
                                                      height: 46,
                                                      width: 46,
                                                      child: Image.network(
                                                        imgList[index],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ))),
                                        ],
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text('See more',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12)),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                      SizedBox(
                        width: 40,
                      )
                    ],
                  )),
              SizedBox(height: 25),
              /// popular
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text("Top Trending Meetups",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
              ),
              SizedBox(height: 15),
              SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                          4,
                          (index) => Container(
                              width: 200,
                              height: 250,
                              margin: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.white, width: 1)),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailPage()));
                                  },
                                  child: Image.network(imgList[index],
                                      fit: BoxFit.fill)))),
                      SizedBox(width: 50)// extra scrolling
                    ],
                  )),
            ],
          ),
        ),
      ),
      /// fake bar there were no need of it its just a demo implementation
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 40, child: Image.asset("assets/images/home.png")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 40, child: Image.asset("assets/images/2nd.png")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 40, child: Image.asset("assets/images/3rd.png")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 40, child: Image.asset("assets/images/4th.png")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 40, child: Image.asset("assets/images/5th.png")),
            label: '',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.amber[800],
        onTap: (int) {
          ///
        },
      ),
    );
  }
}
