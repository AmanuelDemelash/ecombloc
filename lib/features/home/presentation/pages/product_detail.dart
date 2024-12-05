import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecombloc/features/home/presentation/bloc/productDetail/product_detail_bloc.dart';
import 'package:ecombloc/features/home/presentation/widgets/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatefulWidget {
  final int id;

  const ProductDetail({super.key, required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) =>
              ProductDetailBloc()..add(GetProductDetailEvent(id: widget.id)),
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoadingState) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is ProductDetailLoadedState) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          fit: BoxFit.fill,
                          imageUrl: state.product.image,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const CupertinoActivityIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        ListTile(
                          trailing: Text(
                            "\$${state.product.price}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            state.product.title,
                            maxLines: 2,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.product.category),
                              ratingBar(state.product.rating.rate)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(state.product.description),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.all(20)),
                              onPressed: () {},
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              } else if (state is ProductDetailErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              return SizedBox();
            },
          ),
        ));
  }
}
