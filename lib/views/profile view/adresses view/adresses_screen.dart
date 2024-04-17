import 'package:runstore_ecoomerce/libraries.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final profileController = ProfileController();

    final InputBorder inputBorder = UnderlineInputBorder();

    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Addresses",
          actionCardButton: CardButton(
            iconData: PhosphorIcons.dots_three,
            onTap: () {},
          ),
          leadingCardButton: false,
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Container(
        child: Column(
          children: [
            // A top row that displays the different user addresses
            SizedBox(
              height: AppSizes.height * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.extraHorizontalPadding * 1.2,
                ),
                children: List.generate(
                  profileController.myAddresses.length,
                  (index) {
                    final address = profileController.myAddresses[index];
                    return Obx(() {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          profileController.changeUserAddress(
                            profileController.myAddressesIndex(index),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.only(
                            right: index ==
                                    profileController.myAddresses.length - 1
                                ? 0
                                : 30,
                            top: 10,
                            bottom: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      address.home,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .apply(
                                            fontSizeFactor: 1.2,
                                          ),
                                    ),
                                    SizedBox(width: AppSizes.defaultWidth * 20),
                                    Icon(
                                      Icons.done,
                                      color: profileController
                                                  .myAddressesIndex.value ==
                                              index
                                          ? Colors.green
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSizes.defaultHeight),
                                Text(
                                  address.address,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                        color: Colors.black54,
                                        fontWeightDelta: -5,
                                        fontSizeFactor: 1.05,
                                      ),
                                ),
                                Text(
                                  "${address.city + address.state + address.zipCode}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                        color: Colors.black54,
                                        fontWeightDelta: -5,
                                        fontSizeFactor: 1.05,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: AppSizes.height * 0.06,
            ),

            // A form with selected address data
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.extraHorizontalPadding * 1.6),
              child: Form(
                child: Column(
                  children: [
                    // Name TextFormField
                    TextFormField(
                      controller: profileController.homeTextController,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: primaryColor, fontSizeFactor: 1.2),
                      decoration: InputDecoration(
                        border: inputBorder,
                        labelText: "Name",
                      ),
                    ),
                    SizedBox(height: AppSizes.formVerticalSpace),

                    // Address TextFormField
                    TextFormField(
                      controller: profileController.addressController,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: primaryColor, fontSizeFactor: 1.2),
                      decoration: InputDecoration(
                        border: inputBorder,
                        label: Text("Address"),
                      ),
                    ),
                    SizedBox(height: AppSizes.formVerticalSpace),

                    // City and Zipcode TextFormField
                    Row(
                      children: [
                        SizedBox(
                          width: AppSizes.width / 2.5,
                          child: TextFormField(
                            controller: profileController.cityController,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    color: primaryColor, fontSizeFactor: 1.2),
                            decoration: InputDecoration(
                              border: inputBorder,
                              label: Text("City"),
                            ),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: AppSizes.width / 2.5,
                          child: TextFormField(
                            controller: profileController.zipcodeController,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    color: primaryColor, fontSizeFactor: 1.2),
                            decoration: InputDecoration(
                              border: inputBorder,
                              label: Text("Zip Code"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.formVerticalSpace),

                    // State TextFormField
                    TextFormField(
                      controller: profileController.stateController,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: primaryColor, fontSizeFactor: 1.2),
                      decoration: InputDecoration(
                        border: inputBorder,
                        label: Text("State"),
                      ),
                    ),
                    SizedBox(height: AppSizes.defaultHeight),

                    // Default address Switch
                    Obx(() {
                      return SwitchListTileWidget(
                        titleText: 'Default Shipping address',
                        switchValue: profileController.setDefaultAddress.value,
                        onChanged: (value) {
                          profileController.setDefaultAddress(value);
                        },
                      );
                    }),
                    SizedBox(height: AppSizes.formVerticalSpace),

                    // Button to save address
                    PrimaryButton(
                      text: "Save address",
                      width: AppSizes.width - AppSizes.extraHorizontalPadding,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
