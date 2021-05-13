import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateWatchAdapter extends StatelessWidget {
  final Widget Function() childCallback;
  StateWatchAdapter(this.childCallback);

  @override
  Widget build(BuildContext context) => Obx(childCallback);
}
