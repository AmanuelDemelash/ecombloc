import 'package:ecombloc/features/home/presentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/category/category_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/category_loading.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          key: const Key("appbar"),
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: const AppBarWidget(
            title: "Home",
          )),
      body: Column(
        children: [
          // search
          Container(
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      key: const Key("search"),
                      onChanged: (value) {
                        context
                            .read<HomeBloc>()
                            .add(HomeProductSearchEvent(title: value));
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          border: InputBorder.none),
                    ),
                  );
                },
              )),
          // Category
          Container(
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: BlocBuilder<CategoryBloc, CategoryState>(
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return const CategoryLoadingShimmer();
                        } else if (state is CategoryLoaded) {
                          return ListView.builder(
                            key: const ValueKey('categorylist'),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: ChoiceChip(
                                key: Key("categoryChip$index"),
                                label: Text(
                                  key: Key("category-index$index"),
                                  state.categories[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                chipAnimationStyle: ChipAnimationStyle(),
                                showCheckmark: false,
                                backgroundColor: Colors.white,
                                disabledColor: Colors.white,
                                onSelected: (value) {
                                  Navigator.pushNamed(context, '/category',
                                      arguments: state.categories[index].title);
                                },
                                selected: false,
                              ),
                            ),
                          );
                        } else if (state is CategoryError) {
                          return Center(
                            child: Text(state.message),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              )),
          // Products
          Expanded(child:
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeProductLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is HomeProductLoaded) {
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
            } else if (state is HomeProductSearchLoaded) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    if (state is HomeProductSearchLoaded) {
                      return state.searchedProducts.isNotEmpty
                          ? GridView.builder(
                              key: const Key("productlistgrid"),
                              padding: const EdgeInsets.all(10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 3,
                                      crossAxisSpacing: 2),
                              itemCount: state.searchedProducts.length,
                              itemBuilder: (context, index) => ProductCard(
                                  productEntity: state.searchedProducts[index]))
                          : const Center(child: Text("No product found"));
                    }
                    return const Center(
                      child: Text("search product"),
                    );
                  },
                ),
              );
            } else if (state is HomeProductError) {
              return const Center(
                child: Text("something went wrong"),
              );
            }

            return const SizedBox();
          }))
        ],
      ),
    );
  }
}
