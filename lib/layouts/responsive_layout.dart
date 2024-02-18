import 'package:flutter/material.dart';
import 'package:pictogram/utils/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webLayout;
  final Widget mobileLayout;
  const ResponsiveLayout(
      {super.key, required this.webLayout, required this.mobileLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > kMobilewidth) {
          return webLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}
