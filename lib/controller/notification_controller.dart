import 'dart:convert';

import 'package:cdio_project/common/api_url.dart';
import 'package:cdio_project/model/notification/notification_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'auth_controller.dart';

class NotificationController extends GetxController {
  var notification = Rx<List<Notification>>([]);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotification();
  }

  fetchNotification() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET',
          Uri.parse(ApiUrl.getNotificationUrl));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();

        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          notification.value = jsonData.map((item) =>
              Notification.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          notification.value = [Notification.fromJson(jsonData)];
        }
        if (notification.value.isNotEmpty) {
          // Access the first element (assuming single entry)
          print(notification.value[0].id);
          print(notification.value[0].content);
          print(notification.value[0].title);
          print(notification.value[0].postDay);
          print(notification.value[0].postMonth);
          print(notification.value[0].postYear);
          print('---------------------');

          print(notification.value[1].id);
          print(notification.value[1].content);
          print(notification.value[1].title);
          print(notification.value[1].postDay);
          print(notification.value[1].postMonth);
          print(notification.value[1].postYear);
        }
        isLoading.value = false;

        update();
      } else {
        await Get.snackbar(
            'Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase
                .toString()}'
        );
      }
    } catch (e) {
      print('error: ' + e.toString());
      // or throw an exception
    }
  }
}