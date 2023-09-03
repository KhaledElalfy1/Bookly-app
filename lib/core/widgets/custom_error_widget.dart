import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.eMessage});
  final String eMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        eMessage,
        style: Style.textStyle18,
      ),
    );
  }
}
