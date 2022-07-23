// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/models/weapon.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';

class WeaponSectionTwo extends StatelessWidget {
  WeaponSectionTwo({Key? key, required this.weapon, required this.deviceInfo})
      : super(key: key);
  Weapon weapon;
  final deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child:
            // Main Container
            Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: black_second, borderRadius: BorderRadius.circular(20)),

          // Human Body Section
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    // Damage Text
                    Padding(
                      padding: EdgeInsets.only(top: 15.h, right: 150.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'DAMAGE',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            '0-15m',
                            style: TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),

                    // Human Body
                    Padding(
                      padding: EdgeInsets.only(
                          top:
                              // Iphone 5s and se 1.gen
                              deviceInfo == 439
                                  ? 20.h
                                  // Others
                                  : 10.h,
                          left:
                              // Iphone 5s and se 1.gen
                              deviceInfo == 439
                                  ? 60.w
                                  // Others
                                  : 45.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets().human_full,
                            width: Platform.isAndroid
                                ? 85.h
                                :
                                // Iphone 5s and se 1.gen
                                deviceInfo == 439
                                    ? 80.h
                                    // Others
                                    : 90.h,
                          ),
                        ],
                      ),
                    ),

                    // Head Damage
                    Positioned(
                      left: 105.w,
                      child: Row(
                        children: [
                          const Text(
                            '----- ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                const Text(
                                  'HEAD',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  '${double.parse(weapon.weaponStats?.damageRanges?[0].headDamage.toString() ?? '0.0').round()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // Body Damage
                    Positioned(
                      top: 50.h,
                      left: 115.w,
                      child: Row(
                        children: [
                          // Title
                          const Text(
                            '--- ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                const Text(
                                  'BODY',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900),
                                ),
                                // Null Control
                                Text(
                                  '${double.parse(weapon.weaponStats?.damageRanges![0].bodyDamage.toString() ?? '0.0').round()}',
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // Legs Damage
                    Positioned(
                      top: 130.h,
                      left: 115.w,
                      child: Row(
                        children: [
                          const Text(
                            '--- ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                const Text(
                                  'LEGS',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  '${double.parse(weapon.weaponStats?.damageRanges?[0].legDamage.toString() ?? '0.0').round()}',
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                // ===============================================//
                // ===============================================//

                // ALT FIRE SECTION //
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        ' ALT FIRE INFO',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w900,
                            fontSize: 15.sp),
                      ),

                      // Space
                      SizedBox(
                        height: 10.h,
                      ),
                      // Contents
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: white,
                            size: 10.w,
                          ),
                          Text(
                            'Zoom: ${weapon.weaponStats?.adsStats?.zoomMultiplier ?? 0.0}',
                            style: TextStyle(color: white, fontSize: 12.sp),
                          ),
                        ],
                      ),

                      // Space
                      SizedBox(
                        height: 10.h,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: white,
                            size: 10.w,
                          ),
                          Text(
                            'Fire Rate: ${(double.parse(weapon.weaponStats?.adsStats?.fireRate.toString() ?? '0').round() * 10)}%',
                            style: TextStyle(color: white, fontSize: 12.sp),
                          ),
                        ],
                      ),

                      // Space
                      SizedBox(
                        height: 10.h,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: white,
                            size: 10.w,
                          ),
                          Text(
                            'Fire Rate: ${(double.parse(weapon.weaponStats?.adsStats?.runSpeedMultiplier.toString() ?? '0') * 100).round()}%',
                            style: TextStyle(color: white, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
