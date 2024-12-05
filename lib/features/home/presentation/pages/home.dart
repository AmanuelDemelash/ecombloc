import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecombloc/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:ecombloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottomNav/bottom_nav_cubit.dart';
import '../widgets/bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.notifications)],
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => sl<BottomNavCubit>(),
        child: const BottomNav(),
      ),
      body: Column(
        children: [
          // search
          Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SearchAnchor(
                keyboardType: TextInputType.text,
                isFullScreen: false,
                dividerColor: Colors.black26,
                builder: (context, controller) => const TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      enabled: false,
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      border: InputBorder.none),
                ),
                suggestionsBuilder: (context, controller) {
                  return [];
                },
              ),
            ),
          ),

          // Category
          Container(
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 110,
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
                    child: BlocProvider(
                      create: (context) =>
                          CategoryBloc()..add(CategoryLoadEvent()),
                      child: BlocBuilder<CategoryBloc, CategoryState>(
                        buildWhen: (previous, current) => previous != current,
                        builder: (context, state) {
                          if (state is CategoryLoading) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          } else if (state is CategoryLoaded) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.categories.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ChoiceChip(
                                  label: Text(
                                    state.categories[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  chipAnimationStyle: ChipAnimationStyle(),
                                  showCheckmark: false,
                                  backgroundColor: Colors.white,
                                  disabledColor: Colors.white,
                                  onSelected: (value) {
                                    print(state.categories[index].title);
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
                  ),
                ],
              )),
          // Products
          Expanded(
              child: BlocProvider(
            create: (context) => HomeBloc()..add(HomeProductEventLoad()),
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
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
                              child: Card(
                                elevation: 5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Column(children: [
                                    Expanded(
                                      child: CachedNetworkImage(
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.fill,
                                        imageUrl: state.products[index].image,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            const CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "\$${state.products[index].price}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        state.products[index].title,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ))
                    : const Center(
                        child: Text("No Data"),
                      );
              } else if (state is HomeProductError) {
                return const Center(
                  child: Text("something went wrong"),
                );
              }

              return const SizedBox();
            }),
          ))
        ],
      ),
    );
  }
}
