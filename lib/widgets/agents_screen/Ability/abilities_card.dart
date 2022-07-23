// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/constants/app_colors.dart';
import 'package:valo/models/agent.dart';

class AbilitiesCard extends StatelessWidget {
  AbilitiesCard(
      {Key? key,
      required this.agentAbilities,
      required this.abilitiesLenght,
      required this.selected})
      : super(key: key);
  Abilities agentAbilities;
  int abilitiesLenght;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: abilitiesLenght ==
                  5 /*for jett cause shes have 5 abilities */ ? 10.w
              : 16.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? Colors.red : Colors.transparent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Image.network(
            agentAbilities.displayIcon ??
                'https://cdn-icons-png.flaticon.com/512/876/876215.png',
            color: white,
            width: 40.w,
          ),
        ),
      ),
    );
  }
}
