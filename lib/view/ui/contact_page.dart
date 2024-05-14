import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/teacher_controller.dart';
import '../../model/teacher/teacher_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final teacherController = Get.put<TeacherController>(TeacherController());

  // Future<void> _launchUrl(String url) async {
  //   final Uri uri = Uri(scheme: 'https', host: url);
  //
  //   if(!await launchUrl(
  //     uri,
  //     mode: LaunchMode.inAppBrowserView,
  //
  //   )) {
  //     throw 'Không thể mở';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        if (teacherController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (teacherController.isLoading.value != null ||
              teacherController.isLoading.value != null) {
            Teacher teacher = teacherController.teacher.value;
            return SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 380,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(150)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 10,
                                blurRadius: 3,
                                offset: const Offset(0, 2))
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Trường Mầm Non',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                'Ánh',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Text(
                                'Dương',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 480,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 7,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(120),
                                      bottomRight: Radius.circular(120),
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 40),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Địa Chỉ :',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Cơ Sở 1: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Text(
                                              '71 An Phú, Thanh Khê, Đà Nẵng',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Cơ Sở 2: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Text(
                                              '17 Trần Phú, Thanh Khê, Đà Nẵng',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            launchUrl(
                                                Uri.parse('https://duytan.edu.vn/'),
                                                mode: LaunchMode.inAppBrowserView
                                            );
                                          },
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 6,
                                                      offset: const Offset(0, 2))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.house,
                                                  size: 30,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'https://duytan.edu.vn/',
                                                  style: TextStyle(
                                                    decoration: TextDecoration.underline,
                                                      fontWeight: FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            launchUrl(
                                                Uri.parse('https://www.facebook.com/fishman793'),
                                                mode: LaunchMode.inAppBrowserView
                                            );
                                          },
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 6,
                                                      offset: const Offset(0, 2))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.facebook,
                                                  size: 30,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'https://www.facebook.com/fishman793',
                                                  style: TextStyle(
                                                    decoration: TextDecoration.underline,
                                                      fontWeight: FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final Uri url = Uri(
                                              scheme: 'tel',
                                              path: '0962492787'
                                            );
                  
                                            await launchUrl(url);
                  
                                            if(await canLaunchUrl(url)) {
                                              await launchUrl(url);
                                            } else {
                                              print('can not launch');
                                            }
                                          },
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 6,
                                                      offset: const Offset(0, 2))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  size: 30,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Hotline nhà trường: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  '0962492787',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final Uri url = Uri(
                                                scheme: 'tel',
                                                path: '${teacher.phoneNumber}'
                                            );
                  
                                            await launchUrl(url);
                  
                                            if(await canLaunchUrl(url)) {
                                              await launchUrl(url);
                                            } else {
                                              print('can not launch');
                                            }
                                          },
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 6,
                                                      offset: const Offset(0, 2))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.phone_in_talk,
                                                  size: 30,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Hotline cô giáo: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  '${teacher.phoneNumber}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 6,
                                                    offset: const Offset(0, 2))
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.email,
                                                size: 30,
                                                color: Colors.teal,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Email cô giáo: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              Text(
                                                '${teacher.address}',
                                                style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Text('Khong co data'),
            );
          }
        }
      },
    ));
  }
}
