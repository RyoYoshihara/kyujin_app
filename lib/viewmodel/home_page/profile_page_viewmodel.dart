
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/home_page/profile.dart';
import '../../repository/api_error_model.dart';
import '../../repository/home_page/profile_repo.dart';
import '../view_model.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
    (ref) => ProfileViewModel(ref)
        ..setErrorBinding()
        ..getMyProfile()
);

class ProfileViewModel extends ViewModel<ProfileState>{
  late final StateNotifierProviderRef ref;

  ProfileViewModel(this.ref) : super(state: ProfileState());

  //プロフィール情報の取得
  Future<void> getMyProfile() async {

    ///TODO: 自身のユーザーIDもしくは判別できる要素を入れる
    String userID = "";

    try {
      final Profile result = await ProfileRepo().getProfile(userID);
      state = state.copyWith(profile: AsyncData(result));
    } on ApiErrorModel catch (error, stackTrace) {
      final finishErrorHandling = await error.apiErrorCommonHandling();
      if (finishErrorHandling) {
        return;
      }
      state = state.copyWith(profile: AsyncError(error, stackTrace));
    }

  }
}