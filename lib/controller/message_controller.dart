import 'dart:convert';

import 'package:cdio_project/common/toast.dart';
import 'package:cdio_project/controller/teacher_controller.dart';
import 'package:cdio_project/model/message/message_model.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:get/get.dart';
import '../common/api_url.dart';
import 'auth_controller.dart';
import 'package:http/http.dart' as http;

class MessageController extends GetxController {
  var messageAll = Rx<List<Message>>([]);
  var isLoading = true.obs;

  final TeacherController teacherController = Get.find<TeacherController>();

  @override
  void onInit() {
    super.onInit();
    fetchMessage();
  }


  fetchMessage() async {
    // Đợi cho hoạt động lấy thông co giao thành trước
    await teacherController.fetchTeacher();

    Teacher teacher = teacherController.teacher.value;
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiUrl.getAllMessageUrl}/${teacher.id}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // print(response.statusCode);

      if (response.statusCode == 200) {
        // Parse JSON data
        final data = await response.stream.bytesToString();
        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          messageAll.value = jsonData.map((item) => Message.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          messageAll.value = [Message.fromJson(jsonData)];
        }


        isLoading.value = false;

        update();


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

  creatMessage(String message) async {
    // Đợi cho hoạt động lấy thông co giao thành trước
    await teacherController.fetchTeacher();

    Teacher teacher = teacherController.teacher.value;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'POST',
          Uri.parse('${ApiUrl.getAllMessageUrl}/${teacher.id}')
      );
      request.body = json.encode({
        "content": message
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
      }
      else {
        // print(response.reasonPhrase);
      }

    } catch (e) {
      showToast(message: 'Error');
    }
  }
}