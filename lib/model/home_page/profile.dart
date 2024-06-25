import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(AsyncLoading()) AsyncValue<Profile> profile,
  }) = _ProfileState;
}

@freezed
class Profile with _$Profile {
  const factory Profile({
    required User user,
    required Address address,
    @Default("") String tel,
    @Default("") String email,
    @Default("") String birthDay,
    @Default(0) int sex,
    required LastAcademic lastAcademic,
    required Language language,
    @Default("") String qualification,
    @Default(0) int spouse,
    @Default(0) int income,
    @Default([]) List<Corporate> corporate,
    @Default([]) List<String> industry,
    @Default([]) List<String> occupation,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default("") String family,
    @Default("") String name,
    @Default("") String kanaFamily,
    @Default("") String kanaName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @Default("") String prefecture,
    @Default("") String other,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class LastAcademic with _$LastAcademic {
  const factory LastAcademic({
    @Default("") String name,
    @Default("") String category,
    @Default("") String subject,
    @Default("") String graduation,
  }) = _LastAcademic;

  factory LastAcademic.fromJson(Map<String, dynamic> json) => _$LastAcademicFromJson(json);
}

@freezed
class Language with _$Language {
  const factory Language({
    @Default("") String motherTongue,
    @Default("") String other,
    @Default("") String toeic,
    @Default("") String toefl,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}

@freezed
class Corporate with _$Corporate {
  const factory Corporate({
    @Default("") String name,
    @Default("") String position,
    @Default("") String start,
    @Default("") String end,
  }) = _Corporate;

  factory Corporate.fromJson(Map<String, dynamic> json) => _$CorporateFromJson(json);
}
