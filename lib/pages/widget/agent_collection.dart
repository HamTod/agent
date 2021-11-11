import 'package:agent/models/agent_list.dart';
import 'package:agent/services/api.dart';
import 'package:flutter/material.dart';

class AgentListButton extends StatelessWidget{
  final AgentList agent;
  final Function()? onClick;

  const AgentListButton({Key? key,
  required this.agent,
  required this.onClick,}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 32.0),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(18.0),
          childAspectRatio: 10.0 / 10.0,
          children: new List<Widget>.generate(
            17,
                (index) {
              return new GridTile(
                child: new Card(
                    color: Colors.blue.shade200,
                    child: new Center(

                       child: new Text('${agent.displayName}'),

                    )),
              );
            },
          ),
        ),

    );
  }



}