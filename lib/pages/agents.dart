

import 'package:agent/models/agent_list.dart';

import 'package:agent/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AgentsPage extends StatefulWidget {
  static const routeName = 'agent';
  const AgentsPage({Key? key}) : super(key: key);

  @override
  _AgentsPageState createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  late Future<List<AgentList>> _futureAgentList;
  //var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<AgentList>>(
        future: _futureAgentList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ผิดพลาด: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futureAgentList = _fetchAgents();
                      });
                    },
                    child: Text('RETRY'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var AgentItem = snapshot.data![index];

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  shadowColor: Colors.black.withOpacity(0.2),
                  color: Colors.white.withOpacity(0.7),
                  child: InkWell(
                    // onTap: () => _handleClickCoin(cryptoItem.key),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Agent : ${AgentItem.displayName} ',
                                          style: GoogleFonts.prompt(
                                              fontSize: 15.0,
                                              color: Colors.green.shade700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }



  @override
  void initState() {
    super.initState();
    _futureAgentList = _fetchAgents();
  }

  Future<List<AgentList>> _fetchAgents() async {
    List list = await Api().fetch('v1/Agents');
    var agent = list.map((item) => AgentList.fromJson(item)).toList();
    return agent;
  }
}
