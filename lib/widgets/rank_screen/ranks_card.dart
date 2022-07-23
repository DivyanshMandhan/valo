// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/app_colors.dart';

class RanksCard extends StatelessWidget {
  RanksCard({Key? key, required this.snapshot, required this.index})
      : super(key: key);
  var snapshot;
  int index;
  @override
  Widget build(BuildContext context) {
    List<String> rankColors = [
      // Iron Rank Color
      '#72787A',
      '#72787A',
      '#72787A',
      // Bronze Rank Color
      '#8C7344',
      '#8C7344',
      '#8C7344',
      // Silver Rank Color
      '#818481',
      '#818481',
      '#818481',
      // Gold Rank Color
      '#E7BD42',
      '#E7BD42',
      '#E7BD42',
      // Platinum Rank Color
      '#39A5B2',
      '#39A5B2',
      '#39A5B2',
      // Diamond Rank Color
      '#D985EA',
      '#D985EA',
      '#D985EA',
      // Immortal Rank Color
      '#BD3D66',
      '#BD3D66',
      '#BD3D66',
      // Radiant Rank Color
      '#F7E19A',
    ];

    var data = snapshot.data!.toList();

    return Padding(
      // Container Size
      padding: EdgeInsets.all(10.w),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: HexColor(rankColors[index]),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            CachedNetworkImage(
                width: 50.w,
                imageUrl: data[3].tiers![index + 3].smallIcon ??
                    'https://via.placeholder.com/150'),
            SizedBox(
              height: 10.h,
            ),
            // Burda index + 3 deme sebebim en basta unranked + 2 tane gereksiz rank geliyordu.
            // Bu gereksizleri onlemek icin + 3 diyerek ana ranklari aldim
            Text(
              snapshot.data!.toList()[3].tiers![index + 3].tierName!,
              style: TextStyle(
                  color:
                      snapshot.data!.toList()[3].tiers![index + 3].tierName! ==
                              'RADIANT'
                          ? black
                          : white,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
