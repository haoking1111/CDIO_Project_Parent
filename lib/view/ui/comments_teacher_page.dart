import 'package:cdio_project/controller/class_controller.dart';
import 'package:cdio_project/controller/comment_for_child_controller.dart';
import 'package:cdio_project/controller/teacher_controller.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/toast.dart';
import '../../model/class/class_model.dart';

class CommentsTeacherPage extends StatefulWidget {
  CommentsTeacherPage({super.key});

  @override
  _CommentsTeacherPageState createState() => _CommentsTeacherPageState();
}

class _CommentsTeacherPageState extends State<CommentsTeacherPage> {
  final teacherController = Get.put<TeacherController>(TeacherController());
  final classController = Get.put<ClassController>(ClassController());
  final commentController = Get.put<CommentController>(CommentController());

  int attitudeScore = 10;
  int creativityScore = 10;
  TextEditingController commentTeacherController = TextEditingController();

  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (teacherController.isLoading.value || classController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (teacherController.isLoading.value != null || classController.isLoading.value != null) {
            Teacher teacher = teacherController.teacher.value;
            Class classInf = classController.classInf.value;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
                        ),
                        Expanded(child: Container()),
                        const Icon(Icons.notifications_active_outlined),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/teacher.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Cô Giáo: ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '${teacher.fullName}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Chủ Nhiệm Lớp: ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '${classInf.name}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 20),
                    buildCombinedScoreCard(),
                    const SizedBox(height: 30),
                    buildCommentSection(),
                    const SizedBox(height: 30),
                    Obx(() {
                      if (isLoading.value) {
                        return CircularProgressIndicator();
                      } else {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal
                          ),
                          onPressed: () async {
                            isLoading.value = true;
                            await commentController.commentForTeacher(
                                attitudeScore,
                                creativityScore,
                                commentTeacherController.text.trim()
                            );
                            Future.delayed(Duration(seconds: 1),() {
                              isLoading.value = false;
                              Get.back();
                              showToast(message: 'Cảm ơn bạn đã nhận xét cô giáo trong tháng này !');
                            },);
                          },
                          child: Text('Gửi nhận xét', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        );
                      }
                    }),
                  ],
                ),
              ),
            );
          }
        }
        return Container();
      }),
    );
  }

  Widget buildCombinedScoreCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              buildScoreCard('Thái Độ', 'Thái độ của cô giáo', 'assets/images/attitude.png', attitudeScore, (value) {
                setState(() {
                  attitudeScore = value!;
                });
              }),
              const SizedBox(height: 20),
              buildScoreCard('Sáng Tạo', 'Sáng tạo trong các bài học', 'assets/images/idea.png', creativityScore, (value) {
                setState(() {
                  creativityScore = value!;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScoreCard(String title, String subTitle, String imagePath, int score, ValueChanged<int?> onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 90,
          width: 90,
          child: Image(image: AssetImage(imagePath)),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  'Điểm: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                DropdownButton<int>(
                  value: score,
                  items: List.generate(10, (index) => index + 1)
                      .map((e) => DropdownMenuItem<int>(
                    value: e,
                    child: Text(e.toString()),
                  ))
                      .toList(),
                  onChanged: onChanged,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCommentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nhận xét về cô giáo:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: commentTeacherController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              hintText: 'Viết nhận xét về cô giáo...',
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
