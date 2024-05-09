import 'package:flutter/material.dart';

class ParentUpdatePage extends StatefulWidget {
  const ParentUpdatePage({super.key});

  @override
  State<ParentUpdatePage> createState() => _ParentUpdatePageState();
}

class _ParentUpdatePageState extends State<ParentUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.teal[700],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(20)
          )
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
