
import 'dart:convert';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/controller/child_controller.dart';
import 'package:cdio_project/model/child/child_model.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';
import '../model/parent/parent_model.dart';

class TeacherController extends GetxController{
  var teacher = Teacher().obs;
  var isLoading = true.obs;

  final ChildController childController = Get.find<ChildController>();

  @override
  void onInit() {
    super.onInit();
    fetchTeacher();
  }

  fetchTeacher() async {
    // Đợi cho hoạt động lấy thông tin trẻ em hoàn thành trước
    await childController.fetchChild();

    Child child = childController.child.value;
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiUrl.getTeacherUrl}/${child.teacherId}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read data from response
        final data = await response.stream.bytesToString();
        // Decode JSON into a Map<String, dynamic>
        Map<String, dynamic> jsonData = jsonDecode(data);
        final teacherData = await Teacher.fromJson(jsonData);



        // Lưu dữ liệu vào biến parent
        teacher.value = teacherData;

        isLoading.value = false;

        update();

        print(teacher.value.fullName);
        print(teacher.value.phoneNumber);
        print(teacher.value.email);


      } else {
        await Get.snackbar(
            'Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}'
        );
      }
    } catch (e) {
      print('error: ' + e.toString());
      // or throw an exception
    }
  }
}
