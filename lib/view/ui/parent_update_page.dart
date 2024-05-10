import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentUpdatePage extends StatefulWidget {
  const ParentUpdatePage({super.key});

  @override
  State<ParentUpdatePage> createState() => _ParentUpdatePageState();
}

class _ParentUpdatePageState extends State<ParentUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)
                )
              ),
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
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 25,)
                  ),

                  SizedBox(height: 40,),

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
                                spreadRadius: 6,
                                blurRadius: 10,
                                offset: const Offset(0, 2))
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Column(
                          children: [
                            //thong tin
                            Text(
                              'Thông Tin',
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 10,),

                            //name
                            Row(
                              children: [
                                Icon(
                                  Icons.supervisor_account_outlined,
                                  size: 30,
                                ),

                              ],
                            ),

                            SizedBox(height: 20,),

                            //phoneNumber
                            Row(
                              children: [
                                Icon(Icons.phone, size: 25,),


                              ],
                            ),

                            SizedBox(height: 20,),

                            //address
                            Row(
                              children: [
                                Icon(Icons.home, size: 25,),


                              ],
                            ),

                            SizedBox(height: 20,),

                            //email
                            Row(
                              children: [
                                Icon(Icons.email, size: 25,),


                              ],
                            ),

                            SizedBox(height: 70,),

                            //button update
                            Container(
                              height: 45,
                              width: 240,
                              decoration: BoxDecoration(
                                color: Colors.teal[300],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                      Colors.teal.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(0, 2))
                                ],
                              ),
                            )
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
    );
  }
}
