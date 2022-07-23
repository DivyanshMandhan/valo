// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/models/weapon.dart';

import '../../../constants/app_colors.dart';

class WeaponInfo extends StatelessWidget {
  WeaponInfo({Key? key, required this.weapon}) : super(key: key);

  Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
          decoration: BoxDecoration(
            color: black_second,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 200.h,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // For top padding
              SizedBox(height: 20.h),

              // Weapon Image
              CachedNetworkImage(height: 100.h, imageUrl: weapon.displayIcon!),

              // Weapon name and price section
              Padding(
                padding: EdgeInsets.only(right: 240.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Weapon Name
                    Text(
                      weapon.displayName!,
                      style: TextStyle(
                          color: white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic),
                    ),

                    // For padding
                    SizedBox(
                      height: 5.h,
                    ),
                    // Weapon Cost Section
                    Container(
                        width: 80.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: CupertinoColors.destructiveRed,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          '${weapon.shopData!.cost}',
                          style: TextStyle(color: white, fontSize: 17.sp),
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
