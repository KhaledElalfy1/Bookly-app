import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import 'book_rating.dart';
import 'books_listview_item.dart';
import 'box_actions_button.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .17),
            child: FeaturedListViewItem(
                urlImage: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://th.bing.com/th/id/R.8546820ee580a8cdb3a9c1ebd11a4daa?rik=4fwMklQJCQU1Ow&riu=http%3a%2f%2fredonline.cdnds.net%2fmain%2fthumbs%2f25788%2fstack_of_books.jpg&ehk=xwtWWiDiDhhxV8yXIhXFgeNFvZ4ETt83uVe2km2jabI%3d&risl=&pid=ImgRaw&r=0'),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            bookModel.volumeInfo?.title ??
                'harry potter and the goblet of fire',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Style.textStyle30,
          ),
          const SizedBox(
            height: 8,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              bookModel.volumeInfo?.authors?.first ?? 'J.K. Rowling',
              style: Style.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(
            height: 42,
          ),
           BooksActions(bookModel: bookModel),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
