import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../core/utils/style.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel,);
          },
          child: SizedBox(
            height: 105,
            child: FeaturedListViewItem(
                urlImage: (bookModel.volumeInfo?.imageLinks?.thumbnail) ??
                    'https://th.bing.com/th/id/R.8546820ee580a8cdb3a9c1ebd11a4daa?rik=4fwMklQJCQU1Ow&riu=http%3a%2f%2fredonline.cdnds.net%2fmain%2fthumbs%2f25788%2fstack_of_books.jpg&ehk=xwtWWiDiDhhxV8yXIhXFgeNFvZ4ETt83uVe2km2jabI%3d&risl=&pid=ImgRaw&r=0'),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child:  Text((bookModel.volumeInfo?.title)??
                  'harry potter and the goblet of fire',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Style.textStyle20,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text((bookModel.volumeInfo?.authors?.first)??
                'J.K. Rowling',
                style: Style.textStyle14.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Row(
                children: [
                  Text(
                    'Free',
                    style: Style.textStyle20,
                  ),
                  Spacer(),
                  BookRating(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
