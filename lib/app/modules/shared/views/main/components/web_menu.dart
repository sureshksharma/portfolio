import 'package:flutter/material.dart' hide MenuController;
import 'package:get/get.dart';

import '../../../../../../utils/responsive.dart';
import '../../../controllers/menu_controller.dart';


class WebMenu extends GetView<MenuController> {
  const WebMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          controller.menuItems.length,
          (index) => WebMenuItem(
            text: controller.menuItems[index],
            isActive: index == controller.selectedIndex.value,
            press: () => controller.setMenuIndex(index),
          ),
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem({
    super.key,
    required this.isActive,
    required this.text,
    required this.press,
  });

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  State<WebMenuItem> createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return Theme.of(context).primaryColor;
    } else if (!widget.isActive & _isHover) {
      return Theme.of(context).primaryColor.withAlpha(102);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _borderColor(), width: 3),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}