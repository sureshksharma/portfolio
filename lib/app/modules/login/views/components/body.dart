import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';
import '../../../../routes/app_pages.dart';
import '../../../shared/views/loading/base.widget.dart';
import '../../controllers/login_controller.dart';
import 'custom_textfield.widget.dart';

class LoginBody extends GetView<LoginController> {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    final recognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.rootDelegate.toNamed(Routes.REGISTER);
      };
    return BaseWidget(
      child: SafeArea(
        child: Container(
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                Responsive.isDesktop(context)
                    ? 'https://plus.unsplash.com/premium_photo-1661963050879-c6abd84f0261?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHJhamFzdGhhbnxlbnwwfHwwfHx8MA%3D%3D'
                    : 'https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg?cs=srgb&dl=pexels-sbsoneji-3581368.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Card(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize,
                  horizontal: Responsive.isMobile(context)
                      ? SizeConfig.defaultSize * 2
                      : SizeConfig.defaultSize,
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/logo_wide.svg',
                        height: Responsive.isMobile(context)
                            ? SizeConfig.defaultSize * 10
                            : SizeConfig.defaultSize * 5,
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      Text(
                        'Welcome Back!',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize),
                      Text(
                        'Enter your credentials to access your account.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      SizedBox(
                        width: Responsive.isDesktop(context)
                            ? SizeConfig.defaultSize * 20
                            : double.maxFinite,
                        child: CustomTextField(
                          controller: controller.emailController,
                          labelText: 'Email',
                          hintText: 'you@example.com',
                          prefix: Icon(Icons.email_outlined),
                          validator: controller.validateEmail,
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize),
                      SizedBox(
                        width: Responsive.isDesktop(context)
                            ? SizeConfig.defaultSize * 20
                            : double.maxFinite,
                        child: Obx(
                          () => CustomTextField(
                            controller: controller.passwordController,
                            obscureText: controller.hidePassword.value,
                            labelText: 'Password',
                            hintText: '⚫️⚫️⚫️⚫️⚫️⚫️',
                            prefix: Icon(Icons.lock_outline),
                            suffix: InkWell(
                              onTap: controller.hidePassword.toggle,
                              child: Icon(
                                controller.hidePassword.value
                                    ? Icons.remove_red_eye_rounded
                                    : Icons.remove_red_eye_outlined,
                              ),
                            ),
                            validator: controller.validatePassword,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      SizedBox(
                        width: Responsive.isDesktop(context)
                            ? SizeConfig.defaultSize * 20
                            : double.maxFinite,
                        child: ElevatedButton(
                          onPressed: controller.loginUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.defaultSize,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.defaultSize * 2,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Log In',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                      Obx(
                        () => Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            mouseCursor: SystemMouseCursors.text,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.outline,
                            ),
                            children: [
                              TextSpan(
                                onEnter: (event) {
                                  controller.onRegisterHover.value = true;
                                },
                                onExit: (event) {
                                  controller.onRegisterHover.value = false;
                                },
                                recognizer: recognizer,
                                mouseCursor: SystemMouseCursors.click,
                                text: "Register here",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                  decoration: controller.onRegisterHover.value
                                      ? TextDecoration.underline
                                      : null,
                                  decorationStyle:
                                      controller.onRegisterHover.value
                                          ? TextDecorationStyle.solid
                                          : null,
                                  decorationThickness:
                                      controller.onRegisterHover.value
                                          ? 3
                                          : null,
                                  decorationColor:
                                      controller.onRegisterHover.value
                                          ? theme.colorScheme.primary
                                          : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
