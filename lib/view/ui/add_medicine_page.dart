
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/toast.dart';
import '../../controller/medicine_reminder_controller.dart';

class AddMedicineReminderPage extends StatefulWidget {
  const AddMedicineReminderPage({super.key});

  @override
  State<AddMedicineReminderPage> createState() => _AddMedicineReminderPageState();
}

class _AddMedicineReminderPageState extends State<AddMedicineReminderPage> {
  final medicineReminderController = Get.find<MedicineReminderController>();

  bool isLoading = false;

  TextEditingController commentController = TextEditingController();
  TextEditingController currentStatusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(20)
              )
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)
                        )
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.teal[800],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                        )
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25,)
                    ),

                    SizedBox(height: 80,),

                    Center(
                      child: Container(
                        height: 500,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 8,
                                  blurRadius: 12,
                                  offset: const Offset(0, 2))
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              Icon(Icons.health_and_safety, size: 100, color: Colors.teal[700],),

                              SizedBox(height: 20,),
                              
                              //thong tin
                              Text(
                                'Dặn Thuốc',
                                style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              SizedBox(height: 20,),

                              //name
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.comment,
                                    size: 30,
                                  ),

                                  Container(
                                    width: 250,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(12)),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: commentController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.teal),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        hintText: 'Lời dặn dò',
                                        hintStyle:
                                        TextStyle(color: Colors.white70, fontSize: 15),
                                        fillColor: Colors.teal[300],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20,),

                              //phoneNumber
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.perm_contact_cal, size: 33,),

                                  Container(
                                    width: 250,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(12)),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: currentStatusController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.teal),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        hintText: 'Sức khỏe hiện tại của bé',
                                        hintStyle:
                                        TextStyle(color: Colors.white70, fontSize: 15),
                                        fillColor: Colors.teal[300],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 40,),

                              //button update
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading =
                                    true; // Set loading state to true before login call
                                  });
                                  Future.delayed(
                                    Duration(seconds: 1),
                                        () {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                  );

                                  Future.delayed(Duration(seconds: 1),() async {
                                    await medicineReminderController.addMedicineReminder(
                                      commentController.text.trim(),
                                      currentStatusController.text.trim(),
                                    );
                                    Get.back();
                                    showToast(message: 'Thêm dặn dò thành công');
                                  },
                                  );
                                },
                                child: Container(
                                  height: 45,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.teal[500],
                                    borderRadius: BorderRadius.circular(15),

                                  ),
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      // Adjust animation duration as needed
                                      transitionBuilder: (widget, animation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: widget,
                                        );
                                      },
                                      child: isLoading
                                          ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                          : Text(
                                        'Thêm Mới',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
