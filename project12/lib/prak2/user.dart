import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? id;

  @JsonKey(name: 'full_name')
  final String? name;

  final String? email;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  User({
    this.id,
    this.name,
    this.email,
    this.createdAt,
  });

  /// FROM JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// TO JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}