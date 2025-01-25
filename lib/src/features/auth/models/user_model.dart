class UserModel {
  final String name;
  final String phone;
  final String email;
  final String currency;
  final String address;
  final String imagePath;
  final bool hasImage;
  final String balance;

  UserModel({
    this.balance = ' ',
    this.name = ' ',
    this.phone = ' ',
    this.email = ' ',
    this.currency = ' ',
    this.address = ' ',
    this.imagePath = ' ',
    this.hasImage = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      balance: json['balance'] as String? ?? '',
      hasImage: json['hasImage'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'balance': balance,
        'currency': currency,
        'imagePath': imagePath,
        'hasImage': hasImage,
      };

  UserModel copyWith({
    String? balance,
    String? name,
    String? phone,
    String? email,
    String? currency,
    String? address,
    String? imagePath,
    bool? hasImage,
  }) =>
      UserModel(
        balance: balance ?? this.balance,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        address: address ?? this.address,
        imagePath: imagePath ?? this.imagePath,
        hasImage: hasImage ?? this.hasImage,
        currency:currency ?? this.currency,
      );
}
