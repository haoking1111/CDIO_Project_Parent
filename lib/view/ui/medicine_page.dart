import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/child_controller.dart';
import '../../model/child/child_model.dart';

class MedicinePage extends StatefulWidget {
  MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final controller = Get.put<ChildController>(ChildController());

        if(controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if(controller.child.value!=null) {
            Child child = controller.child.value;
            return SizedBox(
              height: 900,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Stack(
                    children: [
//image
                      Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/imageinfor.png'), fit: BoxFit.cover)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.white,)
                              ),
                            ],
                          ),
                        ),
                      ),

//health
                      Container(
                        margin: const EdgeInsets.only(top: 240),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.teal.withOpacity(0.1),
                                spreadRadius: 12,
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    children: [
                                      Text(
                                        'Sức Khỏe',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                      Text(
                                        'Cảm cúm',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  ),

                                  Expanded(child: Container()),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Container(
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: Colors.teal[300],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Cần quan tâm kỹ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Icon(Icons.star, size: 15, color: Colors.white,)
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 5,),

                              const Divider(color: Colors.black45, thickness: 1,),

                              const SizedBox(height: 5,),

//Infor
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
//Height
                                  Column(
                                    children: [
                                      Icon(Icons.emoji_people, color: Colors.teal[400], size: 30,),

                                       Text(
                                        '${child.height} cm',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),

                                      const Text(
                                        'Chiều Cao',
                                        style: TextStyle(
                                            fontSize: 12
                                        ),
                                      )
                                    ],
                                  ),

//Weight
                                  Column(
                                    children: [
                                      Icon(Icons.scale, color: Colors.teal[400], size: 30,),

                                       Text(
                                        '${child.weight} kg',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),

                                      const Text(
                                        'Cân Nặng',
                                        style: TextStyle(
                                            fontSize: 12
                                        ),
                                      )
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Icon(Icons.person_pin, color: Colors.teal[400], size: 30,),

                                      const Text(
                                        'Ốm',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),

                                      const Text(
                                        'Hiện Trạng',
                                        style: TextStyle(
                                            fontSize: 12
                                        ),
                                      )
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Icon(Icons.notification_important_rounded, color: Colors.teal[400], size: 30,),

                                      const Text(
                                        '10h trưa',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),

                                      const Text(
                                        'Nhắc Thuốc',
                                        style: TextStyle(
                                            fontSize: 12
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 5,),

                              const Divider(color: Colors.black45, thickness: 1,),

                              const SizedBox(height: 10,),

                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 6,
                                          offset: const Offset(0, 2))
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Dặn dò',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                      const SizedBox(height: 5,),

                                      const Text(
                                        'Cô hay để ý bé hay chảy nước mũi cô lau giúp tôi nhé !',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 5,),

                                      const Row(
                                        children: [
                                          Text(
                                            'Quan tâm: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                            ),
                                          ),

                                          Text(
                                            'Cần quan tâm kĩ',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const Row(
                                        children: [
                                          Text(
                                            'Hiện trạng: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                            ),
                                          ),

                                          Text(
                                            'Đã uống 2 ngày thuốc, đã đỡn còn sổ mũi',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 10,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            '16/04/2024',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),

                                          Expanded(child: Container()),

                                          Text(
                                            'Cập Nhật',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.cyan[700],
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20,),

                              Text(
                                'Xem tất cả',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.cyan[700],
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              const SizedBox(height: 10,),

                              Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/support1.png'), fit: BoxFit.cover,

                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Cách trị cúm cho trẻ từ 1',
                                      style: TextStyle(
                                          fontSize: 24
                                      ),
                                    ),
                                    Text(
                                      'đến 3 tuổi nhanh chóng !',
                                      style: TextStyle(
                                          fontSize: 24
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2))
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.teal[300],
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                            'Bé ho không ngớt phải làm gì ?',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),

                                      Expanded(child: Container()),

                                      const Text(
                                        'Xem chi tiết',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]
                ),
              ),
            );
          } else {
            return Center(
              child: Text('Khong co du lieu'),
            );
          }
        }
      }),
    );
  }
}

