import 'package:flutter/material.dart';
import 'package:relate/models/log.dart';
import 'package:relate/pagewiews/logs/widgets/floating_column.dart';
import 'package:relate/pagewiews/logs/widgets/log_list_container.dart';
import 'package:relate/resources/local_db/repository/log_repository.dart';
import 'package:relate/screens/callscreens/pickup/pickup_layout.dart';
import 'package:relate/utils/variables.dart';
import 'package:relate/widgets/mAppbar.dart';

class LogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return PickupLayout(
        scaffold: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                  // width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Calls",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            ///maybe add a search option here
                          ],
                        ),
                      ),
                      SizedBox(height: 15),

                    ],
                  ),
                ),
                LogListContainer(),
              ],
            ),
          ),
        ),
    );

  }
  //   return PickupLayout(
  //     scaffold: Scaffold(
  //       // backgroundColor: Variables.blackColor,
  //       backgroundColor: Colors.transparent,
  //       appBar: MAppbar(
  //         title: "Calls",
  //         actions: <Widget>[
  //           IconButton(
  //             icon: Icon(
  //               Icons.search,
  //               color: Colors.white,
  //             ),
  //             onPressed: () => Navigator.pushNamed(context, "/search_screen"),
  //           ),
  //         ],
  //       ),
  //       floatingActionButton: FloatingColumn(),
  //       body: Padding(
  //         padding: EdgeInsets.only(left: 15),
  //         child: LogListContainer(),
  //       ),
  //     ),
  //   );
  // }
}