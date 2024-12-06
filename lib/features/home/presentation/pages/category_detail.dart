import 'package:ecombloc/features/home/presentation/bloc/categoryDetail/bloc/category_detail_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_card.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
        ),
        body: BlocProvider(
          create: (context) => CategoryDetailBlocBloc()
            ..add(LoadProductInCategoryEvent(category: widget.categoryName)),
          child: BlocBuilder<CategoryDetailBlocBloc, CategoryDetailBlocState>(
              builder: (context, state) {
            if (state is CategoryDetailBlocLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is CategoryDetailBlocLoaded) {
              return state.products.isNotEmpty
                  ? GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 2),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/product-detail',
                                arguments: state.products[index].id),
                            child: ProductCard(
                              productEntity: state.products[index],
                            ),
                          ))
                  : const Center(
                      child: Text("No Data"),
                    );
            }
            return const SizedBox();
          }),
        ));
  }
}
