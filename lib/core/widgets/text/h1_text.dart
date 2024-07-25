import 'package:dot_coaching/utils/utils.dart';
import 'package:flutter/material.dart';

class H1Text extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;

  const H1Text(
    this.text, {
    super.key,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.theme.textTheme.titleLarge?.copyWith(
        fontWeight: fontWeight,
      ),
    );
  }
}
