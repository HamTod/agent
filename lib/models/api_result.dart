class ApiResult {
  final int status;
  final dynamic data;

  ApiResult({
    required this.status,
    required this.data,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) {
    return ApiResult(
      status: json['status'],
      data: json['data'],
    );
  }
}
