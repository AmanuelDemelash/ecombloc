import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecombloc/features/home/presentation/bloc/home_bloc.dart';
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
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: BlocProvider.value(
          value: context.read<HomeBloc>(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              // if (state is ProductDetailLoadingState) {
              //   return const Center(
              //     child: CupertinoActivityIndicator(),
              //   );
              // } else if (state is ProductDetailLoadedState) {

              if (state is HomeProductLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Hero(
                          tag: Key(widget.id.toString()),
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            fit: BoxFit.fill,
                            imageUrl: state.products[widget.id].image,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        ListTile(
                          trailing: Text(
                            "\$${state.products[widget.id].price}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            state.products[widget.id].title,
                            maxLines: 2,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.products[widget.id].category),
                              ratingBar(state.products[widget.id].rating.rate)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(state.products[widget.id].description),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Add to Cart",
                              )),
                        )
                      ],
                    ),
                  ),
                );
              }
              // } else if (state is ProductDetailErrorState) {
              //   return Center(
              //     child: Text(state.error),
              //   );
              // }
              return const SizedBox();
            },
          ),
        ));
  }
}
