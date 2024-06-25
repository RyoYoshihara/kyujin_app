import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/extension.dart';
import '../../model/home_page/profile.dart';
import '../../viewmodel/home_page/profile_page_viewmodel.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final viewModel = ref.watch(profileViewModelProvider.notifier);
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

  Future<void> _refresh() async {
    final viewModel = ref.watch(profileViewModelProvider.notifier);
    viewModel.getMyProfile();
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    Profile profileInfo = widget.profileInfo;
    //final viewModel = ref.watch(profileViewModelProvider.notifier);
    return RefreshIndicator(
      onRefresh: _refresh,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight,minWidth: constraints.maxWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //名前
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                        onPressed: ()=> print(1),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "氏名",
                                  style: TextStyle(
                                      color: Colors.lime,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "${profileInfo.user?.family} ${profileInfo.user?.name}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),

                    //住所
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "住所",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${profileInfo.address?.prefecture}${profileInfo.address?.other}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //電話番号
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "電話番号",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${profileInfo.tel}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //メールアドレス
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed:(){},
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'メールアドレス ',
                                      style: TextStyle(
                                        color: Colors.lime, // メールアドレスの部分の色
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '※編集できません',
                                      style: TextStyle(
                                        color: Colors.grey, // ※編集できませんの部分の色
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${profileInfo.email}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //生年月日
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "生年月日",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                getFullDate(profileInfo.birthDay),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //性別
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "性別",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                profileInfo.toString()=="0" ? "女性" : "男性",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //最終学歴
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "最終学歴",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${profileInfo.lastAcademic?.name}"
                                "${profileInfo.lastAcademic?.category} "
                                "${profileInfo.lastAcademic?.subject} "
                                "${profileInfo.lastAcademic?.graduation} ",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //語学スキル
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "語学スキル",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "母国語：${profileInfo.language?.motherTongue}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                              Text(
                                "・${profileInfo.language?.other}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                              Text(
                                "TOEIC：${profileInfo.language?.toeic == "0" ? "未入力" : profileInfo.language?.toeic.toString()}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                              Text(
                                "TOEFL：${profileInfo.language?.toefl == "0" ? "未入力" : profileInfo.language?.toeic.toString()}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //資格
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "資格",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              profileInfo.qualification == ""
                              ? const Text(
                                  "未入力",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                )
                              : Text(
                                "${profileInfo.qualification}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //配偶者
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "配偶者",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                profileInfo.spouse == 0 ? "なし" : "あり",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //年収
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // 角の半径を16.0に設定
                        ),
                      ),
                      onPressed: ()=> print(1),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "年収",
                                style: TextStyle(
                                    color: Colors.lime,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${profileInfo.income}万円",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}