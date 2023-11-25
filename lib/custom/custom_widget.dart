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
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0.sp);
  }

  myButton(String btnName, ontap,link) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 8,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 20.h),
            child: Column(
              children: [
                Image.asset(link,height: 80.h,width: 80.w,),
                Text(
                  btnName,
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
