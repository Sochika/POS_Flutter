import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_pos/util/dimensions.dart';
import 'package:six_pos/util/images.dart';
class ScanOrAddFromItem extends StatelessWidget {
  const ScanOrAddFromItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
      SizedBox(width: 80,height: 80,
          child: Image.asset(Images.scanAddItem)),
      const SizedBox(height: Dimensions.paddingSizeDefault),

      Text('scan_item_or_add_from_items'.tr),
    ],);
  }
}
