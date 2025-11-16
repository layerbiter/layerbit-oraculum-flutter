import 'package:json_annotation/json_annotation.dart';
part 'user_data_response_model.g.dart';

@JsonSerializable()
class UserDataResponse {
  UserDataResponse({
    required this.name,
    required this.token,
  });

  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'token')
  String token;

  UserDataResponse.empty()
      : name = '',
        token = '';
  
  factory UserDataResponse.fromJson(Map<String, dynamic> json) => _$UserDataResponseFromJson(json);
}
