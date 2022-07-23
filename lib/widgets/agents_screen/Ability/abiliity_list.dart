// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/constants/app_colors.dart';
import 'package:valo/models/agent.dart';
import 'package:valo/widgets/agents_screen/Ability/abilities_card.dart';

class AbiliityList extends StatefulWidget {
  AbiliityList({Key? key, required this.abilityList}) : super(key: key);
  List<Abilities> abilityList;

  @override
  State<AbiliityList> createState() => _AbiliityListState();
}

class _AbiliityListState extends State<AbiliityList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 30.h),
      child: Column(
        children: [
          const Text(
            'ABILITIES',
            style:
                TextStyle(fontFamily: 'Valorant', color: white, fontSize: 20),
          ),
          SizedBox(
            height: 70.h,
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              scrollDirection: Axis.horizontal,
              itemCount: widget.abilityList.length,
              itemBuilder: (BuildContext context, int index) {
                // Abilities Card
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Update selected Index
                      selectedIndex = index;
                    });
                  },
                  child: AbilitiesCard(
                      agentAbilities: widget.abilityList[index],
                      abilitiesLenght: widget.abilityList.length,
                      selected: selectedIndex == index ? true : false),
                );
              },
            ),
          ),

          // For top padding
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onHorizontalDragEnd: (dragEndDetails) {
                if (dragEndDetails.primaryVelocity! < 0) {
                  // Swipe Left //

                  // Abilities lenght = 4 fakat sacma bir bug oldugundan bir eksigine
                  // esitledim suanlik boyle sorun yok gibi
                  selectedIndex < widget.abilityList.length - 1
                      ? setState(() {
                          selectedIndex += 1;
                        })
                      : print('abilities index error');
                } else if (dragEndDetails.primaryVelocity! > 0) {
                  // Swipe Right //
                  selectedIndex < widget.abilityList.length
                      ? setState(() {
                          selectedIndex != 0
                              ? selectedIndex -= 1
                              : selectedIndex = selectedIndex;
                        })
                      : print('abilities index error');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey,
                    borderRadius: BorderRadius.circular(10)),
                width: 1.sw,
                height: 0.25.sh,
                //padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ability name and ability button
                      Text(
                        '${widget.abilityList[selectedIndex].slot! == 'Ability1' ? 'Q - ' : widget.abilityList[selectedIndex].slot == 'Ability2' ? 'E - ' : widget.abilityList[selectedIndex].slot == 'Grenade' ? 'C - ' : widget.abilityList[selectedIndex].slot == 'Ultimate' ? 'X - ' : 'Passive - '}${widget.abilityList[selectedIndex].displayName!}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        widget.abilityList[selectedIndex].description!,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
