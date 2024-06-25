import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required User user,
    required Address address,
    required String tel,
    required String email,
    required String birthDay,
    required int sex,
    required LastAcademic lastAcademic,
    required Language language,
    required String qualification,
    required int spouse,
    required int income,
    required List<Corporate> corporate,
    required List<String> industry,
    required List<String> occupation,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String family,
    required String name,
    required String kanaFamily,
    required String kanaName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    required String prefecture,
    required String other,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class LastAcademic with _$LastAcademic {
  const factory LastAcademic({
    required String name,
    required String category,
    required String subject,
    required String graduation,
  }) = _LastAcademic;

  factory LastAcademic.fromJson(Map<String, dynamic> json) => _$LastAcademicFromJson(json);
}

@freezed
class Language with _$Language {
  const factory Language({
    required String motherTongue,
    required String other,
    required String toeic,
    required String toefl,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}

@freezed
class Corporate with _$Corporate {
  const factory Corporate({
    required String name,
    required String position,
    required String start,
    required String end,
  }) = _Corporate;

  factory Corporate.fromJson(Map<String, dynamic> json) => _$CorporateFromJson(json);
}