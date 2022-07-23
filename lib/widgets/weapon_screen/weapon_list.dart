// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/widgets/weapon_screen/weapon_card.dart';

class WeaponsList extends StatelessWidget {
  WeaponsList({Key? key, required this.snapshot}) : super(key: key);
  var snapshot;
  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
          child: SizedBox(
              height: 100.h,
              width: 50.w,
              child: const CircularProgressIndicator()));
    } else if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return const Text('Error');
      } else if (snapshot.hasData) {
        return Expanded(
          child: GridView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: snapshot.data!.length - 1,
              itemBuilder: (context, index) {
                var data = snapshot.data!.toList();
                return WeaponCard(weapon: data[index]);
              }),
        );
      } else {
        return const Text('Empty data');
      }
    } else {
      return Text('State: ${snapshot.connectionState}');
    }
  }
}
