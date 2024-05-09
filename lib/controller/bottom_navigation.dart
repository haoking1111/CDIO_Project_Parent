import 'package:get/get.dart';

import '../view/ui/account_page.dart';
import '../view/ui/contact_page.dart';
import '../view/ui/home_page.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final screens = [
    HomePage(),
    ContactPage(),
    AccountPage(),
  ];

  void changedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

}