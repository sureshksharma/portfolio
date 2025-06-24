import 'package:cabservice/app/modules/contact_us/views/components/contact_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          SafeArea(
            minimum: EdgeInsets.all(SizeConfig.defaultSize),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  alignment: Responsive.isMobile(context)
                      ? WrapAlignment.center
                      : WrapAlignment.spaceEvenly,
                  spacing: SizeConfig.defaultSize,
                  runSpacing: SizeConfig.defaultSize,
                  children: [
                    ContactCardWidget(
                      onTap: () {
                        launchUrlString('tel://+917688992414');
                      },
                      icon: Icons.call,
                      text: '+91 7688992414',
                    ),
                    ContactCardWidget(
                      onTap: () {
                        launchUrlString('mailto://tvaritcabs@gmail.com');
                      },
                      icon: Icons.mail,
                      text: 'tvaritcabs@gmail.com',
                    ),
                    ContactCardWidget(
                      onTap: () {
                        launchUrlString(
                            'https://maps.app.goo.gl/MCJTn2wCLpzs42KTA');
                      },
                      icon: Icons.location_on,
                      text:
                          '101/46, Kumbha Marg, Sector 10,\nPratap Nagar, Jaipur, Rajasthan\n- 302033',
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
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      if (!Responsive.isMobile(context))
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: NetworkImageWidget(
                                  'https://media.istockphoto.com/id/666845594/photo/silhouette-contact-us-word.jpg?s=612x612&w=0&k=20&c=T3WVyjV26UwOJqUW9d6lGUEYUK959L-OVPiz9jwFZ9E=',
                                ),
                              ),
                              SizedBox(width: SizeConfig.defaultSize * 2),
                              Expanded(
                                child: SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? SizeConfig.screenWidth * 0.3
                                      : SizeConfig.screenWidth * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Your Name',
                                            filled: true,
                                            fillColor:
                                                theme.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.defaultSize),
                                      SizedBox(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Your Email',
                                            filled: true,
                                            fillColor:
                                                theme.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.defaultSize),
                                      SizedBox(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Your Mobile',
                                            filled: true,
                                            fillColor:
                                                theme.colorScheme.onPrimary,
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
                                            fillColor:
                                                theme.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.defaultSize),
                                      ElevatedButton(
                                        onPressed: controller.submitForm,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              theme.colorScheme.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                kDefaultPadding),
                                          ),
                                        ),
                                        child: Text(
                                          'Submit',
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: theme.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (Responsive.isMobile(context))
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
                                  SizedBox(height: SizeConfig.defaultSize),
                                  ElevatedButton(
                                    onPressed: controller.submitForm,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          theme.colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            kDefaultPadding),
                                      ),
                                    ),
                                    child: Text(
                                      'Submit',
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize * 2),
          SizedBox(
            height: SizeConfig.screenHeight * 0.7,
            width: double.infinity,
            child: InAppWebView(
              key: ValueKey('WebView'),
              initialUrlRequest: URLRequest(
                  url: WebUri(
                      'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d890.3130106691556!2d75.81551460216903!3d26.800102183315733!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x396dc9437d86f7b9%3A0xc5bba105eee80925!2sTvarit%20Cabs!5e0!3m2!1sen!2sin!4v1750782866978!5m2!1sen!2sin')),
              onWebViewCreated: (webController) {
                controller.webViewController = webController;
              },
              initialSettings: controller.settings,
            ),
          ),
        ],
      ),
    );
  }
}
