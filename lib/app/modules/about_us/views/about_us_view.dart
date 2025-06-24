import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../../utils/responsive.dart';
import '../../shared/views/main/main_screen.dart';
import '../controllers/about_us_controller.dart';
import 'components/feature_card.widget.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    final aboutText =
        '''Welcome to Tvarit Cabs - Your Trusted Travel Partner. The present world is ending up progressively and littler and simpler to discover the way. This makes it essential that after a long flight, you’re progressing venture is effectively organized. The most ideal approach to do this is to have your auto and prepared escort sitting tight for you at your get point, with the vehicle of your decision and without the sticking around. Our roadside help and no shrouded costs implies we give All Inclusive services according to your prerequisite.

We pride ourselves on our exceptional client benefit benchmarks, and we offer the majority of our clients free call-backs, airplane terminal auto rental, and a huge choice of vehicles in the majority of our locales guarantee you have the most ideal decision to browse. Serving every one of the India’s major portals for business and relaxation both, we have a far reaching scope of rental choices for our clients to pick the vehicle according to their decision. These incorporate Small Car, Medium Car, and Premium Car, 5-seater, mini busses and Volvo Coaches, Tempo Traveller.

Aside from above we give the individual regard for each visitor amid the visit and take the criticism from them about service/driver and vehicle so our visitor can feel that he is not far from home and can appreciate the significantly more.

We have our own system the nation over including all real traveler goals. We help you about your course arranging, what you need to do, simply send us little mail expressing that we need to visit these spots and our goal master will outline the course anticipate your inevitable outing to India nitty gritty schedule. We are excitedly sitting tight for your entry in India to full feel your everything travel course of action, we guaranteed the best services in India.

Our fundamental concentrate on auto rental services in India and ensured the nature of Vehicle, Driver and ensures that vehicle should cover time. Our visitor can benefit auto rental service at reasonable cost with superb service at all area in India. We have little size auto, Medium Size Car, Mini Coach and Large Coach to offer the taxi administrations for abroad visitor and international safe haven assignment.''';
    return MainScreen(
      child: SafeArea(
        minimum: EdgeInsets.all(SizeConfig.defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationThickness: 3,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ).animate().fadeIn(duration: 1000.ms),
            SizedBox(height: SizeConfig.defaultSize * 2),
            Text(
              aboutText,
              style: theme.textTheme.bodyLarge,
            ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms),
            SizedBox(height: SizeConfig.defaultSize * 2),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                alignment: Responsive.isMobile(context)
                    ? WrapAlignment.center
                    : WrapAlignment.spaceEvenly,
                spacing: SizeConfig.defaultSize,
                runSpacing: SizeConfig.defaultSize,
                children: [
                  FeatureCardWidget(
                    icon: Icons.thumb_up_outlined,
                    title: 'Reliable services',
                    subTitle:
                        'Tvarit Cabs is the most reliable cabs service provider in the city.We offer efficient, reliable taxi service.',
                  ),
                  FeatureCardWidget(
                    icon: Icons.car_rental_outlined,
                    title: 'Luxury Cars',
                    subTitle:
                        'We are one of the most trusted Car Rental Company with a fleet of luxury and executive Cars that can suit all purposes and pockets.',
                  ),
                  FeatureCardWidget(
                    icon: Icons.security_outlined,
                    title: 'Secured Booking',
                    subTitle:
                        'Provide secure payment processing for your cabs. Secure booking payments to protect the identity of our customer. Quick easy and best.',
                  ),
                ],
              ).animate().fadeIn(delay: 2000.ms, duration: 1000.ms),
            ),
            SizedBox(height: SizeConfig.defaultSize),
          ],
        ),
      ),
    );
  }
}
