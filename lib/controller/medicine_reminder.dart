import 'dart:convert';

import 'package:cdio_project/controller/child_controller.dart';
import 'package:cdio_project/model/child/child_model.dart';
import 'package:cdio_project/model/medicine/medicine_reminder_model.dart';
import 'package:get/get.dart';
import '../common/api_url.dart';
import 'auth_controller.dart';
import 'package:http/http.dart' as http;

class MedicineReminderController extends GetxController {
  final Rx<MedicineReminder?> medicineReminder = Rx(null); // Observable for MedicineReminder object
  var isLoading = true.obs;

  final ChildController childController = Get.find<ChildController>();

  @override
  void onInit() {
    super.onInit();
    fetchMedicineReminder();
  }

  fetchMedicineReminder() async {
    // Đợi cho hoạt động lấy thông tin trẻ em hoàn thành trước
    await childController.fetchChild();

    Child child = childController.child.value;
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiUrl.getMedicineReminder}/${child.id}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Parse JSON data
        final data = await response.stream.bytesToString();
        Map<String, dynamic> jsonData = jsonDecode(data);

        // Create a new MedicineReminder instance from the parsed data
        final medicineReminderData = MedicineReminder(
          id: jsonData['id'] as int,
          comment: jsonData['comment'] as String,
          currentStatus: jsonData['currentStatus'] as String,
          childId: jsonData['childId'] as int,
          // createdDate: DateTime(
          //   jsonData['createdDate'][0] as int, // Year
          //   jsonData['createdDate'][1] as int, // Month
          //   jsonData['createdDate'][2] as int, // Day
          //   jsonData['createdDate'][3] as int, // Hour
          //   jsonData['createdDate'][4] as int, // Minute
          //   jsonData['createdDate'][5] as int, // Second
          // ),
        );

        // Assign the new MedicineReminder object to the observable
        medicineReminder.value = medicineReminderData;
        print(medicineReminderData.id); // Output: 3
        print(medicineReminderData.comment); // Output: Uong nhieu hon
        print(medicineReminderData.createdDate); // Output: DateTime object representing the date

        isLoading.value = false;


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