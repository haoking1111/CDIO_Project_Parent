import 'package:cdio_project/controller/medicine_reminder_controller.dart';
import 'package:cdio_project/model/medicine/medicine_reminder_model.dart';
import 'package:cdio_project/view/ui/dashboard_page.dart';
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
        final controllerChild = Get.put<ChildController>(ChildController());
        final controllerMedicineReminder = Get.put(MedicineReminderController());
          Child child = controllerChild.child.value;
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
                      height: MediaQuery.of(context).size.height,
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

                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true, // Add this line
                              scrollDirection: Axis.vertical,
                              itemCount: controllerMedicineReminder.medicineReminder.value.length,
                              itemBuilder: (context, index) {
                                final medicineReminderItem = controllerMedicineReminder.medicineReminder.value[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
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

                                           Text(
                                            '${medicineReminderItem.comment}',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),

                                          const SizedBox(height: 5,),

                                           Row(
                                            children: [
                                              Text(
                                                'Hiện trạng: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                ),
                                              ),

                                              Text(
                                                '${medicineReminderItem.currentStatus}',
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
                                               Text(
                                                '${medicineReminderItem.createdDay}/${medicineReminderItem.createdMonth}/${medicineReminderItem.createdYear}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ]
              ),
            ),
          );
                }
      ),
    );
  }
}

