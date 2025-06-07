import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/theme/theme_controller.dart';
import '../../../widgets/custom_shapes/containers/circular_container.dart';
import '../../../widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../widgets/texts/section_heading.dart';
import '../controllers/profile_controller.dart';
import '../../../widgets/appbar/app_bar_blank.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Header
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  // -- AppBar
                  MyAppBarBlank(lightSystemOverlayStyle: true),
                  // -- User Profile
                  ListTile(
                    leading: MyCircularContainer(
                      width: 50,
                      height: 50,
                      backgroundColor: MyColors.white,
                      child: Center(
                        child: Text(
                          controller.fullName.value?.substring(0, 1) ?? '?',
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(color: MyColors.primary, fontSize: 32),
                        ),
                      ),
                    ),
                    title: Text(
                      controller.fullName.value ?? 'Unknown',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(color: MyColors.white),
                    ),
                    subtitle: Text(
                      controller.email.value ?? 'No email provided',
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.apply(color: MyColors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.edit, color: MyColors.white),
                    ),
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections),
                ],
              ),
            ),

            // -- Body
            Padding(
              padding: const EdgeInsets.all(MySizes.defaultSpace),
              child: Column(
                children: [
                  MySectionHeading(
                    title: 'App Settings',
                    textColor: dark ? MyColors.white : MyColors.dark,
                    showActionButton: false,
                  ),
                  const SizedBox(height: MySizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(
                      Iconsax.moon,
                      size: 28,
                      color: MyColors.primary,
                    ),
                    title: Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Switch(
                      value: themeController.isDarkMode.value,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      },
                      activeColor: MyColors.primary,
                      activeTrackColor: MyColors.primary.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: controller.logout,
                      child: const Text("Logout"),
                    ),
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
