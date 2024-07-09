import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'from_company.freezed.dart';
part 'from_company.g.dart';

@freezed
class FromCompanyState with _$FromCompanyState {
  factory FromCompanyState({
    @Default(AsyncLoading()) AsyncValue<FromCompanyList> fromCompany,
  }) = _FromCompanyState;
}

@freezed
class FromCompanyList with _$FromCompanyList {
  const factory FromCompanyList({
    @Default(0) int noReadCount,
    @Default([]) List<FromCompany> messages,
  }) = _FromCompanyList;

  factory FromCompanyList.fromJson(Map<String, dynamic> json) => _$FromCompanyListFromJson(json);
}

@freezed
class FromCompany with _$FromCompany {
  const factory FromCompany({
    required String name,
    required String appeal,
    @Default("") String imageUrl,
    required String recruitmentDetails,
    required String salary,
    required bool isOfficial,
    required bool isRead,

  }) = _FromCompany;

  factory FromCompany.fromJson(Map<String, dynamic> json) => _$FromCompanyFromJson(json);
}