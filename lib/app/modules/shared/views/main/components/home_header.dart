import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../../../utils/responsive.dart';
import '../../../controllers/menu_controller.dart';
import 'network_image.widget.dart';

class HomeHeader extends GetView<MenuController> {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return Stack(
      children: [
        CarouselSlider(
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
          items: [
            'https://media.istockphoto.com/id/1347088244/photo/kerala-most-beautiful-place-of-india.jpg?s=1024x1024&w=is&k=20&c=TErl9Rcp8dHOUHxr96Wp4CrryOhCQcfdnCQARr9hWpc=',
            'https://media.istockphoto.com/id/1031430214/photo/young-woman-kayaking-through-the-backwaters-of-monroe-island.jpg?s=1024x1024&w=is&k=20&c=_oF7GgQFtH5p9gNGehfQmJh70rjKYAX-OODPFj6F8M4=',
            'https://media.istockphoto.com/id/930852852/photo/dhankar-gompa-india-spiti-valley.jpg?s=1024x1024&w=is&k=20&c=x8DaSMAdl8Evv8tePEyfrBGD43KDYlIH5aG7YhH-s24=',
            'https://media.istockphoto.com/id/1145064928/photo/tourist-riding-camel-in-desert.jpg?s=1024x1024&w=is&k=20&c=PhqDWlUjEUBYCK04ey394klCQCcJr1Z1YKecTJ_s1bY=',
            'https://media.istockphoto.com/id/1140611116/photo/excited-to-travel.jpg?s=1024x1024&w=is&k=20&c=6NBqHiQH-5fTarqFmkBC_uR0S0YqoWj3Qmh9gH3JliU=',
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return NetworkImageWidget(
                  i,
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.fitWidth,
                );
              },
            );
          }).toList(),
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
                    onPressed: () => controller.setMenuIndex(2),
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
      ],
    );
  }
}
