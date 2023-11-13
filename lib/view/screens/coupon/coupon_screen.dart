
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_pos/util/dimensions.dart';
import 'package:six_pos/util/images.dart';
import 'package:six_pos/view/base/custom_app_bar.dart';
import 'package:six_pos/view/base/custom_category_button.dart';
import 'package:six_pos/view/base/custom_drawer.dart';
import 'package:six_pos/view/screens/coupon/add_coupon_screen.dart';
import 'package:six_pos/view/screens/coupon/coupon_list_screen.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .12;
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: Column(children: [

        InkWell(
          onTap: () => Get.to(() => const CouponListScreen()),
          child: CustomCategoryButton(
            padding: width,
            buttonText: 'coupon_list'.tr,
            icon: Images.couponListIcon,
          ),
        ),

        const SizedBox(height: Dimensions.paddingSizeDefault),

        InkWell(
          onTap: () => Get.to(() => const AddCouponScreen()),
          child: CustomCategoryButton(
            padding: width,
            buttonText: 'add_new_coupon'.tr,
            icon: Images.addCategoryIcon,
          ),
        ),

    ],),);
  }
}
