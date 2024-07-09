import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/message_page/from_company.dart';
import '../../repository/api_error_model.dart';
import '../../repository/message_page/from_company_repo.dart';
import '../../view/view_model.dart';

final fromCompanyViewModelProvider =
StateNotifierProvider<FromCompanyViewModel, FromCompanyState>(
        (ref) => FromCompanyViewModel(ref)
      ..setErrorBinding()
      ..getMessages()
);

class FromCompanyViewModel extends ViewModel<FromCompanyState>{
  late final StateNotifierProviderRef ref;
  FromCompanyViewModel(this.ref) : super(state: FromCompanyState());

  //メッセージリストの取得
  Future<void> getMessages() async {

    ///TODO: 自身のユーザーIDもしくは判別できる要素を入れる
    String userID = "";

    try {
      final FromCompanyList result = await FromCompanyRepo().getMessages(userID);
      state = state.copyWith(fromCompany: AsyncData(result));
    } on ApiErrorModel catch (error, stackTrace) {
      final finishErrorHandling = await error.apiErrorCommonHandling();
      if (finishErrorHandling) {
        return;
      }
      state = state.copyWith(fromCompany: AsyncError(error, stackTrace));
    }

  }
}