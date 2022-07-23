import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/models/map.dart';
import 'package:valo/network/maps_client.dart';
import 'package:valo/widgets/maps_screen/maps_list.dart';

import '../constants/app_colors.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  MapsClient mapsClient = MapsClient();

  late Future<Iterable<Maps>> maps;
  @override
  void initState() {
    maps = mapsClient.getlAllMaps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.only(top: 50.h),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Maps',
              style: TextStyle(
                  color: white, fontFamily: 'Valorant', fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: FutureBuilder<Iterable<Maps>>(
                    future: maps,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<Iterable<Maps>> snapshot,
                    ) {
                      return MapsList(snapshot: snapshot);
                    }))
          ],
        ),
      ),
    ));
  }
}
