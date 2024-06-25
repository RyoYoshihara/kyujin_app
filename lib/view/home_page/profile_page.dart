import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/home_page/profile.dart';
import '../../viewmodel/home_page/profile_page_viewmodel.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(profileViewModelProvider.notifier);
    final state = ref.watch(profileViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
            'プロフィール',
            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white)
        ),
        backgroundColor: Colors.black,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Dividerの高さを設定
          child: Divider(
            height: 1.0, // Dividerの高さを設定
            thickness: 1.0, // Dividerの厚さを設定
            color: Colors.grey, // Dividerの色を設定
          ),
        ),
      ),
      body: state.profile.when(
          data: (data) => _ProfilePageContent(data),
          error: (_, __) => Container(),
          loading: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
      ),
    );
  }
}

class _ProfilePageContent extends ConsumerStatefulWidget{

  const _ProfilePageContent(this.profileInfo);
  final Profile profileInfo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfilePageContentState();

}

class _ProfilePageContentState extends ConsumerState<_ProfilePageContent>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(profileViewModelProvider.notifier);
    return Container();
  }
}