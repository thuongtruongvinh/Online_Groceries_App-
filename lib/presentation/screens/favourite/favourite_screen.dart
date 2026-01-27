import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/core/app_logger.dart';
import 'package:groceries_app/domain/usecase/get_favorite_product_usecase.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_event.dart';
import 'package:groceries_app/presentation/bloc/favorite/favorite_state.dart';
import 'package:groceries_app/presentation/error/failure_mapper.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(
        getIt<GetFavoriteProductUsecase>(),
        FailureMapper(context),
        getIt<AppLogger>(),
      )..add(OnGetFavoriteProductsEvent('1')),
      child: const FavoriteView(),
    );
  }
}

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite Products')),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.apiErrorMessage.isNotEmpty) {
            return Center(child: Text(state.apiErrorMessage));
          }
          if (state.favoriteProducts.isEmpty) {
            return const Center(child: Text('No favorite products found.'));
          }
          return Column(
            children: [
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: state.favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = state.favoriteProducts[index];
                    return Row(
                      children: [
                        SizedBox(width: 30),
                        Image.network(product.thumbnail, width: 55, height: 55),
                        SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '2L, Price',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '${product.price}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_right, size: 16),
                        SizedBox(width: 12),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 32),
                    child: Divider(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
