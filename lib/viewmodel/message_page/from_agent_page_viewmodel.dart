import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/message_page/from_agent.dart';
import '../../repository/api_error_model.dart';
import '../../repository/message_page/from_agent_repo.dart';
import '../view_model.dart';

final fromAgentViewModelProvider =
StateNotifierProvider<FromAgentViewModel, FromAgentState>(
        (ref) => FromAgentViewModel(ref)
      ..setErrorBinding()
      ..getMessages()
);

class FromAgentViewModel extends ViewModel<FromAgentState>{
  late final StateNotifierProviderRef ref;
  FromAgentViewModel(this.ref) : super(state: FromAgentState());

  //メッセージリストの取得
  Future<void> getMessages() async {

    ///TODO: 自身のユーザーIDもしくは判別できる要素を入れる
    String userID = "";

    try {
      final FromAgentList result = await FromAgentRepo().getMessages(userID);
      state = state.copyWith(fromAgent: AsyncData(result));
    } on ApiErrorModel catch (error, stackTrace) {
      final finishErrorHandling = await error.apiErrorCommonHandling();
      if (finishErrorHandling) {
        return;
      }
      state = state.copyWith(fromAgent: AsyncError(error, stackTrace));
    }

  }
}