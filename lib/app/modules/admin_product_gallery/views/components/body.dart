import 'package:flutter/material.dart';

import '../../../../../utils/responsive.dart';
import 'expansion_card.widget.dart';

class AdminProductGalleryBody extends StatelessWidget {
  const AdminProductGalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(SizeConfig.defaultSize),
      child: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ExpansionCard(index: index);
        },
      ),
    );
  }
}
