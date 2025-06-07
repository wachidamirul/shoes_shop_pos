import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileView'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.firstName.value ?? ''),
                const SizedBox(width: 4),
                Text(controller.lastName.value ?? ''),
              ],
            ),
            const SizedBox(height: 8),
            Text(controller.email.value ?? ''),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: controller.logout, child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
