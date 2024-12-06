import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(children: [
          Expanded(
            child: CachedNetworkImage(
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              imageUrl: productEntity.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          ListTile(
            title: Text(
              "\$${productEntity.price}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              productEntity.title,
              maxLines: 1,
            ),
          ),
        ]),
      ),
    );
  }
}
