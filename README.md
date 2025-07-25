# 📦 api_connections_package

`api_connections_package` es un paquete Flutter que proporciona una capa de abstracción para conectarse fácilmente con la [Fake Store API](https://fakestoreapi.com/) utilizando `Dio` y `dartz`. Está pensado para que puedas integrarlo rápida y limpiamente en tus aplicaciones Flutter o Dart.

---

## 🚀 Instalación

Agrega este paquete a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  api_connections_package: ^0.0.1
```

Luego ejecuta:

```bash
flutter pub get
```


---
✨ Características


✅ Obtener todos los productos

🔍 Buscar un producto por ID

👤 Obtener todos los usuarios

👤 Buscar usuario por ID

🛒 Consultar todos los carritos de compras

🛒 Buscar carrito por ID

🛒 Consultar carritos por usuario

📅 Consultar carritos entre fechas

💥 Manejo de errores con Either (dartz)

📦 Estructura inmutable y desacoplada

🔄 Posibilidad de usar repositorios personalizados

✅ Preparado para pruebas unitarias
    
---



## 🛠️ Uso

Primero importa el paquete:

```dart
import 'package:api_connections_package/api_connections_package.dart';
```


### 🔹 Productos

```dart
final productApi = ProductApi();

// Obtener todos los productos
final result = await productApi.getAllProducts();

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (products) => print('Productos: $products'),
);

// Obtener producto por ID
final resultById  = await productApi.getProductById(1);

resultById.fold(
  (failure) => print('Error: ${failure.message}'),
  (product) => print('Producto: $product'),
);
```

### 🔹 Usuarios

```dart
final userApi = UserApi();

// Obtener todos los usuarios
final result = await userApi.getAllUsers();

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (users) => print('Usuarios: $users'),
);

// Obtener usuario por ID
final result2 = await userApi.getUserById(1);

result2.fold(
  (failure) => print('Error: ${failure.message}'),
  (user) => print('Usuario: $user'),
);
```

### 🔹 Carritos

```dart
final cartApi = CartApi();

// Obtener carrito por ID
final result2 = await cartApi.getCartById(2);

result2.fold(
  (failure) => print('Error: ${failure.message}'),
  (cart) => print('Carrito: $cart'),
);
```



## 🧪 Pruebas

Este paquete está preparado para pruebas . Puedes agregar tus mocks personalizados para testear las APIs.

```dart
import 'package:api_connections_package/api_connections_pakage.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockProductRepository implements ProductRepository {
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    return Right([
      ProductModel(
        id: 1,
        title: 'Producto 1',
        price: 100,
        description: 'Descripción',
        category: 'category',
        image: 'https://via.placeholder.com/150',
        rating: RatingModel(rate: 4.5, count: 10),
      ),
    ]);
  }

  // Implementa otros métodos si los necesitas
}

void main() {
  test('Debería retornar productos mockeados', () async {
    final productApi = ProductApi(repository: MockProductRepository());

    final result = await productApi.getAllProducts();

    expect(result.isRight(), true);
    result.fold(
      (_) => fail('No se esperaba un error'),
      (products) => expect(products.length, 1),
    );
  });
}
```


---

## 📄 Licencia

MIT License © 2025 Fabian Pineda


## 🌐 Fake Store API

Este paquete se conecta a: [https://fakestoreapi.com/](https://fakestoreapi.com/)