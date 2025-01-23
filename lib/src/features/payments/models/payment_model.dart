class PaymentModel {
  final String name;
  final String message;
  final String curency;
  final String amount;
  final String date;
  final String time;
  final String email;
  final String exchangeRate;
  final String payPalFee;
  final String direction;


  final String type;
  final bool hasProfilePic;
  final String transactionCode;


  PaymentModel( {
    required this.email,
    required this.transactionCode,
    required this.name,
    required this.curency,
    required this.direction,
    required this.message,
    required this.amount,
    required this.hasProfilePic,
    required this.date,
    required this.time,
    required this.type,
    required this.exchangeRate,
    required this.payPalFee,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      name: json['name'] as String,
      transactionCode: json['transactionCode'] as String,
      date: json['date'] as String,
      direction: json['direction'] as String,
      time: json['time'] as String,
      type: json['type'] as String,
      exchangeRate: json['exchangeRate'] as String,
      payPalFee: json['payPalFee'] as String,
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
      'transactionCode': transactionCode,
      'exchangeRate': exchangeRate,
      'type': type,
      'payPalFee': payPalFee,
      'date':date,
      'time': time,
      'direction': time,
      'curency': curency,
      'amount': amount,
      'hasProfilePic': hasProfilePic,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'PaymentModel(name: $name, message: $message, email:$email curency: $curency, amount: $amount, hasProfilePic: $hasProfilePic, time:$time, date:$date,code:$transactionCode, payPalFee:$payPalFee, exchangeRate:$exchangeRate type:$type)';
  }

  PaymentModel copyWith({
    String? name,
    String? email,
    String? transactionCode,
    String? date,
    String? type,
    String? time,
    String? exchangeRate,
    String? payPalFee,
    String? direction,
    String? message,
    String? curency,
    String? amount,
    bool? hasProfilePic,
    bool? hassMessage,
  }) {
    return PaymentModel(
      name: name ?? this.name,
      transactionCode: name ?? this.transactionCode,
      date: date ?? this.date,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      payPalFee: payPalFee ?? this.payPalFee,
      time: time ?? this.time,
      direction: direction ?? this.direction,
      type: type ?? this.time,
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
        other.transactionCode == transactionCode &&
        other.date == date &&
        other.exchangeRate == exchangeRate &&
        other.payPalFee == payPalFee &&
        other.direction == direction &&
        other.time == time &&
        other.curency == curency &&
        other.type == type &&
        other.amount == amount &&
        other.hasProfilePic == hasProfilePic &&
        other.email == email;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      message,
      payPalFee,
      exchangeRate,
      type,
      transactionCode,
      date,
      direction,
      time,
      curency,
      amount,
      hasProfilePic,
      email,
    );
  }
}
