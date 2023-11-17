import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_translator/ui/custom/custom_widget.dart';
import 'package:language_translator/ui/pages/services/dicsonary.dart';
import 'package:language_translator/ui/pages/services/scanner.dart';
import 'package:language_translator/ui/pages/services/translator.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ReusableMethod().myButton("Translator", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Translator()));
              }),
              ReusableMethod().myButton("Dicsonary", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyDicsonary()));
              }),
            ]),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyScanner()));
              },
              child: Container(
                height: 150.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    gradient:const LinearGradient(
                        colors: [Colors.yellow, Colors.green, Colors.blue]),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Icon(
                  Icons.document_scanner,
                  size: 70.sp,
                  color: Colors.white,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
