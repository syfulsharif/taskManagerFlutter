import 'package:flutter/material.dart';

InputDecoration appInputDecoration(label, vertical, horizontal) {
  return InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    border: const OutlineInputBorder(),
    labelText: label,
  );
}

SizedBox sizedBox15() {
  return const SizedBox(
    height: 15.0,
    width: double.infinity,
  );
}
