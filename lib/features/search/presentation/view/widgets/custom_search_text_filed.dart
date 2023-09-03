import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({super.key,this.onSubmitted});
 final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted:onSubmitted ,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBoarder(),
        focusedBorder: buildOutlineInputBoarder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.search,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBoarder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
