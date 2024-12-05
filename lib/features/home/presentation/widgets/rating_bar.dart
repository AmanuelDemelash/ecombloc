import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

RatingBar ratingBar(double rating) {
  return RatingBar.builder(
    initialRating: rating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: false,
    itemCount: 5,
    itemPadding: const EdgeInsets.symmetric(horizontal: 0.1),
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemSize: 15,
    onRatingUpdate: (double value) {},
  );
}
