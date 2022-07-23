import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.isNetworkError, this.errorDetails})
      : super(key: key);
  final bool isNetworkError;
  final FlutterErrorDetails? errorDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'app_icon/android_icon.png',
              scale: 3,
            ),
            Text(
              'Something went wrong',
              style: TextStyle(color: white, fontSize: 22.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            isNetworkError
                ? Text('Please check your internet connection',
                    style: TextStyle(color: white, fontSize: 15.sp))
                : Text(
                    'Please restart the Application',
                    style: TextStyle(color: white, fontSize: 15.sp),
              textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}
