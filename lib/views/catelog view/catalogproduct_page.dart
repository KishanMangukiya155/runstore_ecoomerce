import 'package:runstore_ecoomerce/utility/constants/app_sizes.dart';

import '../../libraries.dart';

class CatelogScreen extends StatefulWidget {
  const CatelogScreen({super.key});

  @override
  State<CatelogScreen> createState() => _CatelogScreenState();
}

class _CatelogScreenState extends State<CatelogScreen> {
  List<Map<String, dynamic>> catelog = [
    {
      'name': "Men",
      'product': '1.7k product',
      'image': 'assets/image/men_s_clothes.4-removebg.png',
      'textcolor': Color(0xff5A7DD),
      'color': Color(0xffD7EDFF),
      'viewcolor': Color(0xffA8E2FD),
    },
    {
      'name': "Women",
      'product': '1.7k product',
      'textcolor': Color(0xff5A7DD7),
      'image': 'assets/image/jecket2-removebg.png',
      'color': Color(0xffFCD6DC),
      'viewcolor': Color(0xffFE9485),
    },
    {
      'name': "Kids",
      'product': '1.7k product',
      'textcolor': Color(0xff5A7DD),
      'image': 'assets/image/kids2-removebg.png',
      'color': Color(0xffE1BDEF),
      'viewcolor': Color(0xffB279E9),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Catalog",
          applyLeading: true,
          actionCardButton: CardButton(
            iconData: Icons.search_outlined,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: List.generate(
              catelog.length,
              (index) => Container(
                height: AppSizes.defaultHeight * 12,
                width: AppSizes.defaultWidth * 89,
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: catelog[index]['color'],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: AppSizes.defaultHeight * 11,
                            width: AppSizes.defaultWidth * 28,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage(
                                  catelog[index]['image'],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
