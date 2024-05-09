
import 'package:cdio_project/view/ui/post_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsTeacherPage extends StatefulWidget {
  const CommentsTeacherPage({super.key});

  @override
  State<CommentsTeacherPage> createState() => _CommentsTeacherPageState();
}

class _CommentsTeacherPageState extends State<CommentsTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.black,),
                  ),
        
                  Expanded(child: Container()),
                  
                  const Icon(Icons.notifications_active_outlined)
                ],
              ),
        
              const SizedBox(height: 15,),
        
              const Divider(color: Colors.grey,),
        
              const SizedBox(height: 10,),
              //infor
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //img
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(image: AssetImage('assets/images/teacher.png'), fit: BoxFit.cover)
                    ),
                  ),
        
                  const SizedBox(width: 15,),
        
        
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // name
                      Row(
                        children: [
                          Text(
                            'Giáo Viên: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Nguyễn Thị Ngọc',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
        
                      SizedBox(
                        height: 10,
                      ),
        
                      //Class
                      Row(
                        children: [
                          Text(
                            'Chủ Nhiệm: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Chồi Non',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
        
              const SizedBox(height: 10,),
        
              const Divider(color: Colors.grey,),
        
              const SizedBox(height: 20,),
        
        
              // atititude
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2))
                      ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 90,
                        width: 90,
                        child: Image(image: AssetImage('assets/images/attitude.png')),
                      ),
        
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Thái Độ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
        
                          SizedBox(height: 5,),
        
                          Text(
                            'Nhiệt tình',
                            style: TextStyle(
                                fontSize: 15,
                            ),
                          ),
        
                          SizedBox(height: 5,),
        
                          Row(
                            children: [
                              Text(
                                'Điểm: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
        
                              Text(
                                '10',
                                style: TextStyle(
                                    fontSize: 16,
                                ),
                              ),
                            ],
                          )
        
        
                        ],
                      ),
                      Expanded(child: Container()),
        
                      Column(
                        children: [
                          Text(
                            'x',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.5)
                            ),
                          ),
        
                          Expanded(child: Container()),
        
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, right: 20),
                            child: Text(
                              'Gửi',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.teal[300],
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 20),
        
              //idea
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2))
                      ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 90,
                        width: 90,
                        child: Image(image: AssetImage('assets/images/idea.png')),
                      ),
        
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Thái Độ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
        
                          SizedBox(height: 5,),
        
                          Text(
                            'Nhiệt tình',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
        
                          SizedBox(height: 5,),
        
                          Row(
                            children: [
                              Text(
                                'Điểm: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
        
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
        
        
                        ],
                      ),
                      Expanded(child: Container()),
        
                      Column(
                        children: [
                          Text(
                            'x',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.5)
                            ),
                          ),
        
                          Expanded(child: Container()),
        
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, right: 20),
                            child: Text(
                              'Gửi',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.teal[300],
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 20),
        
              //other
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2))
                      ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 90,
                        width: 90,
                        child: Image(image: AssetImage('assets/images/other.png')),
                      ),
        
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Thái Độ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
        
                          SizedBox(height: 5,),
        
                          Text(
                            'Nhiệt tình',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
        
                          SizedBox(height: 5,),
        
                          Row(
                            children: [
                              Text(
                                'Điểm: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
        
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
        
        
                        ],
                      ),
                      Expanded(child: Container()),
        
                      Column(
                        children: [
                          Text(
                            'x',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.5)
                            ),
                          ),
        
                          Expanded(child: Container()),
        
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, right: 20),
                            child: Text(
                              'Gửi',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.teal[300],
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 20,),
        
              //post
              Row(
                children: [
                  const Text(
                    'Bài viết',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> const PostPage());
                    },
                    child:  const Text(
                      'Xem tất cả',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
        
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[500],
                      ),
                      child: const Text(
                        'Montess',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
        
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                      ),
                      child: const Text(
                        'Từ 1 đến 3 tuổi',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
        
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                      ),
                      child: const Text(
                        'Cách ăn uống',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                      ),
                      child: const Text(
                        'Bé tập đi',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(
                height: 10,
              ),
        
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 310,
                            height: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/montess.png'),
                                  fit: BoxFit.fill),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Mon',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'tess',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.forward),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Cho bé từ',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          'nhỏ đến lớn',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                        ),
        
                        Container(
                          height: 25,
                          width: 310,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 6,
                                    offset: const Offset(0, 2))
                              ],
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.teal[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Phương pháp Montess',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
        
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Xem chi tiết',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
        
                            ],
                          ),
                        )
                      ],
                    ),
        
                    const SizedBox(
                      width: 15,
                    ),
        
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 310,
                            height: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/support1.png'),
                                  fit: BoxFit.fill),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Ăn',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'uống',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.forward),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Cho bé từ',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          '1 đến 3 tuổi',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                        ),
        
                        Container(
                          height: 25,
                          width: 310,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 6,
                                    offset: const Offset(0, 2))
                              ],
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.teal[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Cách ăn uống',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
        
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Xem chi tiết',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
        
                            ],
                          ),
                        )
                      ],
                    ),
        
                    const SizedBox(
                      width: 15,
                    ),
        
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 310,
                            height: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/montess.png'),
                                  fit: BoxFit.fill),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Mon',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'tess',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.forward),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Cho bé từ',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          'nhỏ đến lớn',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                        ),
        
                        Container(
                          height: 25,
                          width: 310,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 6,
                                    offset: const Offset(0, 2))
                              ],
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.teal[400],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Phương pháp Montess',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
        
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Xem chi tiết',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
        
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
