import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int? reviewCount;
  final bool isIndicator;
  final double itemSize;

  const RatingWidget({
    Key? key,
    required this.rating,
    this.reviewCount,
    this.isIndicator = true,
    this.itemSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isIndicator) {
      return RatingBarIndicator(
        rating: rating,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: 5,
        itemSize: itemSize,
        direction: Axis.horizontal,
      );
    }

    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (value) {},
    );
  }
}