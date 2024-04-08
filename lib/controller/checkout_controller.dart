import 'package:runstore_ecoomerce/libraries.dart';

class CheckOutController extends GetxController {
  List<Map<String, dynamic>> checkOutProcess = [
    {
      "icon": Icons.my_location_outlined,
      "step": "Address",
      "widget": AddressView(),
    },
    {
      "icon": Icons.local_shipping_outlined,
      "step": "Delivery",
      "widget": DeliveryView(),
    },
    {
      "icon": Icons.credit_card_outlined,
      "step": "Payment",
      "widget": PaymentView(),
    },
    {
      "icon": Icons.check_circle_outline,
      "step": "Confirm",
      "widget": ConfirmView(),
    },
  ];

  List<Map<String, dynamic>> deliveryOptions = [
    {
      "type": "Free - \$0.00",
      "expected_delivery": "3-5 day delivery",
    },
    {
      "type": "Standard - \$2.50",
      "expected_delivery": "2-3 day delivery",
    },
    {
      "type": "\$5.99",
      "expected_delivery": "Next day delivery",
    },
  ];

  List<AssetImage> paymentMethod = [
    AssetImage(AppImages.masterCard),
    AssetImage(AppImages.apple_pay),
    AssetImage(AppImages.google_pay),
  ];

  RxInt checkoutIndex = 0.obs;
  RxInt deliveryIndex = 0.obs;
  RxInt paymentIndex = 0.obs;
  RxBool setDefaultAddress = true.obs;
  RxBool saveCreditCardDetails = true.obs;

  void setCheckOutIndex(int index) => checkoutIndex(index);

  void setDeliveryIndex(int index) => deliveryIndex(index);

  void setPaymentIndex(int index) => paymentIndex(index);
}
