import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../event/screen/event_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../profile/screen/profile_screen.dart';
import '../../search/presentation/screens/search.dart';

class MainViewController extends GetxController {
  var currentIndex = 0.obs;
  var isFabActive = false.obs;

  late final List<Widget> screens = [
    HomeScreen(),
    Search(),
   // SearchScreen(),
    EventScreen(),
    ProfileScreen(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
    isFabActive.value = false;
  }

  void toggleFab() {
    isFabActive.value = !isFabActive.value;
  }

  Widget get currentPage => screens[currentIndex.value];
}
