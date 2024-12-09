import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_mandatory_request.freezed.dart';
part 'register_mandatory_request.g.dart';



@freezed
class RegisterMandatoryRequest with _$RegisterMandatoryRequest {
  const factory RegisterMandatoryRequest({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'id_card_number') required String idCardNumber,
    @JsonKey(name: 'id_card_image') required String idCardImage,
    @JsonKey(name: 'id_card_address') required String idCardAddress,
    @JsonKey(name: 'id_card_name') required String idCardName,
  }) = _RegisterMandatoryRequest;

  factory RegisterMandatoryRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterMandatoryRequestFromJson(json);
}
