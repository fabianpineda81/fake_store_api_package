


import 'package:api_connections_package/core/error/failure_severity.dart';

class Failure {
  final String title;
  final String code;
  final String description;
  final FailureSeverity type;
  final String  stackTrace;

  const Failure({
    required this.title,
    required this.code,
    required this.description,
    required this.type,
    required this.stackTrace,
  });

  @override
  String toString() {
  return '''
    🔴 FAILURE DETECTED
    ──────────────────────────────
    🔸 Title      : $title
    🔸 Code       : $code
    🔸 Type       : ${type.name.toUpperCase()}
    🔸 Description: $description
    🔸 StackTrace : ${stackTrace.isNotEmpty ? stackTrace : 'No stack trace provided'}
    ──────────────────────────────
    ''';
  }



  factory Failure.general({required String description, String stackTrace=""}) {
    return Failure(
      title: 'Error general',
      code: 'general_error',
      description: description,
      type: FailureSeverity.blocking,
      stackTrace: stackTrace,

    );
  }

  factory Failure.network({required String description, String stackTrace=""}) {
    return Failure(
      title: 'Error de red',
      code: 'network_error',
      description: description,
      type: FailureSeverity.blocking,
      stackTrace: stackTrace,
    );
  }

  factory Failure.server({required String description, String stackTrace=""}) {
    return Failure(
      title: 'Error del servidor',
      code: 'server_error',
      description: description,
      type: FailureSeverity.warning,
      stackTrace: stackTrace,
    );
  }



  factory Failure.info({required String description, String stackTrace=""}) {
    return Failure(
      title: 'Información',
      code: 'info_message',
      description: description,
      type: FailureSeverity.info,
      stackTrace: stackTrace,
    );
  }


}

