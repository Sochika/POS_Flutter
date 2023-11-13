
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_pos/controller/account_controller.dart';
import 'package:six_pos/data/model/response/account_model.dart';

import 'package:six_pos/view/base/no_data_screen.dart';
import 'package:six_pos/view/screens/account_management/widget/account_info_view.dart';


class AccountListView extends StatefulWidget {
  final bool isHome;
  final ScrollController? scrollController;
  const AccountListView({Key? key, this.scrollController, this.isHome = false}) : super(key: key);

  @override
  State<AccountListView> createState() => _AccountListViewState();
}

class _AccountListViewState extends State<AccountListView> {
  @override
  Widget build(BuildContext context) {
    int offset = 1;
    widget.scrollController?.addListener(() {
      if(widget.scrollController!.position.maxScrollExtent == widget.scrollController!.position.pixels
          && Get.find<AccountController>().accountList.isNotEmpty
          && !Get.find<AccountController>().isLoading) {
        int? pageSize;
        pageSize = Get.find<AccountController>().accountListLength;

        if(offset < pageSize!  && !widget.isHome) {
          offset++;
          Get.find<AccountController>().showBottomLoader();
          Get.find<AccountController>().getAccountList(offset);
        }
      }

    });

    return GetBuilder<AccountController>(
      builder: (accountController) {
        List<Accounts> accountList;
        accountList = accountController.accountList;

        return Column(children: [
           accountList.isNotEmpty ?
          ListView.builder(
            shrinkWrap: true,
              itemCount: widget.isHome && accountList.length> 3 ? 3: accountList.length,
              physics: widget.isHome? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
              itemBuilder: (ctx,index){
                return AccountCardViewWidget(account: accountList[index], index: index,isHome:widget.isHome);

              }): const NoDataScreen(),


        ]);
      },
    );
  }
}
