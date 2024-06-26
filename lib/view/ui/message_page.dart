import 'dart:async';
import 'package:cdio_project/controller/message_controller.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/teacher_controller.dart';
import '../../model/message/message_model.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final teacherController = Get.put<TeacherController>(TeacherController());
  final messageController = Get.put(MessageController());

  TextEditingController _messageController = TextEditingController();

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      messageController.fetchMessage();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                    () {
                  if (teacherController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (teacherController.isLoading.value != null) {
                      Teacher teacher = teacherController.teacher.value;
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10, bottom: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 23),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.black,
                                        )),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius: BorderRadius.circular(50),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/teacher.png'),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 3,
                                          child: Container(
                                            height: 12,
                                            width: 12,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(50)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cô ${teacher.fullName}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          'Đang hoạt động',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    IconButton(
                                        onPressed: () async {
                                          final Uri url = Uri(
                                              scheme: 'tel',
                                              path: '${teacher.phoneNumber}');

                                          await launchUrl(url);

                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            print('can not launch');
                                          }
                                        },
                                        icon: Icon(
                                          Icons.phone_in_talk,
                                          color: Colors.teal,
                                          size: 25,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.videocam,
                                          color: Colors.teal,
                                          size: 25,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: messageController.messageAll.value.length,
                                itemBuilder: (context, index) {
                                  final message = messageController.messageAll.value[index];
                                  final isSentByTeacher = message.sendUserId == teacherController.teacher.value.id;

                                  return buildMessage(
                                    message,
                                    isSentByTeacher,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text('Khong co data'),
                      );
                    }
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.add_circle,
                  color: Colors.teal,
                ),
                Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                ),
                Icon(Icons.image, color: Colors.teal),
                Icon(Icons.mic, color: Colors.teal),
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _messageController,
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
                      hintText: 'Aa',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.teal[400],
                      filled: true,
                    ),
                  ),
                ),
                //send
                GestureDetector(
                  onTap: () {
                    messageController.creatMessage(_messageController.text.trim());
                    _messageController.clear();
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.teal,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessage(Message message, bool isSentByTeacher) {
    return Column(
      crossAxisAlignment:
      isSentByTeacher ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        // Message bubble
        Row(
          mainAxisAlignment:
          isSentByTeacher ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: isSentByTeacher ? Colors.grey[300] : Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                message.content ?? '',
                style: TextStyle(
                  color: isSentByTeacher ? Colors.black : Colors.white,
                ),
              ),
            ),
          ],
        ),
        // Date and time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            '${message.hour}:${message.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
