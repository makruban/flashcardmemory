import 'package:flutter/material.dart';

class ReDictionContainer extends StatelessWidget {
  final EdgeInsetsGeometry? marginContainer;
  final Widget? child;
  final List<BoxShadow>? boxShadowList;

  ReDictionContainer({this.marginContainer, this.boxShadowList, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginContainer,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
        boxShadow: boxShadowList,
      ),
      child: child,
    );
  }
}