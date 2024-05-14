
import 'dart:convert';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/model/class/class_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';
import '../model/child/child_model.dart';
import 'child_controller.dart';

class ClassController extends GetxController{

  var classInf = Class().obs;
  var isLoading = true.obs;

  final ChildController childController = Get.find<ChildController>();

  @override
  void onInit() {
    super.onInit();
    fetchClass();
  }

  fetchClass() async {
    // Đợi cho hoạt động lấy thông tin trẻ em hoàn thành trước
    await childController.fetchChild();

    Child child = childController.child.value;
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiUrl.getClassById}/${child.classroomId}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read data from response
        final data = await response.stream.bytesToString();
        // Decode JSON into a Map<String, dynamic>
        Map<String, dynamic> jsonData = jsonDecode(data);
        final classData =  Class.fromJson(jsonData);

        // Lưu dữ liệu vào biến parent
        classInf.value = classData;
        isLoading.value = false;

        print('ClassName--------------: ${classInf.value.name}');

        update();

      } else {
         Get.snackbar(
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

