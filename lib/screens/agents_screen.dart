import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/constants/app_colors.dart';
import 'package:valo/network/agent_client.dart';
import 'package:valo/widgets/agents_screen/Agent/agent_list.dart';

import '../models/agent.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  // Agent Client
  final AgentClient _agentClient = AgentClient();
  // Agents List
  late Future<Iterable<Agent>> agents;

  // Selected Filter Index
  int selectedFilterIndex = 0;
  // Agent Filter List
  var agentFilters = [
    'All',
    'Duelist',
    'Sentinel',
    'Initiator',
    'Controller',
  ];

  // Filtred Agents
  late Iterable<Agent> filtredAgentList;

  @override
  void initState() {
    // Agent list
    agents = _agentClient.getAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 13.w),
              child: const Text(
                'Agents',
                style: TextStyle(
                    color: white, fontSize: 30, fontFamily: 'Valorant'),
                textAlign: TextAlign.start,
              ),
            ),

            // Agent Filters
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: agentFilters.length,
                itemBuilder: (context, index) {
                  return LayoutBuilder(builder: (context, constraints) {
                    return Padding(
                      padding: EdgeInsets.all(Platform.isAndroid
                          ? 8.w
                          :
                          // iPhone 7 - 38 and iPhone 5S - SE 1. Gen - 32
                          constraints.maxHeight.round() == 38 ||
                                  constraints.maxHeight.round() == 32
                              ? 7.h
                              :
                              // Others
                              10.w),
                      // Gesture detector for index update
                      child: GestureDetector(
                        onTap: () {
                          if (agentFilters[index].toLowerCase() == 'all') {
                            setState(() {
                              agents = _agentClient.getAgents();
                              selectedFilterIndex = index;
                            });
                          } else {
                            setState(() {
                              agents = _agentClient.getAgents(
                                  agentRole: agentFilters[index]);
                              selectedFilterIndex = index;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // If box selected bg color red and text color white
                              // If box unselected bg color white and text color black
                              color: selectedFilterIndex == index
                                  ? CupertinoColors.systemRed
                                  : CupertinoColors.white),
                          width: 100.w,
                          alignment: Alignment.center,
                          child: Text(
                            agentFilters[index],
                            style: TextStyle(
                                color: selectedFilterIndex == index
                                    ? white
                                    : black,
                                fontFamily: 'Valorant',
                                fontSize: 10.5.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            // Agents
            Expanded(
              flex: 13,
              child: FutureBuilder<Iterable<Agent>>(
                future: agents,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Iterable<Agent>> snapshot,
                ) {
                  return AgentList(
                    snapshot: snapshot,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
