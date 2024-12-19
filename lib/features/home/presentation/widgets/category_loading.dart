import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoadingShimmer extends StatelessWidget {
  const CategoryLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.withValues(),
            child: Container(
              width: 110,
              height: 10,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            )));
  }
}
