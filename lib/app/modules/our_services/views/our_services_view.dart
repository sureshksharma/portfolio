import 'package:cabservice/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../shared/views/main/main_screen.dart';
import '../controllers/our_services_controller.dart';
import 'components/service_card.widget.dart';

class OurServicesView extends GetView<OurServicesController> {
  const OurServicesView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return MainScreen(
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: theme.colorScheme.outline,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2,
                  vertical: SizeConfig.defaultSize,
                ),
                alignment: Alignment.center,
                child: Text(
                  'View our local taxi service in Jaipur packages:',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
              Wrap(
                alignment: Responsive.isMobile(context)
                    ? WrapAlignment.center
                    : WrapAlignment.start,
                spacing: SizeConfig.defaultSize,
                runSpacing: SizeConfig.defaultSize,
                children: List.generate(
                  8,
                  (i) => ServiceCard(
                    image:
                        'https://media.istockphoto.com/id/108196764/photo/indian-taxi-race.jpg?s=1024x1024&w=is&k=20&c=AyEz-XwUkResAzSdervbUSB8SlCJ4m89FNCqvysXDw8=',
                    title: 'Jaipur Car Rental',
                    subTitle:
                        'Hire our taxi in Jaipur for Airport pick/drop, attend meeting or wedding at best taxi fare, starting at Rs 10 per km.',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize * 2),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: theme.colorScheme.outline,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2,
                  vertical: SizeConfig.defaultSize,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Our tour packages from Jaipur',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
              Wrap(
                alignment: Responsive.isMobile(context)
                    ? WrapAlignment.center
                    : WrapAlignment.start,
                spacing: SizeConfig.defaultSize,
                runSpacing: SizeConfig.defaultSize,
                children: List.generate(
                  8,
                  (i) => ServiceCard(
                    image:
                        'https://media.istockphoto.com/id/108196764/photo/indian-taxi-race.jpg?s=1024x1024&w=is&k=20&c=AyEz-XwUkResAzSdervbUSB8SlCJ4m89FNCqvysXDw8=',
                    title: 'Manali tour package from Jaipur',
                    subTitle:
                        'Plan a minimum 5 days 4 nights, where you offer all inclusive package with private cab from Jaipur at Rs 9999 per person. View more details.',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
