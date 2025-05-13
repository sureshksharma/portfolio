import 'package:cabservice/app/modules/contact_us/views/components/contact_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../shared/views/main/components/network_image.widget.dart';
import '../../shared/views/main/main_screen.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return MainScreen(
      child: Column(
        children: [
          Wrap(
            alignment: Responsive.isMobile(context)
                ? WrapAlignment.center
                : WrapAlignment.spaceEvenly,
            spacing: SizeConfig.defaultSize,
            runSpacing: SizeConfig.defaultSize,
            children: [
              ContactCardWidget(
                icon: Icons.call,
                text: '+91 8107939754',
              ),
              ContactCardWidget(
                icon: Icons.mail,
                text: 'tvaritcabs@gmail.com',
              ),
              ContactCardWidget(
                icon: Icons.location_on,
                text: 'Pratap Nagar, Jaipur, Rajasthan',
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize),
          Container(
            padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
            color: theme.colorScheme.secondaryContainer,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'GET IN TOUCH WITH US',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize * 2),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: SizeConfig.defaultSize,
                  runSpacing: SizeConfig.defaultSize,
                  children: [
                    NetworkImageWidget(
                      'https://media.istockphoto.com/id/666845594/photo/silhouette-contact-us-word.jpg?s=612x612&w=0&k=20&c=T3WVyjV26UwOJqUW9d6lGUEYUK959L-OVPiz9jwFZ9E=',
                      height: SizeConfig.screenHeight * 0.42,
                    ),
                    SizedBox(
                      width: Responsive.isDesktop(context)
                          ? SizeConfig.screenWidth * 0.3
                          : Responsive.isTablet(context)
                              ? SizeConfig.screenWidth * 0.5
                              : SizeConfig.screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Your Name',
                                filled: true,
                                fillColor: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.defaultSize),
                          SizedBox(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Your Email',
                                filled: true,
                                fillColor: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.defaultSize),
                          SizedBox(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Your Mobile',
                                filled: true,
                                fillColor: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.defaultSize),
                          SizedBox(
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Your Message',
                                filled: true,
                                fillColor: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.defaultSize * 2),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.5,
                  child: InAppWebView(
                    key: ValueKey('WebView'),
                    initialUrlRequest: URLRequest(
                        url: WebUri(
                            'https://maps.google.com/maps?q=Maa%20cab%20service%20Jaipur%20&t=m&z=15&output=embed&iwloc=near')),
                    onWebViewCreated: (webController) {
                      controller.webViewController = webController;
                    },
                    initialSettings: controller.settings,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
