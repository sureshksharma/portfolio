import 'package:cabservice/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../our_services/views/components/service_card.widget.dart';
import '../../shared/views/main/components/marquee_list.dart';
import '../../shared/views/main/components/network_image.widget.dart';
import '../../shared/views/main/main_screen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
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
          SizedBox(height: SizeConfig.defaultSize * 2),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'Companies that show trust in ',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Tvarit Cabs',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' (Our Clients)',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize),
          MarqueeList(
            children: [
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/HiltonHotelsLogo.svg/800px-HiltonHotelsLogo.svg.png',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://upload.wikimedia.org/wikipedia/commons/6/63/Club_Mahindra_New_Logo.jpg',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Cleartrip_Original.svg/500px-Cleartrip_Original.svg.png',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://static.wikia.nocookie.net/logopedia/images/4/4c/Patrika-rajasthan-in.png',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://media-cdn.tripadvisor.com/media/photo-s/0f/f0/b3/12/photo0jpg.jpg',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Infosys_logo.svg/350px-Infosys_logo.svg.png',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Teleperformance_logo.svg/500px-Teleperformance_logo.svg.png',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: NetworkImageWidget(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Genpact_logo.svg/500px-Genpact_logo.svg.png',
                  height: SizeConfig.defaultSize * 8,
                  width: SizeConfig.defaultSize * 8,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize),
        ],
      ),
    );
  }
}
