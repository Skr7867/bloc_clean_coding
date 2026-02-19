class AppExceptions implements Exception {
  final String message;

  const AppExceptions(this.message);

  @override
  String toString() => message;
}

class InternetException extends AppExceptions {
  const InternetException([String message = 'No Internet Connection'])
    : super(message);
}

class RequestTimeOut extends AppExceptions {
  const RequestTimeOut([String message = 'Request Timed Out']) : super(message);
}

class ServerException extends AppExceptions {
  const ServerException([String message = 'Internal Server Error'])
    : super(message);
}

class UnauthorisedException extends AppExceptions {
  const UnauthorisedException([
    String message = 'You do not have access to this resource',
  ]) : super(message);
}

class InvalidUrl extends AppExceptions {
  const InvalidUrl([String message = 'Invalid URL']) : super(message);
}

class FetchDataException extends AppExceptions {
  const FetchDataException([String message = 'Something went wrong'])
    : super(message);
}
