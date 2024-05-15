import 'dart:convert';

import 'package:cdio_project/common/toast.dart';
import 'package:cdio_project/controller/child_controller.dart';
import 'package:cdio_project/controller/teacher_controller.dart';
import 'package:cdio_project/model/child/child_model.dart';
import 'package:cdio_project/model/image/image_model.dart';
import 'package:cdio_project/model/message/message_model.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../common/api_url.dart';
import 'auth_controller.dart';
import 'package:http/http.dart' as http;

class ImageController extends GetxController {
  var imageAll = Rx<List<ImageModel>>([]);
  var isLoading = true.obs;

  final ChildController childController = Get.find<ChildController>();

  @override
  void onInit() {
    super.onInit();
    fetchImage();
  }


  fetchImage() async {
    // Đợi cho hoạt động lấy thông co giao thành trước
    await childController.fetchChild();

    Child child = childController.child.value;
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiUrl.getAlbumByChildIdUrl}/${child.id}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // print(response.statusCode);

      if (response.statusCode == 200) {
        // Parse JSON data
        final data = await response.stream.bytesToString();
        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          imageAll.value = jsonData.map((item) => ImageModel.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          imageAll.value = [ImageModel.fromJson(jsonData)];
        }


        isLoading.value = false;

        update();


        for (var image in imageAll.value) {
          print('Image ID: ${image.id}');
          print('Created Year: ${image.createdYear}');
          print('Created Month: ${image.createdMonth}');
          print('Created Day: ${image.createdDay}');
          print('Hour: ${image.hour}');
          print('Minute: ${image.minute}');
          print('Second: ${image.second}');
          print('Image URL: ${image.image}');
          print('Child ID: ${image.childId}');
          print('----------------------');
        }

      } else {
        Get.snackbar(
            'Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}'
        );
      }
    } catch (e) {
      showToast(message: 'Error');
    }
  }
}