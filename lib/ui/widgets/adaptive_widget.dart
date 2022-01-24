import 'package:flutter/material.dart';

class AdaptiveWidget extends StatelessWidget {
  final Widget? narrow;
  final Widget? wide;
  final Widget? ultrawide;
  final Widget? other;

  const AdaptiveWidget({
    Key? key,
    this.narrow,
    this.wide,
    this.ultrawide,
    this.other,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if (width >= 1920 && ultrawide != null) return ultrawide!;

    if (width >= 720 && wide != null) return wide!;

    if (narrow != null) return narrow!;

    if (other != null) return other!;

    throw Exception('Can not match layout');
  }
}
