enum StatusReponse {
  error,
  success,
}

class DioResponse<T> {
  final StatusReponse status;
  final T result;
  final T? extra;

  DioResponse(this.status, this.result, {this.extra});
}
