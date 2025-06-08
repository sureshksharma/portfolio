import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';
import '../../../shared/views/main/components/network_image.widget.dart';
import '../../controllers/admin_profile_controller.dart';

class AdminProfileBody extends GetView<AdminProfileController> {
  const AdminProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Get.theme;
    return SafeArea(
      minimum: EdgeInsets.all(SizeConfig.defaultSize),
      child: Card(
        color: theme.colorScheme.onPrimary,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Profile',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize * 0.5),
              Text(
                'Manage your personal information and account security.',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize),
              Wrap(
                alignment: Responsive.isMobile(context)
                    ? WrapAlignment.center
                    : WrapAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        child: Obx(
                          () {
                            if (controller.selectedImageBytes.value == null) {
                              return UserNetworkAvatar(
                                controller.currentUser.value?.avatar,
                                height: Responsive.isMobile(context)
                                    ? SizeConfig.defaultSize * 10
                                    : SizeConfig.defaultSize * 5,
                                width: Responsive.isMobile(context)
                                    ? SizeConfig.defaultSize * 10
                                    : SizeConfig.defaultSize * 5,
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Image.memory(
                                controller.selectedImageBytes.value!,
                                height: Responsive.isMobile(context)
                                    ? SizeConfig.defaultSize * 10
                                    : SizeConfig.defaultSize * 5,
                                width: Responsive.isMobile(context)
                                    ? SizeConfig.defaultSize * 10
                                    : SizeConfig.defaultSize * 5,
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: controller.pickImage,
                          icon: Container(
                            clipBehavior: Clip.antiAlias,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.onPrimary,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: theme.colorScheme.primary,
                              size: Responsive.isMobile(context)
                                  ? SizeConfig.defaultSize * 2
                                  : SizeConfig.defaultSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: SizeConfig.defaultSize * 0.5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.currentUser.value?.name ?? '',
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: SizeConfig.defaultSize * 0.5),
                      Text(
                        controller.currentUser.value?.email ?? '',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      Text(
                        'Role: ${controller.getRole ?? ''}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.defaultSize),
              const Divider(),
              Form(
                key: controller.formKeyPersonal,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Wrap(
                      alignment: Responsive.isMobile(context)
                          ? WrapAlignment.start
                          : WrapAlignment.center,
                      crossAxisAlignment: Responsive.isMobile(context)
                          ? WrapCrossAlignment.start
                          : WrapCrossAlignment.center,
                      spacing: Responsive.isMobile(context)
                          ? SizeConfig.defaultSize
                          : SizeConfig.defaultSize * 0.4,
                      runSpacing: Responsive.isMobile(context)
                          ? SizeConfig.defaultSize
                          : SizeConfig.defaultSize * 0.4,
                      children: [
                        Text(
                          'Full Name',
                          style: theme.textTheme.bodyMedium,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 650),
                          child: TextFormField(
                            controller: controller.nameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validateName,
                            decoration: InputDecoration(
                              hintText: 'e.g. John Doe',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Email',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            initialValue: controller.currentUser.value?.email,
                            enabled: false,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: null,
                            decoration: InputDecoration(
                              hintText: 'e.g. user@example.com',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Phone Number',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: controller.phoneController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validatePhone,
                            maxLength: 10,
                            decoration: InputDecoration(
                              hintText: 'e.g. (123) 456 7890',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    ElevatedButton(
                      onPressed: controller.updatePersonalInfo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                      ),
                      child: Text(
                        'Update Profile',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                  ],
                ),
              ),
              const Divider(),
              Form(
                key: controller.formKeyPassword,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Password',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Current Password',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: controller.currentPasswordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validatePassword,
                            decoration: InputDecoration(
                              hintText: '******',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'New Password',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: controller.newPasswordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validatePassword,
                            decoration: InputDecoration(
                              hintText: '******',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            'Confirm New Password',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: kDefaultFontSize),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: controller.newConfirmPasswordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: controller.validateConfirmPassword,
                            decoration: InputDecoration(
                              hintText: '******',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.colorScheme.outline),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.outlineVariant
                                  .withAlpha(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                    ElevatedButton(
                      onPressed: controller.changePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                      ),
                      child: Text(
                        'Change Password',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
