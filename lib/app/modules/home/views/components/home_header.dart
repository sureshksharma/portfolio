import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';
import '../../../shared/controllers/menu_controller.dart';
import '../../../shared/views/main/components/network_image.widget.dart';
import '../../controllers/home_controller.dart';

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Stack(
      children: [
        Obx(
          () => CarouselSlider(
            carouselController: controller.sliderController,
            options: CarouselOptions(
              aspectRatio: 9 / 4,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
            ),
            items: (controller.homeData.value?.sliders ?? []).map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return NetworkImageWidget(
                    i,
                    width: SizeConfig.screenWidth,
                    fit: BoxFit.fill,
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withAlpha(100),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.defaultSize * 2),
                Animate(
                  onComplete: (controller) => controller.repeat(),
                  effects: [
                    CustomEffect(
                      builder: (_, value, __) {
                        int charactersToShow =
                            ('Welcome to Tvarit Cabs '.length * value)
                                .clamp(0, 'Welcome to Tvarit Cabs '.length)
                                .toInt();
                        String visibleText = 'Welcome to Tvarit Cabs '
                            .substring(0, charactersToShow);
                        return Text(
                          visibleText,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                      duration: 2000.ms,
                      delay: 2000.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConfig.defaultSize),
                  child: Text(
                    "Tvarit Cabs® - Award winning Cab & Taxi service provider.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ).animate().fade(delay: 2000.ms, duration: 2000.ms),
                ),
                FittedBox(
                  child: TextButton(
                    onPressed: () => Get.find<MenuController>().setMenuIndex(2),
                    child: Row(
                      children: [
                        Text(
                          "Learn More",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: SizeConfig.defaultSize * 0.5),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ).animate().fade(delay: 4000.ms, duration: 2000.ms),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: SizeConfig.defaultSize,
          child: IconButton(
            onPressed: controller.sliderController.nextPage,
            style: IconButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: theme.colorScheme.onPrimary,
            ),
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: SizeConfig.defaultSize,
          child: IconButton(
            onPressed: controller.sliderController.previousPage,
            style: IconButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: theme.colorScheme.onPrimary,
            ),
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ],
    );
  }
}
