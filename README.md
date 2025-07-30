# 📦 api_connections_package

`api_connections_package` es un paquete Flutter que proporciona una capa de abstracción para conectarse fácilmente con la [Fake Store API](https://fakestoreapi.com/) utilizando `Dio` y `dartz`. Está pensado para que puedas integrarlo rápida y limpiamente en tus aplicaciones Flutter.

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

### 🔹 Inicialización

El paquete cuenta con una **única puerta de entrada** llamada `FakeStoreApi`.  
Desde esta instancia puedes acceder a `products`, `users` y `carts`:

```dart
final store = FakeStoreApi();
```

Si necesitas usar tus propios repositorios (por ejemplo, para pruebas), puedes pasarlos como parámetros:

```dart
final store = FakeStoreApi(
  productRepository: MyCustomProductRepository(),
  userRepository: MyCustomUserRepository(),
  cartRepository: MyCustomCartRepository(),
);
```

---

### 🔹 Productos

```dart
// Obtener todos los productos
final result = await store.products.getAllProducts();

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (products) => print('Productos: $products'),
);

// Obtener producto por ID
final resultById = await store.products.getProductById(1);

resultById.fold(
  (failure) => print('Error: ${failure.message}'),
  (product) => print('Producto: $product'),
);
```

---

### 🔹 Usuarios

```dart
// Obtener todos los usuarios
final result = await store.users.getAllUsers();

result.fold(
  (failure) => print('Error: ${failure.message}'),
  (users) => print('Usuarios: $users'),
);

// Obtener usuario por ID
final result2 = await store.users.getUserById(1);

result2.fold(
  (failure) => print('Error: ${failure.message}'),
  (user) => print('Usuario: $user'),
);
```

---

### 🔹 Carritos

```dart
// Obtener carrito por ID
final result2 = await store.carts.getCartById(2);

result2.fold(
  (failure) => print('Error: ${failure.message}'),
  (cart) => print('Carrito: $cart'),
);
```

---

## 🧪 Pruebas

Este paquete está preparado para pruebas.  
Puedes pasar **repositorios mock** al crear la instancia de `FakeStoreApi`:

```dart
import 'package:api_connections_package/api_connections_package.dart';
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
    final store = FakeStoreApi(productRepository: MockProductRepository());

    final result = await store.products.getAllProducts();

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
