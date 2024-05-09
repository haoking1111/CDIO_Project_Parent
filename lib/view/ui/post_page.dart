import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
              child: Row(
                children: [
                  //icon back
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      )),

                  //search
                  Container(
                    width: 260,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          //icon search
                          Icon(
                              Icons.search_outlined,
                              size: 20,
                              color: Colors.black
                          ),

                          //text
                          Text(
                            'Tìm Kiếm',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(child: Container()),

                  //Icon notifi
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        size: 25,
                        color: Colors.teal[400],
                      )
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: const BoxDecoration(
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.
                      filter_alt_rounded, color: Colors.teal[400],),
                    ),

                    const Text(
                      '|',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    const SizedBox(width: 10,),

                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Phổ biến',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),

                            Icon(Icons.keyboard_arrow_down_outlined, size: 20,)
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Ngày',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),

                            Icon(Icons.keyboard_arrow_down_outlined, size: 20,)
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Loại',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),

                            Icon(Icons.keyboard_arrow_down_outlined, size: 20,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(color: Colors.black,),

            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(image: AssetImage('assets/images/album2.png'), fit: BoxFit.cover)
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only( top: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)
                                        ),
                                        color: Colors.teal[300]
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Center(
                                          child: Text(
                                            'Phổ Biến',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(Icons.ios_share, size: 15, color: Colors.teal[400])
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const Text(
                        'Cách dỗ trẻ trong ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const Text(
                        '7 phút cho bố mẹ trẻ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            'Ngày: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Text(
                            '17/04/2024',
                            style: TextStyle(
                                fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal[300]
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage('assets/images/post1.png'), fit: BoxFit.cover)
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only( top: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15)
                                          ),
                                          color: Colors.teal[300]
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Center(
                                          child: Text(
                                            'Phổ Biến',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(Icons.ios_share, size: 15, color: Colors.teal[400])
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const Text(
                        'Không phải bố mẹ ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const Text(
                        'nào cũng biết...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            'Ngày: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Text(
                            '16/04/2024',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal[300]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage('assets/images/post2.png'), fit: BoxFit.cover)
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only( top: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15)
                                          ),
                                          color: Colors.teal[300]
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Center(
                                          child: Text(
                                            'Phổ Biến',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(Icons.ios_share, size: 15, color: Colors.teal[400])
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const Text(
                        'Trẻ không năng động, ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const Text(
                        'chậm chạp lý do vì...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            'Ngày: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Text(
                            '15/04/2024',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal[300]
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage('assets/images/post3.png'), fit: BoxFit.cover)
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only( top: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15)
                                          ),
                                          color: Colors.teal[300]
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Center(
                                          child: Text(
                                            'Phổ Biến',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(Icons.ios_share, size: 15, color: Colors.teal[400])
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const Text(
                        'Cùng vui hè với các bé ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const Text(
                        'trong dịp hè này...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            'Ngày: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Text(
                            '14/04/2024',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal[300]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage('assets/images/imageinfor.png'), fit: BoxFit.cover)
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only( top: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15)
                                          ),
                                          color: Colors.teal[300]
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Center(
                                          child: Text(
                                            'Phổ Biến',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(Icons.ios_share, size: 15, color: Colors.teal[400])
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const Text(
                        'Những hình ảnh, ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const Text(
                        'đáng yêu của trẻ trong...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            'Ngày: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Text(
                            '17/04/2004',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal[300]
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage('assets/images/teacher.png'), fit: BoxFit.cover)
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only( top: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15)
                                          ),
                                          color: Colors.teal[300]
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Center(
                                          child: Text(
                                            'Phổ Biến',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: Icon(Icons.ios_share, size: 15, color: Colors.teal[400])
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const Text(
                        'Giáo viên đạt giải ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const Text(
                        'hoa khôi mùa xuân...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      Row(
                        children: [
                          const Text(
                            'Ngày: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Text(
                            '17/04/2004',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal[300]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
