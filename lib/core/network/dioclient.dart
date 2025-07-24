import 'package:dio/dio.dart';
import '../error/failure.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio =
      Dio(BaseOptions(
        baseUrl: 'https://fakestoreapi.com',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        responseType: ResponseType.json,
      ));

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e, stackTrace) {
      throw _handleDioError(e, stackTrace.toString());
    } catch (e, stackTrace) {
      throw Failure.general(description: e.toString(), stackTrace: stackTrace.toString());
    }
  }

  Future<Response> post(String path, {dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e, stackTrace) {
      throw _handleDioError(e, stackTrace.toString());
    } catch (e) {
      throw Failure.general(description: e.toString());
    }
  }

  Future<Response> put(
      String path, {
        dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e, stackTrace) {
      throw _handleDioError(e, stackTrace.toString());
    } catch (e) {
      throw Failure.general(description: e.toString());
    }
  }

  Future<Response> delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e, stackTrace) {
      throw _handleDioError(e, stackTrace.toString());
    } catch (e, stackTrace) {
      throw Failure.general(description: e.toString(), stackTrace: stackTrace.toString());
    }
  }

  Failure _handleDioError(DioException e,String stackTrace) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return Failure.network(description: 'Tiempo de conexión agotado');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return Failure.network(description: 'Tiempo de espera agotado');
    } else if (e.response != null) {
      return Failure.server(
        description:
        'Error del servidor (${e.response?.statusCode}): ${e.response?.statusMessage}',
        stackTrace: stackTrace,
      );
    } else {
      return Failure.network(
        description: e.message ?? 'Error desconocido de red',
      );
    }
  }
}



