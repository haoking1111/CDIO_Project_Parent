import 'dart:convert';
import 'package:cdio_project/common/toast.dart';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';
import '../model/parent/parent_model.dart';

class ParentController extends GetxController {
  var parent = Parent().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchParent();
  }

  fetchParent() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${ApiUrl.getParentUrl}/${await AuthController.readUserId()}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read data from response
        final data = await response.stream.bytesToString();
        // Decode JSON into a Map<String, dynamic>
        Map<String, dynamic> jsonData = jsonDecode(data);
        final parentData = Parent.fromJson(jsonData);

        // Lưu dữ liệu vào biến parent
        parent.value = parentData;

        isLoading.value = false;

        update();

      } else {
         Get.snackbar('Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    } catch (e) {
      showToast(message: 'Error');
    }
  }

  updateParent(String fullNameController, String phoneNumberController, String emailController,
      String addressController) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await AuthController.readToken()}'
    };
    var request = http.Request(
        'PUT',
        Uri.parse(
            '${ApiUrl.updateParentInfUrl}/${await AuthController.readUserId()}'));

    request.body = json.encode({
      "fullName": fullNameController,
      "phoneNumber": phoneNumberController,
      "email": addressController,
      "address": emailController
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      Future.delayed(const Duration(seconds: 1),() {
        // Call Getx to update the parent data and reload the page
        Get.find<ParentController>().fetchParent();
        Get.back();
        showToast(message: 'Cập nhật thông tin thành công');
      },
      );
    } else {
      // print(response.reasonPhrase);
    }
  }
}
