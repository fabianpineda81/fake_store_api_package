library ;

// Exponer APIs principales
export 'api/cart_api.dart';
export 'api/product_api.dart';
export 'api/user_api.dart';

// Exponer modelos si deseas que puedan usarlos directamente
export 'domain/entities/product.dart';
export 'domain/entities/cart.dart';
export 'domain/entities/user.dart';

// Exponer errores comunes si es útil
export 'core/error/failure.dart';

// Exponer Respitoris para realizar moks
export 'domain/repositories/cart_repository.dart';
export 'domain/repositories/product_repository.dart';
export 'domain/repositories/user_repository.dart';

