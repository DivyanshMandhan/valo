// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/widgets/rank_screen/ranks_card.dart';

class RanksList extends StatelessWidget {
  RanksList({Key? key, required this.snapshot}) : super(key: key);
  var snapshot;

  @override
  Widget build(BuildContext context) {
    // Waiting
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
          // Circular Progress Bar
          child: SizedBox(
              height: 100.h,
              width: 50.w,
              child: const CircularProgressIndicator()));
      // Done
    } else if (snapshot.connectionState == ConnectionState.done) {
      // Done but has error
      if (snapshot.hasError) {
        return const Text('Error');

        // Done and data
      } else if (snapshot.hasData) {
        return Flexible(
          // Gridview builder
          child: GridView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              // Gridview padding
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),

              // Burda - 3 deme sebebim ; Asagida da 3 index onden baslattigimiz icin burda da 3 index onden baslatmazsak
              // range hatasi aliriz bu yuzden burda ki lenght den de 3 cikardim
              itemCount: snapshot.data!.toList()[3].tiers!.length - 3,
              itemBuilder: (context, index) {
                return RanksCard(snapshot: snapshot, index: index);
              }),
        );

        // Empty Data
      } else {
        return const Center(child: Text('Empty data'));
      }

      // For debug
    } else {
      return Text('State: ${snapshot.connectionState}');
    }
  }
}
