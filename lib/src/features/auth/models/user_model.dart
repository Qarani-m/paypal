class UserModel {
 final String name;
 final String phone;
 final String email;
 final String address;
 final String imagePath;
 final bool hasImage;

 UserModel({
   this.name = '',
   this.phone = '',
   this.email = '', 
   this.address = '',
   this.imagePath = '',
   this.hasImage = false,
 });



 factory UserModel.fromJson(Map<String, dynamic> json) {
   return UserModel(
     name: json['name'] as String? ?? '',
     phone: json['phone'] as String? ?? '',
     email: json['email'] as String? ?? '',
     address: json['address'] as String? ?? '',
     imagePath: json['imagePath'] as String? ?? '',
     hasImage: json['hasImage'] as bool? ?? false,
   );
 }

 Map<String, dynamic> toJson() => {
   'name': name,
   'phone': phone,
   'email': email,
   'address': address,
   'imagePath': imagePath,
   'hasImage': hasImage,
 };

 UserModel copyWith({
   String? name,
   String? phone,
   String? email,
   String? address,
   String? imagePath,
   bool? hasImage,
 }) => UserModel(
   name: name ?? this.name,
   phone: phone ?? this.phone,
   email: email ?? this.email,
   address: address ?? this.address,
   imagePath: imagePath ?? this.imagePath,
   hasImage: hasImage ?? this.hasImage,
 );
}