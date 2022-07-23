// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'agents_card.dart';

class AgentList extends StatelessWidget {
  AgentList({Key? key, required this.snapshot}) : super(key: key);
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
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GridView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2 / 2.4),
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data!.toList();

              // Agent Card
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: AgentsCard(
                  agent: data[index],
                  index: index,
                ),
              );
            },
          ),
        );
      } else {
        return const Text('Empty data');
      }
    } else {
      return Text('State: ${snapshot.connectionState}');
    }
  }
}
