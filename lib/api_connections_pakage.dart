library ;

// Exponer API principal
export 'api/cart_api.dart';
export 'api/product_api.dart';
export 'api/user_api.dart';
export 'api/fakeStoreApi.dart';

//  modelos
export 'domain/entities/product.dart';
export 'domain/entities/cart.dart';
export 'domain/entities/user.dart';

// errores
export 'core/error/failure.dart';

// Repositorios para realizar moks
export 'domain/repositories/cart_repository.dart';
export 'domain/repositories/product_repository.dart';
export 'domain/repositories/user_repository.dart';

