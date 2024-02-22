import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../utility/colors.dart';
import '../../utility/constants/app_sizes.dart';
import '../../utility/widgets/appbar_widget.dart';
import '../../utility/widgets/card_button.dart';

class ShoesPage extends StatefulWidget {
  const ShoesPage({super.key});

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  List shoeslist = [
    "Men",
    "Women",
    "Kids",
  ];

  List<Map<String, dynamic>> details = [
    {
      "image": "assets/image/shoes_nike-removebg.png",
      "name": "Nike",
      "name1": "Air Zoom Super Rep",
      'price': '\$ 19.50',
      'subprice': '\$120.50',
    },
    {
      "image": "assets/image/nike-removebg.png",
      "name": "Nike",
      "name1": "Zoom Zreak Rising Star",
      'price': '\$ 130.00',
      'subprice': '\$145.50',
    },
    {
      "image": "assets/image/shoes_nike-removebg.png",
      "name": "Nike",
      "name1": "Air Zoom Super Rep",
      'price': '\$ 19.50',
      'subprice': '\$120.50',
    },
    {
      "image": "assets/image/nike-removebg.png",
      "name": "Nike",
      "name1": "Zoom Zreak Rising Star",
      'price': '\$ 130.00',
      'subprice': '\$145.50',
    },
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Catalog",
          applyLeading: true,
          actionCardButton: CardButton(
            iconData: Icons.camera_alt_outlined,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Text(
              "Shoes",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(fontSizeFactor: 3.5, color: Colors.black),
            ),
            Container(
              height: 50,
              width: 250,
              // decoration: BoxDecoration(color: Colors.deepPurple),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  shoeslist.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Container(
                      width: 65,
                      height: 50,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            selectIndex == index
                                ? BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  )
                                : BoxShadow(color: Colors.white, blurRadius: 0)
                          ]),
                      child: Center(
                        child: Text(
                          shoeslist[index],
                          style: TextStyle(
                              fontWeight: selectIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontFamily: "Amiko",
                              color: selectIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSizes.defaultHeight),
            Container(
              height: 690,
              width: 365,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                PhosphorIcons.caret_down,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Bestseller",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: "Amiko",
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey.shade300),
                              IconButton(
                                style: TextButton.styleFrom(
                                    shape: LinearBorder.bottom()),
                                onPressed: () {},
                                icon: Icon(
                                  PhosphorIcons.envelope,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey.shade300),
                              IconButton(
                                style: TextButton.styleFrom(
                                    shape: LinearBorder.bottom()),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey.shade300),
                              IconButton(
                                style: TextButton.styleFrom(
                                    shape: LinearBorder.bottom()),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
                  Container(
                    width: 410,
                    height: 570,
                    child: ListView.builder(
                      itemCount: details.length,
                      padding: EdgeInsets.only(top: 10),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppSizes.defaultWidth * 74,
                                height: AppSizes.defaultHeight * 10,
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      details[index]['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.more_horiz_rounded,
                                        color: Color(0xff586BCA),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, left: 9),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          details[index]['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          details[index]['name1'],
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                details[index]['price'],
                                                style: TextStyle(
                                                    color: Color(0xff586BCA),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                details[index]['subprice'],
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor: Colors.grey,
                                                  decorationThickness: 0.8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // SizedBox(
                              //     height: AppSizes.defaultHeight / 1.2),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
