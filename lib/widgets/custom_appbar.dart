import 'package:flutter/material.dart';
import 'package:relate/utils/variables.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  const CustomAppBar(
      {Key key,
       @required this.title,
       @required this.actions,
       @required this.leading,
       @required this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        // color: Variables.blackColor,
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            // color: Variables.separatorColor,
            color: Colors.black26,
            width: 1,
            style: BorderStyle.solid,
          )
        )
      ),
      child: AppBar(
        title: title,
        // backgroundColor: Variables.blackColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: leading,
        actions: actions,
        centerTitle: centerTitle,
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight +10);
}
