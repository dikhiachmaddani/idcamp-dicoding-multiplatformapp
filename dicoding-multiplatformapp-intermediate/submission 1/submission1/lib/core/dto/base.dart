class Base {
  final bool? error;
  final String? message;

  Base({required this.error, required this.message});

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(error: json['error'], message: json['message']);
  }

  factory Base.fromMap(Map<String, dynamic> map) {
    return Base(
      error: map['error'] != null ? map['error'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }
}
