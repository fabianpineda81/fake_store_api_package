# Changelog

All notable changes to this project will be documented in this file.

## [0.0.1] - Initial Release

### Added
- 🎉 Primera versión del paquete `fake_store_api_package`.
- ✅ Obtener todos los productos.
- 🔍 Buscar un producto por ID.
- 👤 Obtener todos los usuarios.
- 👤 Buscar usuario por ID.
- 🛒 Consultar todos los carritos de compras.
- 🛒 Buscar carrito por ID.
- 🛒 Consultar carritos por usuario.
- 📅 Consultar carritos entre fechas.
- 💥 Manejo de errores con Either (dartz).
- 📦 Estructura inmutable y desacoplada.
- 🔄 Posibilidad de usar repositorios personalizados.
- ✅ Preparado para pruebas unitarias.

## [0.0.2] - 2025-07-28

### Added
- 📚 Se mejoró la visualización del `example` para mayor claridad.

## [0.0.3] - 2025-07-29

### Added
- 📝 Se agregaron comentarios descriptivos en el `example`.

## [0.0.4] - 2025-07-30

### 🚀 Mejoras importantes en la API pública

- **Nueva estructura con identidad unificada:** ahora el paquete cuenta con una única puerta de entrada:
  ```dart
  final store = FakeStoreApi();
  ```
  Desde esta instancia se puede acceder a:
    - `store.products`
    - `store.users`
    - `store.carts`

- **Uso más intuitivo y consistente** para acceder a los recursos de la Fake Store API.

- **Soporte para repositorios personalizados**: se pueden inyectar implementaciones propias para pruebas o personalización:
  ```dart
  final store = FakeStoreApi(
    productRepository: MyCustomProductRepository(),
    userRepository: MyCustomUserRepository(),
    cartRepository: MyCustomCartRepository(),
  );
  ```

- **Compatibilidad con la versión anterior**: las clases `ProductApi`, `UserApi` y `CartApi` siguen estando disponibles para instanciarse directamente si se desea.

### 💥 Nota
Si estabas usando la API directamente así:
```dart
final productApi = ProductApi();
```
Ahora se recomienda migrar a:
```dart
final store = FakeStoreApi();
final products = await store.products.getAllProducts();
```
