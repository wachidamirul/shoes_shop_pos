import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/appbar/app_bar.dart';
import '../controllers/barcode_generator_controller.dart';

class BarcodeGeneratorView extends GetView<BarcodeGeneratorController> {
  const BarcodeGeneratorView({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: MyAppBar(
        title: Text('Barcode Generator'),
        showbackArrow: true,
        actions: [
          IconButton(icon: const Icon(Iconsax.printer), onPressed: () {}),
        ],
      ),
      body: Center(
        child: BarcodeWidget(
          barcode: Barcode.qrCode(), // Barcode type and settings
          data: controller.barcodeData,
          drawText: false,
          width: 200,
          height: 200,
          color: dark ? MyColors.light : MyColors.dark,
        ),
      ),
    );
  }
}
