
import 'package:flutter/material.dart';
import 'package:api_connections_package/api_connections_pakage.dart';
import 'package:dartz/dartz.dart' as dartz;

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final _productApi = ProductApi();
  late Future<dartz.Either<Failure, List<Product>>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = _productApi.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: FutureBuilder<dartz.Either<Failure, List<Product>>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Sin datos'));
          }

          final result = snapshot.data!;

          return result.fold(
                (failure) => Center(child: Text('Error: ${failure.description}')),
                (products) {
              if (products.isEmpty) {
                return const Center(child: Text('No hay productos'));
              }

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    leading: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: product.id,
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
