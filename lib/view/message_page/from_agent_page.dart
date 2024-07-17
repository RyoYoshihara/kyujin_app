import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/image_manager.dart';
import '../../model/message_page/from_agent.dart';
import '../../viewmodel/message_page/from_agent_page_viewmodel.dart';

class FromAgentPage extends ConsumerWidget {
  const FromAgentPage({super.key});

  Future<void> _refresh() async {

    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fromAgentViewModelProvider);
    // TODO: implement build
    return RefreshIndicator(
      onRefresh: _refresh,
      child: state.fromAgent.when(
        data: (value) => MessageList(value.messages),
        error: (_, __) => Container(),
        loading: () => const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}

class MessageList extends ConsumerWidget {
  final List<FromAgent> messages;
  const MessageList(this.messages, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight,minWidth: constraints.maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                  messages.length,
                      (index) => _messageWidget(messages[index])
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Widget _messageWidget(FromAgent fromAgent) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Row(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: fromAgent.imageUrl.isNotEmpty
                    ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(fromAgent.imageUrl),
                )
                    : const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageManager.noImage),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fromAgent.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    fromAgent.companyName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    fromAgent.content,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      if (!fromAgent.isRead)
        Positioned(
          top: 25,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
    ],
  );
}
