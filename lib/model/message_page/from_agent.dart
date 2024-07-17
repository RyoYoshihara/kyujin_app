import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'from_agent.freezed.dart';
part 'from_agent.g.dart';


@freezed
class FromAgentState with _$FromAgentState {
  factory FromAgentState({
    @Default(AsyncLoading()) AsyncValue<FromAgentList> fromAgent,
  }) = _FromAgentState;
}

@freezed
class FromAgentList with _$FromAgentList {
  const factory FromAgentList({
    @Default([]) List<FromAgent> messages,
  }) = _FromAgentList;

  factory FromAgentList.fromJson(Map<String, dynamic> json) => _$FromAgentListFromJson(json);
}

@freezed
class FromAgent with _$FromAgent {
  const factory FromAgent({
    required String name,
    required String companyName,
    @Default("") String imageUrl,
    required String content,
    required bool isRead,

  }) = _FromAgent;

  factory FromAgent.fromJson(Map<String, dynamic> json) => _$FromAgentFromJson(json);
}