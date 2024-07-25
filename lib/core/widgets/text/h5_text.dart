import 'package:dot_coaching/utils/utils.dart';
import 'package:flutter/material.dart';

class H5Text extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  const H5Text(
    this.text, {
    super.key,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.theme.textTheme.bodyMedium?.copyWith(
        fontWeight: fontWeight,
      ),
    );
  }
}
