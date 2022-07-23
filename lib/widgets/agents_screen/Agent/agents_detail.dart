// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/widgets/agents_screen/Ability/abiliity_list.dart';

import '../../../models/agent.dart';
import 'agent_info.dart';

class AgentsDetail extends StatefulWidget {
  AgentsDetail({Key? key, required this.agent}) : super(key: key);

  Agent agent;

  @override
  State<AgentsDetail> createState() => _AgentsDetailState();
}

class _AgentsDetailState extends State<AgentsDetail> {
  @override
  Widget build(BuildContext context) {
    // Agent Abilities
    List<Abilities> agentAbilities = [];

    // Model to agent abilities list
    widget.agent.abilities?.forEach((element) {
      agentAbilities.add(element);
    });

    // Scaffold
    return SafeArea(
      minimum: EdgeInsets.only(top: 30.h),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45.h,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AgentInfo(
                agent: widget.agent,
              ),
              AbiliityList(abilityList: agentAbilities),
            ],
          ),
        ),
      ),
    );
  }
}
