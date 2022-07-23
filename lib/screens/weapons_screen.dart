import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/models/weapon.dart';
import 'package:valo/network/weapon_client.dart';
import 'package:valo/widgets/weapon_screen/weapon_list.dart';

import '../constants/app_colors.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({Key? key}) : super(key: key);

  @override
  State<WeaponScreen> createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> {
  // Weapons Client
  final WeaponsClient _weaponsClient = WeaponsClient();

  // Weapons List
  late Future<Iterable<Weapon>> _weapons;
  @override
  void initState() {
    _weapons = _weaponsClient.getWeapons();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Weapons',
              style: TextStyle(
                  color: white, fontFamily: 'Valorant', fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<Iterable<Weapon>>(
              future: _weapons,
              builder: (
                BuildContext context,
                AsyncSnapshot<Iterable<Weapon>> snapshot,
              ) {
                return WeaponsList(snapshot: snapshot);
              },
            ),
          ],
        ),
      ),
    );
  }
}
