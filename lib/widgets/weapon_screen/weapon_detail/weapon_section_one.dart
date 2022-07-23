// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../models/weapon.dart';

class WeaponSectionOne extends StatelessWidget {
  WeaponSectionOne({Key? key, required this.weapon, required this.deviceInfo})
      : super(key: key);
  final deviceInfo;
  Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          color: black_second,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Column(
            children: [
              // First Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('KILLFEED ICON',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  // For iphone 5s and iphone se gen 1
                                  deviceInfo == 439
                                      ? 12.5.sp
                                      // Others
                                      : 12.5.sp)),
                      SizedBox(
                        height: 5.h,
                      ),
                      CachedNetworkImage(
                        width: weapon.displayName == 'Frenzy' ||
                                weapon.displayName == 'Classic'
                            ? Platform.isAndroid
                                ? 27.w
                                : 40.w
                            : Platform.isAndroid
                                ? 50.w
                                : 70.w,
                        imageUrl: weapon.killStreamIcon ??
                            'https://cdn.iconscout.com/icon/free/png-256/data-not-found-1965034-1662569.png',
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CATEGORY',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  // For iphone 5s and iphone se gen 1
                                  deviceInfo == 439
                                      ? 12.5.sp
                                      // Others
                                      : 12.5.sp)),
                      SizedBox(
                        height: 5.h,
                      ),
                      // I just used substring to get the last part.
                      // Because one thing that comes: "EEquippableCategory::Rifle"
                      Text(
                        weapon.category?.substring(21) ?? 'No Data',
                        style: const TextStyle(color: white),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('WALL DAMAGE',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  // For iphone 5s and iphone se gen 1
                                  deviceInfo == 439
                                      ? 12.5.sp
                                      // Others
                                      : 12.5.sp)),
                      SizedBox(
                        height: 5.h,
                      ),
                      // I just used substring to get the last part.
                      // Because one thing that comes: "EWallPenetrationDisplayType::Low"
                      Text(
                        weapon.weaponStats?.wallPenetration?.substring(29) ??
                            'No Data',
                        style: const TextStyle(color: white),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
              // For space
              SizedBox(
                height: 30.h,
              ),

              // Second Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('FIRE RATE',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  // For iphone 5s and iphone se gen 1
                                  deviceInfo == 439
                                      ? 12.5.sp
                                      // Others
                                      : 12.5.sp)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${weapon.weaponStats?.fireRate ?? 'No Data'} / Sec',
                        style: TextStyle(
                            color: white,
                            fontSize:
                                // For iphone 5s and iphone se gen 1
                                deviceInfo == 439
                                    ? 12.5.sp
                                    // Others
                                    : 12.5.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 50.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('RELOAD SPEED',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  // For iphone 5s and iphone se gen 1
                                  deviceInfo == 439
                                      ? 12.5.sp
                                      // Others
                                      : 12.5.sp)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${weapon.weaponStats?.reloadTimeSeconds ?? 'No Data'} / Sec',
                        style: TextStyle(
                            color: white,
                            fontSize:
                                // For iphone 5s and iphone se gen 1
                                deviceInfo == 439
                                    ? 12.5.sp
                                    // Others
                                    : 12.5.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MAGAZINE SIZE',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  // For iphone 5s and iphone se gen 1
                                  deviceInfo == 439
                                      ? 10.5.sp
                                      // Others
                                      : 11.5.sp)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${weapon.weaponStats?.magazineSize ?? 'No Data'}',
                        style: TextStyle(
                            color: white,
                            fontSize:
                                // For iphone 5s and iphone se gen 1
                                deviceInfo == 439
                                    ? 12.5.sp
                                    // Others
                                    : 13.5.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
