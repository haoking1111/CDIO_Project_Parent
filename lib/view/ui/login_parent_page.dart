import 'package:cdio_project/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginParentPage extends StatefulWidget {
  const LoginParentPage({super.key});

  @override
  State<LoginParentPage> createState() => _LoginParentPageState();
}

class _LoginParentPageState extends State<LoginParentPage> {

  bool isLoading = false;

  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  static final Future<SharedPreferences> _preferences =
  SharedPreferences.getInstance();

  loginUserNow() async {
    try {
      await AuthController.login(
          phoneNumberController.text.trim(), passwordController.text.trim());
    } catch (e) {
      print('error: ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 550,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/backgroundLogin.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          height: 300,
                          width: 290,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/imageLogin.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          height: 390,
                          width: 330,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 6,
                                    blurRadius: 10,
                                    offset: const Offset(0, 2))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Chào Bố Mẹ !',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.lightBlue[300],
                                    fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              //textfield tài khoản
                              Container(
                                width: 280,
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    hintText: 'Số Điện Thoại',
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    fillColor: Colors.cyan[200],
                                    filled: true,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              //textfield pass
                              Obx(
                                () {
                                  return Container(
                                    width: 280,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(12)),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.teal),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        hintText: 'Mật Khẩu',
                                        hintStyle:
                                            const TextStyle(color: Colors.white),
                                        fillColor: Colors.cyan[200],
                                        filled: true,

                                        //icon visibility
                                        suffixIcon: Obx(() {
                                          return GestureDetector(
                                              onTap: () {
                                                isObsecure.value =
                                                    !isObsecure.value;
                                              },
                                              child: Icon(
                                                isObsecure.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Colors.white,
                                              ));
                                        }),
                                      ),
                                      obscureText: isObsecure.value,
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              //quên mật khẩu
                              GestureDetector(
                                onTap: () {
                                  print('tap');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Quên mật khẩu?',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue[300]),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 30,
                              ),

                              //button login
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading =
                                        true; // Set loading state to true before login call
                                  });
                                  Future.delayed(
                                    Duration(seconds: 1),
                                    () {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                  );

                                  await loginUserNow(); // Call login function
                                },
                                child: Container(
                                  height: 45,
                                  width: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[300],
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.lightBlue.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: const Offset(0, 2))
                                    ],
                                  ),
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      // Adjust animation duration as needed
                                      transitionBuilder: (widget, animation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: widget,
                                        );
                                      },
                                      child: isLoading
                                          ? CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              'Đăng Nhập',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                    ),
                                  ),
                                ),
                              ),

                              //text nhấp vào đây
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
