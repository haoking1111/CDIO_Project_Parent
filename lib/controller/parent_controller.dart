
import 'dart:convert';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';
import '../model/parent/parent_model.dart';

class ParentController extends GetxController{
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
          'GET', Uri.parse('${ApiUrl.getParentUrl}/${await AuthController.readUserId()}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read data from response
        final data = await response.stream.bytesToString();
        // Decode JSON into a Map<String, dynamic>
        Map<String, dynamic> jsonData = jsonDecode(data);
        final parentData = await Parent.fromJson(jsonData);



        // Lưu dữ liệu vào biến parent
        parent.value = parentData;

        isLoading.value = false;

        update();

        print(parent.value.fullName);
        print(parent.value.phoneNumber);
        print(parent.value.email);


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
