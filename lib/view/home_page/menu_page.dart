import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
            'その他',
            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white)
        ),
        backgroundColor: Colors.black,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //お知らせ
              const Text(
                "お知らせ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'お知らせ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //アプローチ設定
              const Text(
                "アプローチ設定",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '気になる・スカウト受信',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'ブロック企業',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //通知
              const Text(
                "通知",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Push通知設定',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //その他
              const Text(
                "その他",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'メールマガジン配信設定',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'パスワード変更',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '入社確定連絡(お祝い金申請)',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '違反行為を報告',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'アプリへのご要望・不具合報告',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'ライセンス情報',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'ログアウト',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //利用規約
              const Text(
                "利用規約とデータ利用ポリシー",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '利用規約',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '個人情報の取り扱い',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '利用者情報の外部送信について',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //退会
              const Text(
                "退会",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '退会に関して',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}