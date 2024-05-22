import 'package:cdio_project/controller/post_controller.dart';
import 'package:cdio_project/view/ui/post_item_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/api_url.dart';
import '../../model/post/post_model.dart';
import 'detail_post_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final postController = Get.put<PostController>(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (postController.postInf.value.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
                    child: Row(
                      children: [
                        //icon back
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        //search
                        Container(
                          width: 260,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                //icon search
                                Icon(
                                  Icons.search_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                //text
                                Text(
                                  'Tìm Kiếm',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        //Icon notifi
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_active_outlined,
                            size: 25,
                            color: Colors.teal[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.filter_alt_rounded,
                              color: Colors.teal[400],
                            ),
                          ),
                          const Text(
                            '|',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Phổ biến',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Ngày',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Loại',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 10),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(), // To make ListView.builder scrollable inside SingleChildScrollView
                    shrinkWrap: true, // To make ListView.builder take only needed height
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: (postController.postInf.value.length + 1) ~/ 2,
                    itemBuilder: (context, index) {
                      final int firstIndex = index * 2;
                      final int secondIndex = firstIndex + 1;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PostItem(post: postController.postInf.value[firstIndex]),
                          ),
                          if (secondIndex < postController.postInf.value.length)
                            const SizedBox(width: 20),
                          if (secondIndex < postController.postInf.value.length)
                            Expanded(
                              child: PostItem(post: postController.postInf.value[secondIndex]),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('Không có dữ liệu'));
          }
        }
      }),
    );
  }
}


