import 'package:flutter/material.dart';

import '../../../../../utils/responsive.dart';
import 'loading.widget.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        child,
        const LoadingWidget(),
      ],
    );
  }
}
