import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.search_sharp,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Wishlist',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    TabItem(
      icon: Icons.settings,
      title: 'Setting',
    ),
  ];
  int visit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.cyan
            : Colors.grey.shade900,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 6),
            color: Colors.black,
          ),
        ],
        colorSelected: Colors.black,
        animated: true,
        top: -25,
        chipStyle: ChipStyle(drawHexagon: true),
        itemStyle: ItemStyle.hexagon,
        indexSelected: visit,
        onTap: (index) {
          setState(() {
            visit = index;
          });
        },
      ),
    );
  }
}
