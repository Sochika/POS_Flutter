import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_pos/view/screens/home/home_screens.dart';
import 'package:six_pos/view/screens/pos/pos_screen.dart';
import 'package:six_pos/view/screens/product/limited_product_screen.dart';
import 'package:six_pos/view/screens/product/product_list_with_category.dart';

class BottomMenuController extends GetxController implements GetxService{
  int _currentTab = 0;
  int get currentTab => _currentTab;
  final List<Widget> screen = [
    const HomeScreen(),
    const PosScreen(),
    const ItemsScreen(),
    const LimitedStockProductScreen()
  ];
  Widget _currentScreen = const HomeScreen();
  Widget get currentScreen => _currentScreen;

  resetNavBar(){
    _currentScreen = const HomeScreen();
    _currentTab = 0;
  }

  selectHomePage() {
    _currentScreen = const HomeScreen();
    _currentTab = 0;
     update();
  }

  selectPosScreen() {
    _currentScreen = const PosScreen();
    _currentTab = 1;
    update();
  }

  selectItemsScreen() {
    _currentScreen = const ItemsScreen();
    _currentTab = 2;
    update();
  }

  selectStockOutProductList() {
    _currentScreen = const LimitedStockProductScreen();
    _currentTab = 3;
    update();
  }
}
