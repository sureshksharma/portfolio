import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/loading_controller.dart';

class LoadingWidget extends GetWidget<LoadingController> {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? AbsorbPointer(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ModalBarrier(
                    dismissible: false,
                    color: Get.theme.colorScheme.outlineVariant.withAlpha(100),
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Get.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
