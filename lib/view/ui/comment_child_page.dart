import 'package:flutter/material.dart';

class CommentChildPage extends StatefulWidget {
  const CommentChildPage({super.key});

  @override
  State<CommentChildPage> createState() => _CommentChildPageState();
}

class _CommentChildPageState extends State<CommentChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nhận Xét Của Bé', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(

        ),
      ),
    );
  }
}
