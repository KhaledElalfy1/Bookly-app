import 'package:bookly_app/core/functions/helper_functions.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';


import '../../../../../core/widgets/custom_button.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              textColor: Colors.black,
              text: 'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                customLaunch(
                    context,
                    bookModel.volumeInfo?.previewLink ??
                        'https://www.google.com/');
              },
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              textColor: Colors.white,
              text: getText(bookModel),
            ),
          ),
        ],
      ),
    );
  }

  getText(BookModel bookModel) {
    if (bookModel.volumeInfo?.previewLink == null) {
      return 'Not Available';
    }
    return 'Preview';
  }
}
