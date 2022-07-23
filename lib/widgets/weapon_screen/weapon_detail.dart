// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/widgets/weapon_screen/weapon_detail/weapon_info.dart';
import 'package:valo/widgets/weapon_screen/weapon_detail/weapon_section_one.dart';
import 'package:valo/widgets/weapon_screen/weapon_detail/weapon_section_two.dart';

import '../../models/weapon.dart';

class WeaponDetail extends StatelessWidget {
  WeaponDetail({Key? key, required this.weapon}) : super(key: key);
  Weapon weapon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 30.h),
      child: Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                WeaponInfo(weapon: weapon),
                WeaponSectionOne(
                  weapon: weapon,
                  deviceInfo: constraints.maxHeight.round(),
                ),
                WeaponSectionTwo(
                  weapon: weapon,
                  deviceInfo: constraints.maxHeight.round(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
