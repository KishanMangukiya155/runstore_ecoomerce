import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utility/colors.dart';
import '../../utility/constants/app_sizes.dart';
import '../../utility/widgets/appbar_widget.dart';
import '../../utility/widgets/card_button.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List catalog = [
    "Men",
    "Women",
  ];

  List<Map<String, dynamic>> profileOptions = [
    {
      "leading": Icons.shopping_cart,
      "title": "Clothing",
      "onTap": () {},
    },
    {
      "leading": Icons.receipt,
      "title": "Shoes",
      "onTap": () {},
    },
    {
      "leading": Icons.access_time_outlined,
      "title": "Accessories",
      "onTap": () {},
    },
    {
      "leading": Icons.health_and_safety,
      "title": "Beauty & Health",
      "onTap": () {},
    },
    {
      "leading": Icons.toys,
      "title": "Toys",
      "onTap": () {},
    },
    {
      "leading": Icons.book,
      "title": "Books",
      "onTap": () {},
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
      body: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 30),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         height: 40,
          //         width: 40,
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(10),
          //             boxShadow: const [
          //               BoxShadow(
          //                   color: Colors.black12,
          //                   blurRadius: 5,
          //                   offset: Offset(0, 5))
          //             ]),
          //         child: IconButton(
          //           style: ButtonStyle(),
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.arrow_back_ios_sharp,
          //             size: 17,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //       const Text(
          //         "Catalog",
          //         style: TextStyle(
          //             fontSize: 33,
          //             color: Colors.black,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: 'Amiko'),
          //       ),
          //       Container(
          //         height: 40,
          //         width: 40,
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(10),
          //             boxShadow: const [
          //               BoxShadow(
          //                   color: Colors.black12,
          //                   blurRadius: 5,
          //                   offset: Offset(0, 5))
          //             ]),
          //         child: IconButton(
          //           style: ButtonStyle(),
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.camera_alt_outlined,
          //             size: 17,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Text(
            "Search",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(fontSizeFactor: 2.5, color: Colors.grey),
          ),
          Divider(
            color: Colors.grey.shade400,
            endIndent: 60,
            indent: 80,
          ),
          Container(
            height: 50,
            width: 200,
            // decoration: BoxDecoration(color: Colors.deepPurple),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                catalog.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  child: Container(
                    width: 70,
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
                        catalog[index],
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
          ListView.separated(
            itemCount: profileOptions.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  profileOptions[index]["leading"],
                  color: Colors.black,
                  // color: Theme.of(context).brightness == Brightness.light
                  //     ? primaryColor
                  //     : secondaryColor,
                ),
                title: Text(
                  "${profileOptions[index]["title"]}",
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        fontSizeFactor: 1.3,
                        // fontWeightDelta: 1,
                        color: Colors.black,
                        fontFamily: "Amiko",
                        // color: Theme.of(context).brightness == Brightness.light
                        //     ? Colors.black
                        //     : secondaryColor,
                      ),
                ),
                trailing: CardButton(
                  iconData: Icons.arrow_forward_ios_outlined,
                  onTap: profileOptions[index]["onTap"],
                  applyShadow: false,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
          ),
        ],
      ),
    );
  }
}
