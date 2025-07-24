import 'package:api_connections_package/api/product_api.dart';
import 'package:flutter/material.dart';


class ProductDetailPage extends StatelessWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final api = ProductApi();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Detalle del producto')
      ),
      body: FutureBuilder(
        future: api.getProductById(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Sin datos'));
          }

          final either = snapshot.data!;
          return either.fold(
                (failure) => Center(child: Text('Error: ${failure.description}')),
                (product) => Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 10),
                    Text('Precio: \$${product.price}', style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text(product.description),
                    const SizedBox(height: 20),
                    Image.network(product.image, height: 200),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
