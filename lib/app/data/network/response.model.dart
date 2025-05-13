class Response<T> {
  final int? statusCode;
  final T? payload;

  Response({required this.statusCode, required this.payload});

  bool get success => statusCode! <= 200;
}