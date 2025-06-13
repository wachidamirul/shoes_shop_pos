import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/barcode_generator_controller.dart';

class BarcodeGeneratorView extends GetView<BarcodeGeneratorController> {
  const BarcodeGeneratorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BarcodeGeneratorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BarcodeGeneratorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
