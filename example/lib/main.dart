
import 'package:api_connections_package/api_connections_pakage.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as dartz;

void main() {
  runApp(const MyApp());
}



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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => const ProductListPage());
        } else if (settings.name == '/detail') {
          final productId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (_) => ProductDetailPage(productId: productId),
          );
        }
        return null; // ruta no encontrada
      },
    );
  }
}


