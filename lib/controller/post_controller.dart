import 'dart:convert';

import 'package:cdio_project/common/api_url.dart';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/model/post/post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  var postInf = Rx<List<Post>>([]);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPost();
  }

  fetchPost() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET',
          Uri.parse(ApiUrl.getAllPost));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          postInf.value = jsonData.map((item) => Post.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          postInf.value = [Post.fromJson(jsonData)];
        }

        isLoading.value = false;

        update();

      }
      else {
        print(response.reasonPhrase);
      }

    }catch (e) {

    }
  }
}