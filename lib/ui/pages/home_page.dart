import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_translator/custom/custom_widget.dart';
import 'package:language_translator/ui/pages/services/dicsonary.dart';
import 'package:language_translator/ui/pages/services/translator.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        backgroundColor: const Color.fromARGB(225, 255, 255, 255),
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
                },
                "images/translator.png"
                ),
                ReusableMethod().myButton(
                  "Dicsonary", 
                  () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyDicsonary()));
                },
                "images/dictionary.png"
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
