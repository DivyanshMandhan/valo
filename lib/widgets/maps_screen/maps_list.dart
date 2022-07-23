// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'maps_card.dart';

class MapsList extends StatelessWidget {
  MapsList({Key? key, required this.snapshot}) : super(key: key);
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
        return ListView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.toList();
              return MapsCard(map: data[index]);
            });
      } else {
        return const Text('Empty data');
      }
    } else {
      return Text('State: ${snapshot.connectionState}');
    }
  }
}
