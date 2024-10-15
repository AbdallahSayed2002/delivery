import 'package:hive/hive.dart';

part 'user_model.g.dart'; // Required for code generation

@HiveType(typeId: 0) // Define the type ID for the model
class UserModel extends HiveObject {
  @HiveField(0)
  late String? image;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? password;

  @HiveField(4)
  final String? phone;

  @HiveField(5)
  final String? id;

  @HiveField(6) // Ensure no gaps in field numbering
  final String? verifyCode;

  @HiveField(7) // Updated to be sequential
  late String? provide;

  UserModel({
    this.image,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.id,
    this.verifyCode,
    this.provide,
  });
}
