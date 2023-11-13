import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_pos/util/dimensions.dart';
import 'package:six_pos/util/images.dart';
import 'package:six_pos/view/base/custom_app_bar.dart';
import 'package:six_pos/view/base/custom_drawer.dart';
import 'package:six_pos/view/base/custom_header.dart';
import 'package:six_pos/view/screens/category/widget/add_new_category.dart';
import 'package:six_pos/view/screens/category/widget/category_list_view.dart';
class CategoryListViewScreen extends StatefulWidget {
  const CategoryListViewScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListViewScreen> createState() => _CategoryListViewScreenState();
}

class _CategoryListViewScreenState extends State<CategoryListViewScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: const CustomDrawer(),
        body: SafeArea(
          child: RefreshIndicator(
            color: Theme.of(context).cardColor,
            backgroundColor: Theme.of(context).primaryColor,
            onRefresh: () async {
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CustomHeader(title: 'category_list'.tr, headerImage: Images.categories),
                      const SizedBox(height: Dimensions.paddingSizeDefault    ),
                      CategoryListView(scrollController: _scrollController,),
                      const SizedBox(height: Dimensions.paddingSizeExtraExtraLarge)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

      floatingActionButton: FloatingActionButton(backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
        Get.to(const AddNewCategory());
      },child: Image.asset(Images.addCategoryIcon),),
    );
  }
}
