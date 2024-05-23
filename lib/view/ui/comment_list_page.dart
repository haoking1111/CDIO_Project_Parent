import 'package:cdio_project/controller/child_controller.dart';
import 'package:cdio_project/model/child/child_model.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:cdio_project/view/ui/comments_teacher_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/teacher_controller.dart';
import 'comment_child_page.dart';

class CommentListPage extends StatefulWidget {
  const CommentListPage({super.key});

  @override
  State<CommentListPage> createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage> {

  final teacherController = Get.put<TeacherController>(TeacherController());

  final childController = Get.put<ChildController>(ChildController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        if (childController.isLoading.value ||
            teacherController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (childController.isLoading.value != null ||
              teacherController.isLoading.value != null) {
            Child child = childController.child.value;
            Teacher teacher = teacherController.teacher.value;
            return Container(
              color: Colors.teal[300],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,)
                    ),

                    SizedBox(height: 200,),

                    GestureDetector(
                      onTap: () {
                        Get.to(()=>CommentChildPage());
                      },
                      child: Column(
                        children: [
                          Icon(Icons.featured_play_list_rounded, size: 50, color: Colors.white,),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 5,),
                              Text(
                                'Sổ tay bé: ${child.fullName}',
                                style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(width: 15,),
                              Icon(Icons.arrow_forward_ios, color: Colors.white,)
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50,),

                    Divider(color: Colors.white,),

                    SizedBox(height: 50,),


                    GestureDetector(
                      onTap: () {
                        Get.to(()=>CommentsTeacherPage());
                      },
                      child: Column(
                        children: [
                          Icon(Icons.comment, size: 50, color: Colors.white,),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 5,),
                              Text(
                                'Nhận xét cô ${teacher.fullName}',
                                style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(width: 15,),
                              Icon(Icons.arrow_forward_ios, color: Colors.white,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('Khong co du lieu'),);
          }
        }
      },
    ));
  }
}


