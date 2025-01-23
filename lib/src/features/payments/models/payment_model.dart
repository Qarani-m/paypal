class PaymentModel {
  final String name;
  final String message;
  final String curency;
  final String amount;
  final String email;
  final bool hasProfilePic;

  PaymentModel({
    required this.email,
    required this.name,
    required this.curency,
    required this.message,
    required this.amount,
    required this.hasProfilePic,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      name: json['name'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
      curency: json['curency'] as String,
      amount: json['amount'] as String,
      hasProfilePic: json['hasProfilePic'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'curency': curency,
      'amount': amount,
      'hasProfilePic': hasProfilePic,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'PaymentModel(name: $name, message: $message, email:$email curency: $curency, amount: $amount, hasProfilePic: $hasProfilePic)';
  }

  PaymentModel copyWith({
    String? name,
    String? email,
    String? message,
    String? curency,
    String? amount,
    bool? hasProfilePic,
    bool? hassMessage,
  }) {
    return PaymentModel(
      name: name ?? this.name,
      message: message ?? this.message,
      curency: curency ?? this.curency,
      amount: amount ?? this.amount,
      hasProfilePic: hasProfilePic ?? this.hasProfilePic,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentModel &&
        other.name == name &&
        other.message == message &&
        other.curency == curency &&
        other.amount == amount &&
        other.hasProfilePic == hasProfilePic &&
        other.email == email;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      message,
      curency,
      amount,
      hasProfilePic,
      email,
    );
  }
}
