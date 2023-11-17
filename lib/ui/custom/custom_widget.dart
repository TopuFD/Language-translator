import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              iconData,
              color: Colors.white,
            )));
  }
}

class ReusableMethod {
  myToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  myButton(String btnName, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 200.h,
        width: 160.w,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.yellow, Colors.green, Colors.blue]),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            btnName,
            style: TextStyle(
                fontSize: 25.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
