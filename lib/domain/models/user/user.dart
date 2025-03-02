import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable()
class User with _$User {
  const User({required this.name, required this.picture});

  /// The user's name.
  @override
  final String name;

  /// The user's picture URL.
  @override
  final String picture;

  /// Factory constructor for creating a User from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Converts the User object to a JSON map.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
