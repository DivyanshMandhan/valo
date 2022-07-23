// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/constants/app_colors.dart';

import '../../../models/agent.dart';

class AgentInfo extends StatelessWidget {
  AgentInfo({Key? key, required this.agent}) : super(key: key);
  Agent agent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        agentImage(),
        agentBio(),
      ],
    );
  }

  Padding agentBio() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            agent.description!,
            style: TextStyle(color: white, fontSize: 14.5.sp),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Stack agentImage() {
    return Stack(alignment: Alignment.bottomLeft, children: [
      Column(
        children: [
          Hero(
              tag: agent,
              child: CachedNetworkImage(imageUrl: agent.fullPortraitV2!))
        ],
      ),
      Positioned(
        left: 15.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              agent.displayName!,
              style: TextStyle(
                  fontFamily: 'Valorant',
                  color: white,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CachedNetworkImage(
                  imageUrl: agent.role!.displayIcon!,
                  width: 12.5.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Text(
                    agent.role!.displayName!,
                    style: TextStyle(
                        fontFamily: 'Valorant', color: white, fontSize: 11.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
