


class NetworkError implements Exception {
  final String message;
  final int? statusCode;
  final String? url;
  final dynamic originalException;

  NetworkError({
    this.message = "Network error occurred",
    this.statusCode,
    this.url,
    this.originalException,
  });

  @override
  String toString() {
    String errorDetails = "NetworkError: $message";

    if (statusCode != null) {
      errorDetails += " (Status Code: $statusCode)";
    }

    if (url != null) {
      errorDetails += "\nURL: $url";
    }

    if (originalException != null) {
      errorDetails += "\nOriginal Exception: $originalException";
    }

    return errorDetails;
  }
}

