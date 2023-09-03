import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          weight: 13,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6,
        ),
        const Text(
          '4.8',
          style: Style.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          '(2002)',
          style: Style.textStyle14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
