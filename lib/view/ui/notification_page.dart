import 'dart:async';

import 'package:cdio_project/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final notificationController = Get.put<NotificationController>(NotificationController());

  late Timer _timer; // Khai báo timer ở đây

  @override
  void initState() {
    super.initState();
    // Khởi tạo timer trong phương thức initState
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      notificationController.fetchNotification();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Hủy bỏ timer trong phương thức dispose
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.teal[400]
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/backgroundLogin.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,)
                              ),

                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.search, color: Colors.white, size: 25,)
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),
                          SingleChildScrollView(
                            child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2))
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true, // Add this line
                                    scrollDirection: Axis.vertical,
                                    itemCount: notificationController.notification.value.length,
                                    itemBuilder: (context, index) {
                                      final notificationItem = notificationController.notification.value[index];
                                      return Column(
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.newspaper_sharp, color: Colors.teal, size: 35,),
                                            title: Row(
                                              children:
                                              [
                                                Text('${notificationItem.title}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.redAccent, overflow: TextOverflow.ellipsis),),

                                                Expanded(child: Container()),

                                                Text('${notificationItem.postDay}/${notificationItem.postMonth}/${notificationItem.postYear}', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12, color: Colors.teal[700]),),
                                              ],
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    '${notificationItem.content}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
                                            child:  Divider(color: Colors.grey[200],),
                                          ),
                                          SizedBox(height: 10,),
                                        ],
                                      );
                                    },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },)
    );
  }
}
