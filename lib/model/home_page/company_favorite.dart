import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'company_favorite.freezed.dart';
part 'company_favorite.g.dart';

@freezed
class CompanyFavoriteState with _$CompanyFavoriteState {
  factory CompanyFavoriteState({
    @Default(AsyncLoading()) AsyncValue<FavoriteCompanyList> favoriteCompany,
  }) = _CompanyFavoriteState;
}

@freezed
class FavoriteCompanyList with _$FavoriteCompanyList {
  const factory FavoriteCompanyList({
    @Default([]) List<FavoriteCompany> favoriteCompany,
  }) = _FavoriteCompanyList;

  factory FavoriteCompanyList.fromJson(Map<String, dynamic> json) => _$FavoriteCompanyListFromJson(json);
}

@freezed
class FavoriteCompany with _$FavoriteCompany {
  const factory FavoriteCompany({
    required String name,
    @Default([]) List<String> companyPoints,
    @Default("") String imageUrl,
    required String title,
    required String salary,
    @Default([]) List<String> workLocation,
    @Default([]) List<String> tags,

  }) = _FavoriteCompany;

  factory FavoriteCompany.fromJson(Map<String, dynamic> json) => _$FavoriteCompanyFromJson(json);
}