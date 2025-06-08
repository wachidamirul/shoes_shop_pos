import 'package:flutter/material.dart';

class SizeQuantityField {
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();

  void dispose() {
    sizeController.dispose();
    qtyController.dispose();
  }
}
