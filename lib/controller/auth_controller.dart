import 'dart:convert';
import 'package:cdio_project/common/api_url.dart';
import 'package:cdio_project/common/toast.dart';
import 'package:cdio_project/view/ui/dashboard_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/user/user_model.dart';

class AuthController extends GetxController {

  static final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

  static Future<void> login(String phoneNumberOrEmail, String password) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiUrl.authUrl));
      request.body = json.encode(
          {"phoneNumberOrEmail": phoneNumberOrEmail, "password": password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Đọc dữ liệu từ response
        final data = await response.stream.bytesToString();

        print(data);
        // Giải mã JSON thành một đối tượng Map<String, dynamic>
        Map<String, dynamic> jsonData = jsonDecode(data);

        final userInfor = User.fromJson(jsonData);

        await saveToken(userInfor.accessToken);
        await saveUserId(userInfor.userId.toString());

        print(await readUserId());
        print(await readToken());

        Future.delayed(Duration(seconds: 1),() {
          Get.to(()=>DashBoardPage());
          showToast(message: 'Chúc mừng bạn đã đăng nhập thành công');
        },
        );

      } else {
        print('Sai tai khoan or mat khau');
        Future.delayed(Duration(seconds: 1),() {
          showToast(message: 'Sai tai khoan hoac mat khau');
        });
      }
    } catch (e) {
      print('error: ' + e.toString());
    }
  }

  // Phương thức để lưu token vào SharedPreferences
  static Future<void> saveToken(String? token) async {
    if (token != null) {
      final prefs = await _preferences;
      prefs.setString('token', token);
    }
  }

  // Phương thức để lưu userId vào SharedPreferences
  static Future<void> saveUserId(String? token) async {
    if (token != null) {
      final prefs = await _preferences;
      prefs.setString('userId', token);
    }
  }

  // Phương thức để đọc token từ SharedPreferences
  static Future<String?> readToken() async {
    return await _preferences.then((prefs) => prefs.getString('token'));
  }

  // Phương thức để đọc token từ SharedPreferences
  static Future<String?> readUserId() async {
    return await _preferences.then((prefs) => prefs.getString('userId'));
  }

  //Phuong thuc remove
  static Future<void> removeTokkenUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
    await preferences.remove('userId');
  }
}
