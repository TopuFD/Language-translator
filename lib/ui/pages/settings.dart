import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_translator/ui/bottom_navigation.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Column(
                  children: [
                    Image.asset("images/settings.png"),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Translator",
                      style: TextStyle(
                          fontSize: 40.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2.h,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                      leading: const Icon(
                        Icons.home,
                      ),
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                          
                        },
                        child: const Text("Home"),
                      )),
                  const ListTile(
                    leading: Icon(Icons.color_lens),
                    title: Text("Theme"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.update),
                    title: Text("Updates"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.message),
                    title: Text("Feedback"),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    title: Text("Reviews"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.lock),
                    title: Text("Privacy Pollicy"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.question_mark),
                    title: Text("Helps"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
