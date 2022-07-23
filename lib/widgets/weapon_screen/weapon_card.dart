// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valo/models/weapon.dart';
import 'package:valo/widgets/weapon_screen/weapon_detail.dart';

class WeaponCard extends StatelessWidget {
  WeaponCard({Key? key, required this.weapon}) : super(key: key);
  Weapon weapon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WeaponDetail(weapon: weapon)));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: Container(
          decoration: BoxDecoration(
            color: HexColor('#F1DAC4'),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // For top padding
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: CachedNetworkImage(
                  imageUrl: weapon.displayIcon!,
                  width:
                      // For Classic
                      weapon.displayName! == 'Classic'
                          ? 120.w
                          :
                          // For Frenzy
                          weapon.displayName == 'Frenzy'
                              ? 110.w
                              :
                              // For odin and Ares
                              weapon.displayName == 'Odin' ||
                                      weapon.displayName == 'Ares'
                                  ? 170.w
                                  :
                                  // Others
                                  150.w,
                ),
              ),

              // Weapon Info Section
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Weapon Name
                    Text(
                      weapon.displayName!.trim(),
                      style: TextStyle(
                          color: HexColor('#0D1927'),
                          fontSize: 20.sp,
                          fontFamily: 'Valorant'),
                    ),
                    // Weapon Category
                    Text(
                      weapon.shopData!.category!,
                      style: TextStyle(
                          color: HexColor('#0D1927'), fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
