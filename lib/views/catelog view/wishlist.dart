import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  List<Map<String, dynamic>> details = [
    {
      "image": "assets/image/woman2-removebg.png",
      "name": "Max&Co",
      "name1": "Ribbed Knitted",
      "name2": "Turtleneck Sweater",
      "size": "S,M,XL,XXL",
      "colour": "Turquoise",
    },
    {
      "image": "assets/image/woman-removebg.png",
      "name": "Red Valentino",
      "name1": "Front pocket",
      "name2": "Oversized jacket",
      "size": "S,M,XL,XXL",
      "colour": "Turquoise",
    },
    {
      "image": "assets/image/woman2-removebg.png",
      "name": "Levi's",
      "name1": "Alexa Black Short",
      "name2": "Puffer jacket",
      "size": "S,M",
      "colour": "Black",
    },
    {
      "image": "assets/image/woman-removebg.png",
      "name": "Max&Co",
      "name1": "Ribbed Knitted",
      "name2": "Turtleneck Sweater",
      "size": "S,M,XL,XXL",
      "colour": "Turquoise",
    },
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 5))
                        ]),
                    child: IconButton(
                      style: ButtonStyle(),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                        size: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "Wishlist",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 5))
                        ]),
                    child: IconButton(
                      style: ButtonStyle(),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                                PhosphorIcons.t_shirt,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            Text(
                              "Clothing",
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
                              Text(
                                "9",
                                style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 21),
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
                      padding: EdgeInsets.only(top: 20),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 130,
                                    height: 130,
                                    margin: EdgeInsets.only(bottom: 20),
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
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    details[index]['name'],
                                    style: TextStyle(
                                        fontFamily: "Amiko",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    details[index]['name1'],
                                    style: TextStyle(
                                        fontFamily: "Amiko",
                                        color: Colors.grey,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    details[index]['name2'],
                                    style: TextStyle(
                                        fontFamily: "Amiko",
                                        color: Colors.grey.shade500,
                                        fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$ 19 .99",
                                        style: TextStyle(
                                            fontFamily: "Amiko",
                                            color: Colors.blueAccent,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "\$ 19 .99",
                                        style: TextStyle(
                                          fontFamily: "Amiko",
                                          color: Colors.grey.shade400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.grey,
                                          // decorationThickness: 0.85,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Size     -",
                                        style: TextStyle(
                                          fontFamily: "Amiko",
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        details[index]['size'],
                                        style: TextStyle(
                                            fontFamily: "Amiko",
                                            color: Colors.grey.shade400,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Colour -",
                                        style: TextStyle(
                                            fontFamily: "Amiko",
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        details[index]['colour'],
                                        style: TextStyle(
                                            fontFamily: "Amiko",
                                            color: Colors.grey,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
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
