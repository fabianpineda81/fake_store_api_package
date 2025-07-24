import 'package:flutter/material.dart';

import 'pages/product_list_page.dart';
import 'pages/product_detail_page.dart';

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
