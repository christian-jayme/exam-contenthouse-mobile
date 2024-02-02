class Exam {
  final int statusCode;
  final String? image;
  final String? message;
  final String? errorMessage;
  final int? count;

  Exam({
    required this.statusCode,
    required this.image,
    required this.message,
    required this.errorMessage,
    required this.count,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      statusCode: json['status_code'],
      image: json['image'],
      message: json['message'],
      errorMessage: json['error_message'],
      count: json['count'],
    );
  }
}

extension NetworkResponse on Exam {
  bool get isSuccess {
    return statusCode == 200;
  }
}