import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorScreen extends StatelessWidget {
  const CustomErrorScreen({Key? key, required this.errorDetails})
      : super(key: key);
  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorDetails.summary.toString(),
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
