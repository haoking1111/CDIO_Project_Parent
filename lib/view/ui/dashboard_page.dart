import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  final controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Obx(() => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        )
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            animationCurve: Curves.linear,
            height: 55,
            color: Colors.teal,
            onTap: (value) {
              controller.changedIndex(value);
            },
            items: const[
              //Home
              CurvedNavigationBarItem(
                child: Icon(Icons.home_outlined, color: Colors.white, size: 30,),
              ),

              //Contact
              CurvedNavigationBarItem(
                child: Icon(Icons.headset_mic_outlined, color: Colors.white, size: 30,),
              ),

              // //Notification
              // CurvedNavigationBarItem(
              //   child: Icon(Icons.notifications_active_outlined, color: Colors.white, size: 30,),
              // ),

              //Account
              CurvedNavigationBarItem(
                child: Icon(Icons.perm_identity, color: Colors.white, size: 30,),
              ),
            ]
        )
    );
  }
}
